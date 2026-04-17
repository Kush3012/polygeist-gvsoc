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

WORKSPACE   := /workspace

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

# GVSoC environment - set PATH/PYTHONPATH/LD_LIBRARY_PATH inline (no sourceme.sh needed)
GVSOC_INSTALL := $(GVSOC_DIR)/install
GVSOC         := env PATH="$(GVSOC_INSTALL)/bin:$(GVSOC_DIR)/gapy/bin:$$PATH" \
                     PYTHONPATH="$(GVSOC_INSTALL)/python:$$PYTHONPATH" \
                     LD_LIBRARY_PATH="$(GVSOC_INSTALL)/lib:$$LD_LIBRARY_PATH" \
                     $(GVSOC_INSTALL)/bin/gvsoc

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
               --convert-index-to-llvm=index-bitwidth=32 \
               --finalize-memref-to-llvm='index-bitwidth=32' \
               --convert-func-to-llvm \
               --convert-arith-to-llvm \
               --convert-math-to-llvm \
               --convert-cf-to-llvm \
               --reconcile-unrealized-casts
CGEIST_OMP  := -fopenmp
else
MLIR_PASSES := --lower-affine \
               --convert-scf-to-cf \
               --convert-index-to-llvm=index-bitwidth=32 \
               --finalize-memref-to-llvm='index-bitwidth=32' \
               --convert-func-to-llvm \
               --convert-arith-to-llvm \
               --convert-math-to-llvm \
               --convert-cf-to-llvm \
               --reconcile-unrealized-casts
CGEIST_OMP  :=
endif

# Benchmark list
BENCHMARKS := gemm atax 2mm 3mm

# HW verification tests (pulp-open only):
#   HW_BARE  = define their own _worker_entry, compiled directly with clang (no MLIR pipeline)
#   HW_OMP   = use #pragma omp, compiled via full MLIR pipeline + OMP runtime
HW_BARE  := test_boot test_dispatch test_tcdm_lock
HW_OMP   := test_omp
HW_TESTS := $(HW_BARE) $(HW_OMP)

# Preserve all intermediate files for inspection
.PRECIOUS: $(BUILD_DIR)/%.mlir $(BUILD_DIR)/%_llvm.mlir $(BUILD_DIR)/%.ll $(BUILD_DIR)/%.s $(BUILD_DIR)/%.o

# Phony targets
.PHONY: all clean $(BENCHMARKS) $(addprefix run-,$(BENCHMARKS)) run-all \
        $(HW_TESTS) $(addprefix run-,$(HW_TESTS)) run-hw

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

$(BUILD_DIR)/$(TARGET)_crt0.o: $(CRT0_SRC) | $(BUILD_DIR)
	$(CLANG) $(CROSS_CFLAGS) -c "$<" -o "$@"

$(BUILD_DIR)/$(TARGET)_syscalls.o: $(SYSCALLS_SRC) | $(BUILD_DIR)
	$(CLANG) $(CROSS_CFLAGS) -c "$<" -o "$@"

$(BUILD_DIR)/$(TARGET)_omp_runtime.o: $(OMP_SRC) | $(BUILD_DIR)
	$(CLANG) $(CROSS_CFLAGS) -c "$<" -o "$@"

# Common runtime objects
RUNTIME_OBJS := $(BUILD_DIR)/$(TARGET)_crt0.o $(BUILD_DIR)/$(TARGET)_syscalls.o

ifeq ($(OPENMP),1)
RUNTIME_OBJS += $(BUILD_DIR)/$(TARGET)_omp_runtime.o
endif

# Step 6: Link to ELF binary
$(BUILD_DIR)/%.elf: $(BUILD_DIR)/%.o $(RUNTIME_OBJS) $(LDSCRIPT)
	@echo "[6/6] Link -> ELF: $@"
	$(LLD) -T $(LDSCRIPT) -o "$@" $(BUILD_DIR)/$(TARGET)_crt0.o "$<" $(BUILD_DIR)/$(TARGET)_syscalls.o \
		$(if $(filter $(BUILD_DIR)/$(TARGET)_omp_runtime.o,$(RUNTIME_OBJS)),$(BUILD_DIR)/$(TARGET)_omp_runtime.o,)

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

# ============================================================================
# HW verification tests (pulp-open only, no OMP runtime - define own _worker_entry)
# These tests bypass the OpenMP runtime and directly boot cluster PEs.
# Build with same pipeline but link WITHOUT omp_runtime to avoid _worker_entry conflict.
# ============================================================================

# HW tests always use pulp-open runtime regardless of TARGET variable
HW_CRT0     := $(COMMON_DIR)/crt0_pulp.S
HW_SYSCALLS := $(COMMON_DIR)/syscalls_pulp.c
HW_LDSCRIPT := $(COMMON_DIR)/link_pulp.ld

$(BUILD_DIR)/hw_crt0.o: $(HW_CRT0) | $(BUILD_DIR)
	$(CLANG) $(CROSS_CFLAGS) -c "$<" -o "$@"

$(BUILD_DIR)/hw_syscalls.o: $(HW_SYSCALLS) | $(BUILD_DIR)
	$(CLANG) $(CROSS_CFLAGS) -c "$<" -o "$@"

# hw test kernels: compile DIRECTLY with clang (no MLIR pipeline)
# These use inline asm + MMIO + function pointers that confuse cgeist/polygeist.get_func
$(BUILD_DIR)/hw_%.o: $(KERNEL_DIR)/%.c | $(BUILD_DIR)
	@echo "[direct] Compile HW test: $<"
	$(CLANG) $(CROSS_CFLAGS) -c "$<" -o "$@"

# hw test ELF rule: link WITHOUT omp_runtime (tests define their own _worker_entry)
$(BUILD_DIR)/hw_%.elf: $(BUILD_DIR)/hw_%.o $(BUILD_DIR)/hw_crt0.o $(BUILD_DIR)/hw_syscalls.o $(HW_LDSCRIPT)
	@echo "[link]   HW test -> ELF: $@"
	$(LLD) -T $(HW_LDSCRIPT) -o "$@" $(BUILD_DIR)/hw_crt0.o "$<" $(BUILD_DIR)/hw_syscalls.o

# Named build targets for hw tests
test_boot:     $(BUILD_DIR)/hw_test_boot.elf
test_dispatch: $(BUILD_DIR)/hw_test_dispatch.elf
test_omp:      $(BUILD_DIR)/hw_test_omp.elf
test_tcdm_lock:$(BUILD_DIR)/hw_test_tcdm_lock.elf

# Run targets for hw tests on GVSoC pulp-open
run-test_boot: $(BUILD_DIR)/hw_test_boot.elf
	@echo "=== Running test_boot on GVSoC (pulp-open) ==="
	$(GVSOC) --target=pulp-open --binary=$< run

run-test_dispatch: $(BUILD_DIR)/hw_test_dispatch.elf
	@echo "=== Running test_dispatch on GVSoC (pulp-open) ==="
	$(GVSOC) --target=pulp-open --binary=$< run

run-test_tcdm_lock: $(BUILD_DIR)/hw_test_tcdm_lock.elf
	@echo "=== Running test_tcdm_lock on GVSoC (pulp-open) ==="
	$(GVSOC) --target=pulp-open --binary=$< run

# test_omp: uses #pragma omp -> full MLIR pipeline + OMP runtime (like benchmarks)
# Reuses the standard pattern rules but forces pulp-open + OPENMP=1 runtime objs
$(BUILD_DIR)/omp_test_omp.elf: $(BUILD_DIR)/test_omp.o \
    $(BUILD_DIR)/pulp-open_crt0.o \
    $(BUILD_DIR)/pulp-open_syscalls.o \
    $(BUILD_DIR)/pulp-open_omp_runtime.o \
    $(COMMON_DIR)/link_pulp.ld
	@echo "[link]   test_omp (OMP) -> ELF: $@"
	$(LLD) -T $(COMMON_DIR)/link_pulp.ld -o "$@" \
	    $(BUILD_DIR)/pulp-open_crt0.o \
	    $(BUILD_DIR)/test_omp.o \
	    $(BUILD_DIR)/pulp-open_syscalls.o \
	    $(BUILD_DIR)/pulp-open_omp_runtime.o

# Build rule for test_omp.o via the full MLIR pipeline using openmp passes
$(BUILD_DIR)/test_omp.mlir: $(KERNEL_DIR)/test_omp.c | $(BUILD_DIR)
	@echo "[1/6] C -> MLIR (OMP): $<"
	$(CGEIST) -S --function=* --raise-scf-to-affine -fopenmp "$<" -o "$@"

$(BUILD_DIR)/test_omp_llvm.mlir: $(BUILD_DIR)/test_omp.mlir
	@echo "[2/6] MLIR -> LLVM dialect (OMP): $<"
	$(MLIR_OPT) --lower-affine --convert-scf-to-cf --convert-openmp-to-llvm \
	    --convert-index-to-llvm=index-bitwidth=32 \
	    --finalize-memref-to-llvm='index-bitwidth=32' \
	    --convert-func-to-llvm --convert-arith-to-llvm \
	    --convert-math-to-llvm --convert-cf-to-llvm \
	    --reconcile-unrealized-casts "$<" -o "$@"

test_omp: $(BUILD_DIR)/omp_test_omp.elf

run-test_omp: $(BUILD_DIR)/omp_test_omp.elf
	@echo "=== Running test_omp on GVSoC (pulp-open, OMP) ==="
	$(GVSOC) --target=pulp-open --binary=$< run

run-hw: $(addprefix run-,$(HW_TESTS))

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)
