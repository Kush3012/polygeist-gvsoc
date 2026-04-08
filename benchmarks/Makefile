# ============================================================================
# Makefile - Full Pipeline: C -> MLIR -> LLVM IR -> RISC-V ASM -> ELF -> GVSoC
# ============================================================================
#
# Usage:
#   make gemm                 # Build GEMM through full pipeline
#   make atax                 # Build ATAX
#   make 2mm                  # Build 2MM
#   make 3mm                  # Build 3MM
#   make all                  # Build all benchmarks
#   make run-gemm             # Build + run GEMM on GVSoC
#   make run-all              # Build + run all on GVSoC
#   make clean                # Remove build artifacts
#
#   make OPENMP=1 gemm        # Build GEMM with OpenMP parallel lowering
#   make OPENMP=1 run-gemm    # Build + run GEMM with OpenMP on GVSoC
#
#   make TARGET=pulp-open OPENMP=1 gemm      # Multi-core PULP cluster build
#   make TARGET=pulp-open OPENMP=1 run-gemm  # Run on GVSoC pulp-open

WORKSPACE   := /home/kush3012/Polimi_Projects/FL_and_Compilers

# Tool paths
POLYGEIST   := $(WORKSPACE)/Polygeist/build/bin
PULPLLVM    := $(WORKSPACE)/pulp-llvm/build/bin
GVSOC_DIR   := $(WORKSPACE)/gvsoc

CGEIST      := $(POLYGEIST)/cgeist
MLIR_OPT    := $(POLYGEIST)/mlir-opt
MLIR_TRANS  := $(POLYGEIST)/mlir-translate
LLC         := $(PULPLLVM)/llc
CLANG       := $(PULPLLVM)/clang
LLD         := $(PULPLLVM)/ld.lld

# Source the GVSoC environment
GVSOC_ENV   := source $(GVSOC_DIR)/install/setup.sh 2>/dev/null;
GVSOC       := $(GVSOC_DIR)/install/bin/gvsoc

# Target selection: rv32 (single-core) or pulp-open (multi-core cluster)
TARGET ?= rv32

# RISC-V target configuration
RISCV_MARCH   := rv32imfc
RISCV_MATTR   := +m,+f,+c
RISCV_TRIPLE  := riscv32-unknown-elf
RISCV_DL      := e-m:e-p:32:32-i64:64-n32-S128

# Directories
COMMON_DIR  := common
KERNEL_DIR  := kernels
BUILD_DIR   := build

# Per-target source selection
ifeq ($(TARGET),pulp-open)
CRT0_SRC    := $(COMMON_DIR)/crt0_pulp.S
SYSCALLS_SRC:= $(COMMON_DIR)/syscalls_pulp.c
OMP_SRC     := $(COMMON_DIR)/pulp_omp_runtime.c
LDSCRIPT    := $(COMMON_DIR)/link_pulp.ld
GVSOC_TARGET:= pulp-open
else
CRT0_SRC    := $(COMMON_DIR)/crt0.S
SYSCALLS_SRC:= $(COMMON_DIR)/syscalls.c
OMP_SRC     := $(COMMON_DIR)/omp_runtime.c
LDSCRIPT    := $(COMMON_DIR)/link.ld
GVSOC_TARGET:= rv32
endif

# Cross-compilation flags for supporting code
CROSS_CFLAGS  := --target=$(RISCV_TRIPLE) -march=$(RISCV_MARCH) -mabi=ilp32f \
                 -Os -fno-builtin -ffreestanding -nostdlib -mno-relax

# llc flags
LLC_FLAGS     := -march=riscv32 -mattr=$(RISCV_MATTR) -opaque-pointers

# OpenMP mode: 0 = serial (scf.parallel -> sequential), 1 = OpenMP runtime
OPENMP ?= 0

# MLIR lowering passes
# Pass order: lower-affine -> scf-to-cf -> openmp-to-llvm -> memref -> func -> arith -> cf -> casts
# When OPENMP=1: cgeist -fopenmp emits omp.parallel/omp.wsloop, which
# --convert-openmp-to-llvm converts to __kmpc_* runtime calls.
# When OPENMP=0: cgeist without -fopenmp ignores pragmas; no OMP dialect ops.
ifeq ($(OPENMP),1)
MLIR_PASSES := --lower-affine \
               --convert-scf-to-cf \
               --convert-openmp-to-llvm \
               --finalize-memref-to-llvm \
               --convert-func-to-llvm \
               --convert-arith-to-llvm \
               --convert-cf-to-llvm \
               --reconcile-unrealized-casts
CGEIST_OMP  := -fopenmp
else
MLIR_PASSES := --lower-affine \
               --convert-scf-to-cf \
               --finalize-memref-to-llvm \
               --convert-func-to-llvm \
               --convert-arith-to-llvm \
               --convert-cf-to-llvm \
               --reconcile-unrealized-casts
CGEIST_OMP  :=
endif

# Benchmark list
BENCHMARKS := gemm atax 2mm 3mm

# Preserve all intermediate files for inspection
.PRECIOUS: $(BUILD_DIR)/%.mlir $(BUILD_DIR)/%_llvm.mlir $(BUILD_DIR)/%.ll $(BUILD_DIR)/%.s $(BUILD_DIR)/%.o

# Phony targets
.PHONY: all clean $(BENCHMARKS) $(addprefix run-,$(BENCHMARKS)) run-all

all: $(BENCHMARKS)

# ============================================================================
# Pattern rules for the full pipeline
# ============================================================================

# Step 1: C -> MLIR (Polygeist cgeist)
$(BUILD_DIR)/%.mlir: $(KERNEL_DIR)/%.c | $(BUILD_DIR)
	@echo "[1/6] C -> MLIR: $<"
	$(CGEIST) -S --function=* --raise-scf-to-affine $(CGEIST_OMP) "$<" -o "$@"

# Step 2: MLIR -> LLVM Dialect (mlir-opt)
$(BUILD_DIR)/%_llvm.mlir: $(BUILD_DIR)/%.mlir
	@echo "[2/6] MLIR -> LLVM dialect: $<"
	$(MLIR_OPT) $(MLIR_PASSES) "$<" -o "$@"

# Step 3: LLVM Dialect -> LLVM IR (mlir-translate) + patch target triple
$(BUILD_DIR)/%.ll: $(BUILD_DIR)/%_llvm.mlir
	@echo "[3/6] LLVM dialect -> LLVM IR: $<"
	$(MLIR_TRANS) --mlir-to-llvmir "$<" -o "$@"
	@sed -i 's|target triple = "[^"]*"|target triple = "$(RISCV_TRIPLE)"|' "$@"
	@sed -i 's|target datalayout = "[^"]*"|target datalayout = "$(RISCV_DL)"|' "$@"

# Step 4: LLVM IR -> RISC-V assembly (PULP LLVM llc)
$(BUILD_DIR)/%.s: $(BUILD_DIR)/%.ll
	@echo "[4/6] LLVM IR -> RISC-V assembly: $<"
	$(LLC) $(LLC_FLAGS) "$<" -o "$@"

# Step 5: Assemble kernel + runtime -> object files
$(BUILD_DIR)/%.o: $(BUILD_DIR)/%.s
	@echo "[5/6] Assemble: $<"
	$(CLANG) --target=$(RISCV_TRIPLE) -march=$(RISCV_MARCH) -mabi=ilp32f -c "$<" -o "$@"

$(BUILD_DIR)/crt0.o: $(CRT0_SRC) | $(BUILD_DIR)
	$(CLANG) $(CROSS_CFLAGS) -c "$<" -o "$@"

$(BUILD_DIR)/syscalls.o: $(SYSCALLS_SRC) | $(BUILD_DIR)
	$(CLANG) $(CROSS_CFLAGS) -c "$<" -o "$@"

$(BUILD_DIR)/omp_runtime.o: $(OMP_SRC) | $(BUILD_DIR)
	$(CLANG) $(CROSS_CFLAGS) -c "$<" -o "$@"

# Common runtime objects
RUNTIME_OBJS := $(BUILD_DIR)/crt0.o $(BUILD_DIR)/syscalls.o

ifeq ($(OPENMP),1)
RUNTIME_OBJS += $(BUILD_DIR)/omp_runtime.o
endif

# Step 6: Link to ELF binary
$(BUILD_DIR)/%.elf: $(BUILD_DIR)/%.o $(RUNTIME_OBJS) $(LDSCRIPT)
	@echo "[6/6] Link -> ELF: $@"
	$(LLD) -T $(LDSCRIPT) -o "$@" $(BUILD_DIR)/crt0.o "$<" $(BUILD_DIR)/syscalls.o \
		$(if $(filter $(BUILD_DIR)/omp_runtime.o,$(RUNTIME_OBJS)),$(BUILD_DIR)/omp_runtime.o,)

# Named targets
gemm: $(BUILD_DIR)/gemm.elf
atax: $(BUILD_DIR)/atax.elf
2mm:  $(BUILD_DIR)/2mm.elf
3mm:  $(BUILD_DIR)/3mm.elf

# Run targets on GVSoC (rv32)
run-gemm: $(BUILD_DIR)/gemm.elf
	@echo "=== Running GEMM on GVSoC ($(GVSOC_TARGET)) ==="
	$(GVSOC) --target=$(GVSOC_TARGET) --binary=$< run

run-atax: $(BUILD_DIR)/atax.elf
	@echo "=== Running ATAX on GVSoC ($(GVSOC_TARGET)) ==="
	$(GVSOC) --target=$(GVSOC_TARGET) --binary=$< run

run-2mm: $(BUILD_DIR)/2mm.elf
	@echo "=== Running 2MM on GVSoC ($(GVSOC_TARGET)) ==="
	$(GVSOC) --target=$(GVSOC_TARGET) --binary=$< run

run-3mm: $(BUILD_DIR)/3mm.elf
	@echo "=== Running 3MM on GVSoC ($(GVSOC_TARGET)) ==="
	$(GVSOC) --target=$(GVSOC_TARGET) --binary=$< run

run-all: $(addprefix run-,$(BENCHMARKS))

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)
