#!/bin/bash

# Exit immediately if any command fails
set -e

if [ -z "$1" ]; then
    echo "❌ Error: No source file provided."
    echo "Usage: ./run_pulp.sh <file.c>"
    exit 1
fi

INPUT_FILE=$1
BASENAME=$(basename "$INPUT_FILE" | cut -d. -f1)

# Define intermediate files
MLIR_FILE="${BASENAME}.mlir"
LOWERED_MLIR_FILE="${BASENAME}_lowered.mlir"
LLVM_IR_FILE="${BASENAME}.ll"
ASM_FILE="${BASENAME}.s"
ELF_FILE="${BASENAME}.elf"

# ==========================================
# 📂 1. PATH CONFIGURATIONS
# ==========================================
PROJECT_DIR="/home/kush3012/Polimi_Projects/FL_and_Compilers"
GVSOC_ENV="${PROJECT_DIR}/gvsoc/sourceme.sh"
LINKER_SCRIPT="${PROJECT_DIR}/benchmarks/common/link.ld"
CRT0="${PROJECT_DIR}/benchmarks/build/crt0.o"
OMP_RUNTIME="${PROJECT_DIR}/benchmarks/common/pulp_omp_runtime.c"

# ==========================================
# 🛠️ 2. DUAL-TOOLCHAIN SETUP
# ==========================================
# Toolchain A: Polygeist / LLVM 18 (Frontend & MLIR)
POLYGEIST_BIN_DIR="${PROJECT_DIR}/Polygeist/build/bin"
CGEIST="${POLYGEIST_BIN_DIR}/cgeist"
MLIR_OPT="${POLYGEIST_BIN_DIR}/mlir-opt"
MLIR_TRANSLATE="${POLYGEIST_BIN_DIR}/mlir-translate"

# Toolchain B: PULP LLVM 15 (Backend for rv32imfc)
# IMPORTANT: Update this path to where your LLVM 15 PULP fork is built!
PULP_LLVM_BIN_DIR="${PROJECT_DIR}/pulp-llvm/build/bin" 
LLC="${PULP_LLVM_BIN_DIR}/llc"

echo "================================================="
echo " 🚀 End-to-End Pipeline: OpenMP -> PULP GVSoC"
echo "================================================="

# --- STAGE 1: C to MLIR (Polygeist LLVM 18) ---
# --- STAGE 1: C to MLIR (Polygeist LLVM 18) ---
# --- STAGE 1: C to MLIR (Polygeist LLVM 18) ---
echo "🧬 [1/6] Translating C to MLIR (cgeist)..."

POLY_UTILS="${PROJECT_DIR}/PolyBench-ACC/OpenMP/utilities"

$CGEIST "$INPUT_FILE" -fopenmp -S -function=* -raise-scf-to-affine \
    -I"$POLY_UTILS" \
    -I"$(dirname "$INPUT_FILE")" \
    -DMINI_DATASET \
    -DDATA_TYPE_IS_FLOAT \
    > "$MLIR_FILE"

# Define the path to PolyBench utilities
POLY_UTILS="${PROJECT_DIR}/PolyBench-ACC/OpenMP/utilities"

# We add -I for the utilities, -I for the current kernel folder, and -DMINI_DATASET

# --- STAGE 2: MLIR Lowering Passes (Polygeist LLVM 18) ---
# --- STAGE 2: MLIR Lowering Passes (Polygeist LLVM 18) ---
echo "⚙️  [2/6] Lowering MLIR dialects (mlir-opt)..."
$MLIR_OPT "$MLIR_FILE" \
    -lower-affine \
    -convert-scf-to-cf \
    -convert-openmp-to-llvm \
    -convert-arith-to-llvm \
    -convert-math-to-llvm \
    -convert-func-to-llvm \
    -convert-cf-to-llvm \
    -finalize-memref-to-llvm \
    -reconcile-unrealized-casts > "$LOWERED_MLIR_FILE"

# --- STAGE 3: MLIR to LLVM IR (Polygeist LLVM 18) ---
echo "📄 [3/6] Generating LLVM IR (mlir-translate)..."
$MLIR_TRANSLATE -mlir-to-llvmir "$LOWERED_MLIR_FILE" > "$LLVM_IR_FILE"

# --- STAGE 4: LLVM IR to RISC-V Assembly (PULP LLVM 15) ---
echo "🎯 [4/6] Compiling to RV32IMFC Assembly (llc)..."
# Generating code for the specific PULP-open architecture lacking the 'A' extension
$LLC -march=riscv32 -mattr=+m,+f,+c -target-abi=ilp32f "$LLVM_IR_FILE" -o "$ASM_FILE"

# --- STAGE 5: Bare-Metal Linking (GCC) ---
echo "🔗 [5/6] Sourcing Environment & Linking ELF..."
source "$GVSOC_ENV"

# Aliasing _worker_entry to main for the cluster boot sequence
LINKER_FLAGS="-Wl,--defsym=_worker_entry=main -Wl,--defsym=_exit=0 -Wl,--defsym=_stack_base=0x10000000 -Wl,--defsym=_core_stack_size=0x4000 -Wl,--no-warn-rwx-segments"

riscv64-unknown-elf-gcc \
    -march=rv32imfc -mabi=ilp32f -nostdlib \
    -T "$LINKER_SCRIPT" \
    "$CRT0" \
    "$ASM_FILE" \
    "$OMP_RUNTIME" \
    -o "$ELF_FILE" \
    $LINKER_FLAGS

# --- STAGE 6: Execution on GVSoC ---
echo "🖥️  [6/6] Executing on 9-Core GVSoC Emulator..."
echo "----------------------------------------"
gvsoc --target=pulp-open --platform=gvsoc --binary="$ELF_FILE" run
echo "----------------------------------------"

echo "✅ Execution Complete!"
