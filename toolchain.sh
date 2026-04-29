#!/bin/bash

# ============================================================================
# toolchain.sh - End-to-End Pipeline: C -> MLIR -> LLVM IR -> RISC-V -> GVSoC
#
# Pipeline (7 steps from the report):
#   1. C -> MLIR          (cgeist / Polygeist LLVM 18)
#   2. MLIR lowering      (mlir-opt / Polygeist LLVM 18)
#   3. MLIR -> LLVM IR    (mlir-translate / Polygeist LLVM 18)
#   4. LLVM IR -> ASM     (llc / PULP LLVM 15)
#   5. ASM -> object      (clang / PULP LLVM 15)
#   6. Link -> ELF        (ld.lld / PULP LLVM 15)
#   7. Execute on GVSoC
#
# Usage:
#   ./toolchain.sh <file.c>                      # rv32 single-core (default)
#   ./toolchain.sh <file.c> pulp-open             # pulp-open multi-core
# ============================================================================

set -e

# Portable sed -i (works on GNU and BSD/macOS)
sedi() {
    if sed --version 2>/dev/null | grep -q GNU; then
        sed -i "$@"
    else
        sed -i '' "$@"
    fi
}

if [ -z "$1" ]; then
    echo "Error: No source file provided."
    echo "Usage: ./toolchain.sh <file.c> [rv32|pulp-open]"
    exit 1
fi

INPUT_FILE="$1"
TARGET="${2:-rv32}"
BASENAME=$(basename "$INPUT_FILE" | cut -d. -f1)

# Validate target argument
if [ "$TARGET" != "rv32" ] && [ "$TARGET" != "pulp-open" ]; then
    echo "Error: Invalid target '$TARGET'. Use 'rv32' or 'pulp-open'."
    echo "Usage: ./toolchain.sh <file.c> [rv32|pulp-open]"
    exit 1
fi

# ==========================================
# PATH CONFIGURATIONS
# ==========================================
PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Polygeist (LLVM 18) - Frontend & MLIR tools
POLYGEIST_BIN="${PROJECT_DIR}/Polygeist/build/bin"
CGEIST="${POLYGEIST_BIN}/cgeist"
MLIR_OPT="${POLYGEIST_BIN}/mlir-opt"
MLIR_TRANSLATE="${POLYGEIST_BIN}/mlir-translate"

# PULP LLVM 15 - Backend tools
PULP_BIN="${PROJECT_DIR}/pulp-llvm/build/bin"
LLC="${PULP_BIN}/llc"
CLANG="${PULP_BIN}/clang"
LLD="${PULP_BIN}/ld.lld"

# GVSoC environment
GVSOC_ENV="${PROJECT_DIR}/gvsoc/sourceme.sh"

# Common directories
COMMON_DIR="${PROJECT_DIR}/benchmarks/common"
BUILD_DIR="${PROJECT_DIR}/benchmarks/build"

# RISC-V target configuration
RISCV_TRIPLE="riscv32-unknown-elf"
RISCV_MARCH="rv32imfc"
RISCV_MATTR="+m,+f,+c"
RISCV_DATALAYOUT="e-m:e-p:32:32-i64:64-n32-S128"

# Per-target runtime file selection (matches Makefile)
if [ "$TARGET" = "pulp-open" ]; then
    CRT0_SRC="${COMMON_DIR}/crt0_pulp.S"
    SYSCALLS_SRC="${COMMON_DIR}/syscalls_pulp.c"
    OMP_SRC="${COMMON_DIR}/pulp_omp_runtime.c"
    LDSCRIPT="${COMMON_DIR}/link_pulp.ld"
    GVSOC_TARGET="pulp-open"
else
    CRT0_SRC="${COMMON_DIR}/crt0.S"
    SYSCALLS_SRC="${COMMON_DIR}/syscalls.c"
    OMP_SRC="${COMMON_DIR}/omp_runtime.c"
    LDSCRIPT="${COMMON_DIR}/link.ld"
    GVSOC_TARGET="rv32"
fi

# Cross-compilation flags for runtime files (matches Makefile)
CROSS_CFLAGS="--target=${RISCV_TRIPLE} -march=${RISCV_MARCH} -mabi=ilp32f -Os -fno-builtin -ffreestanding -nostdlib -mno-relax"

# Intermediate files
MLIR_FILE="${BASENAME}.mlir"
LOWERED_MLIR="${BASENAME}_lowered.mlir"
LLVM_IR="${BASENAME}.ll"
ASM_FILE="${BASENAME}.s"
OBJ_FILE="${BASENAME}.o"
ELF_FILE="${BASENAME}.elf"

# ==========================================
# AUTO-DETECT POLYBENCH-ACC FILES
# ==========================================
# Original PolyBench-ACC files need extra include paths, defines, and
# libc stubs (for fprintf/strcmp referenced in print_array/polybench_prevent_dce).
POLYBENCH_UTILS="${PROJECT_DIR}/PolyBench-ACC/OpenMP/utilities"
CGEIST_EXTRA_FLAGS=""
NEED_LIBC_STUBS=0

INPUT_ABS=$(realpath "$INPUT_FILE")
CGEIST_INPUT="$INPUT_FILE"
if echo "$INPUT_ABS" | grep -q "PolyBench-ACC"; then
    echo "[info] Detected PolyBench-ACC source — adding include paths and bare-metal defines."
    CGEIST_EXTRA_FLAGS="-I${POLYBENCH_UTILS} -DMINI_DATASET -DDATA_TYPE=float -DDATA_PRINTF_MODIFIER=\"%0.2f\" -DPOLYBENCH_STACK_ARRAYS"
    NEED_LIBC_STUBS=1

    # Sanitize the source for bare-metal compilation:
    # Original PolyBench files include <stdio.h> etc. that produce
    # complex types (FILE struct) unsupported by MLIR's memref system.
    # We strip system includes and inject minimal bare-metal stubs.
    SANITIZED="${BASENAME}_sanitized.c"
    {
        # Inject bare-metal stubs at the top
        cat <<'STUBS'
/* Bare-metal stubs injected by toolchain.sh */
typedef int FILE;
static FILE _stderr_dummy;
#define stderr (&_stderr_dummy)
#define fprintf(...) ((void)0)
#define printf(...) ((void)0)
#ifndef M_PI
#define M_PI 3.14159265358979323846f
#endif
static inline int strcmp(const char *a, const char *b) { (void)a; (void)b; return 1; }
STUBS
        # Strip system includes, keep everything else
        sed \
            -e '/^#include <stdio\.h>/d' \
            -e '/^#include <unistd\.h>/d' \
            -e '/^#include <string\.h>/d' \
            -e '/^#include <math\.h>/d' \
            -e '/^#include <stdlib\.h>/d' \
            "$INPUT_FILE"
    } > "$SANITIZED"
    CGEIST_INPUT="$SANITIZED"
fi

echo "================================================="
echo " End-to-End Pipeline: C -> MLIR -> RISC-V -> GVSoC"
echo " Target: ${GVSOC_TARGET} | Input: ${INPUT_FILE}"
echo "================================================="

# --- STEP 1: C to MLIR (Polygeist / cgeist) ---
echo "[1/7] C -> MLIR (cgeist)..."
"$CGEIST" "$CGEIST_INPUT" -fopenmp -S -function=* -raise-scf-to-affine \
    -I"$(dirname "$INPUT_FILE")" \
    ${CGEIST_EXTRA_FLAGS} \
    -o "$MLIR_FILE"

# --- STEP 2: MLIR Lowering (mlir-opt) ---
# Pass order per report: lower-affine -> scf-to-cf -> openmp-to-llvm ->
#   finalize-memref-to-llvm -> convert-func-to-llvm -> convert-arith-to-llvm ->
#   convert-cf-to-llvm -> reconcile-unrealized-casts
echo "[2/7] MLIR lowering (mlir-opt)..."
"$MLIR_OPT" "$MLIR_FILE" \
    --lower-affine \
    --convert-scf-to-cf \
    --convert-openmp-to-llvm \
    --finalize-memref-to-llvm \
    --convert-func-to-llvm \
    --convert-arith-to-llvm \
    --convert-math-to-llvm \
    --convert-cf-to-llvm \
    --reconcile-unrealized-casts \
    -o "$LOWERED_MLIR"

# --- STEP 3: MLIR -> LLVM IR (mlir-translate) ---
echo "[3/7] MLIR -> LLVM IR (mlir-translate)..."
"$MLIR_TRANSLATE" --mlir-to-llvmir "$LOWERED_MLIR" -o "$LLVM_IR"

# Patch target triple and data layout (cgeist defaults to host x86_64)
sedi "s|target triple = \"[^\"]*\"|target triple = \"${RISCV_TRIPLE}\"|" "$LLVM_IR"
sedi "s|target datalayout = \"[^\"]*\"|target datalayout = \"${RISCV_DATALAYOUT}\"|" "$LLVM_IR"

# --- STEP 4: LLVM IR -> RISC-V Assembly (PULP LLVM llc) ---
echo "[4/7] LLVM IR -> RISC-V assembly (llc)..."
"$LLC" -march=riscv32 -mattr=${RISCV_MATTR} -target-abi=ilp32f \
    -opaque-pointers "$LLVM_IR" -o "$ASM_FILE"

# --- STEP 5: Assemble kernel -> object file (PULP LLVM clang) ---
echo "[5/7] Assemble -> object file (clang)..."
"$CLANG" --target=${RISCV_TRIPLE} -march=${RISCV_MARCH} -mabi=ilp32f \
    -c "$ASM_FILE" -o "$OBJ_FILE"

# --- STEP 6: Compile runtime & Link -> ELF (PULP LLVM clang + ld.lld) ---
echo "[6/7] Compile runtime & link -> ELF (ld.lld)..."

# Compile runtime support files
"$CLANG" ${CROSS_CFLAGS} -c "$CRT0_SRC" -o "${BASENAME}_crt0.o"
"$CLANG" ${CROSS_CFLAGS} -c "$SYSCALLS_SRC" -o "${BASENAME}_syscalls.o"
"$CLANG" ${CROSS_CFLAGS} -c "$OMP_SRC" -o "${BASENAME}_omp_runtime.o"

# Collect link objects
LINK_OBJS="${BASENAME}_crt0.o $OBJ_FILE ${BASENAME}_syscalls.o ${BASENAME}_omp_runtime.o"

# Compile libc stubs for PolyBench-ACC files (provides fprintf, strcmp, polybench_alloc_data)
if [ "$NEED_LIBC_STUBS" = "1" ]; then
    "$CLANG" ${CROSS_CFLAGS} -c "${COMMON_DIR}/libc_stubs.c" -o "${BASENAME}_libc_stubs.o"
    LINK_OBJS="$LINK_OBJS ${BASENAME}_libc_stubs.o"
fi

# Link everything into ELF
"$LLD" -T "$LDSCRIPT" -o "$ELF_FILE" ${LINK_OBJS}

# --- STEP 7: Execute on GVSoC ---
echo "[7/7] Executing on GVSoC (${GVSOC_TARGET})..."
source "$GVSOC_ENV"
echo "----------------------------------------"
gvsoc --target=${GVSOC_TARGET} --binary="$ELF_FILE" run
#gvsoc --target=${GVSOC_TARGET} --binary="$ELF_FILE" --trace=insn run
echo "----------------------------------------"

echo "Execution Complete! (exit code: $?)"
