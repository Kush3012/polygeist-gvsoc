# Top-level convenience Makefile
# Toolchain orchestration Makefile
# - Builds Polygeist (LLVM 18), pulp-llvm (LLVM 15), and GVSoC if build dirs exist.
# - Will auto-configure builds if no CMakeCache is present using default flags below.
# - Runs sanity tests through toolchain.sh. No sudo, no package installs.

WORKSPACE := $(CURDIR)
TOOLCHAIN := $(WORKSPACE)/toolchain.sh
TEST_SRC  := $(WORKSPACE)/simple_vecadd.c

# Polygeist (LLVM 18)
POLYGEIST_SRC   := $(WORKSPACE)/Polygeist/llvm-project/llvm
POLYGEIST_BUILD := $(WORKSPACE)/Polygeist/build
POLYGEIST_CACHE := $(POLYGEIST_BUILD)/CMakeCache.txt
POLYGEIST_TARGETS := cgeist mlir-opt mlir-translate
POLYGEIST_CMAKE_FLAGS ?= -G Ninja \
  -DLLVM_ENABLE_PROJECTS="clang;mlir;openmp" \
  -DLLVM_TARGETS_TO_BUILD="RISCV;X86" \
  -DLLVM_ENABLE_ASSERTIONS=ON \
  -DCMAKE_BUILD_TYPE=Release

# pulp-llvm (LLVM 15)
PULP_LLVM_SRC   := $(WORKSPACE)/pulp-llvm/llvm
PULP_LLVM_BUILD := $(WORKSPACE)/pulp-llvm/build
PULP_LLVM_CACHE := $(PULP_LLVM_BUILD)/CMakeCache.txt
PULP_LLVM_TARGETS := llc clang lld
PULP_LLVM_CMAKE_FLAGS ?= -G Ninja \
  -DLLVM_ENABLE_PROJECTS="clang;lld" \
  -DLLVM_TARGETS_TO_BUILD="RISCV;X86" \
  -DLLVM_ENABLE_ASSERTIONS=ON \
  -DCMAKE_BUILD_TYPE=Release

# GVSoC
GVSOC_SRC   := $(WORKSPACE)/gvsoc
GVSOC_BUILD := $(WORKSPACE)/gvsoc/build
GVSOC_CACHE := $(GVSOC_BUILD)/CMakeCache.txt
GVSOC_CMAKE_FLAGS ?= -DCMAKE_BUILD_TYPE=Release

.PHONY: help
help:
	@echo "Targets:"
	@echo "  toolchain-all # configure+build Polygeist, pulp-llvm, GVSoC"
	@echo "  polygeist     # configure+build Polygeist (cgeist/mlir-opt/mlir-translate)"
	@echo "  pulp-llvm     # configure+build pulp-llvm (llc/clang/ld.lld)"
	@echo "  gvsoc         # configure+build+install GVSoC"
	@echo "  deps-info     # list prerequisite packages and tool builds (no install)"
	@echo "  test-rv32     # run toolchain.sh simple_vecadd.c rv32"
	@echo "  test-pulp     # run toolchain.sh simple_vecadd.c pulp-open"
	@echo "  test-all      # run both rv32 and pulp-open tests"
	@echo "  package       # create fl_and_compilers.tar.gz for sharing"

.PHONY: toolchain-all
toolchain-all: polygeist pulp-llvm gvsoc

.PHONY: polygeist
polygeist: $(POLYGEIST_CACHE)
	@echo "[build] Polygeist targets: $(POLYGEIST_TARGETS)"
	@cmake --build $(POLYGEIST_BUILD) --target $(POLYGEIST_TARGETS) -- -j

$(POLYGEIST_CACHE):
	@mkdir -p $(POLYGEIST_BUILD)
	@if [ ! -f $(POLYGEIST_CACHE) ]; then \
		echo "[configure] Polygeist"; \
		cmake -S $(POLYGEIST_SRC) -B $(POLYGEIST_BUILD) $(POLYGEIST_CMAKE_FLAGS); \
	else \
		echo "[skip] Polygeist already configured"; \
	fi

.PHONY: deps-info
deps-info:
	@echo "Prerequisites (manual install):"
	@echo "  - build-essential cmake ninja-build git python3"
	@echo "  - GCC 14 for Polygeist (LLVM 18), GCC 12 for pulp-llvm (LLVM 15)"
	@echo "  - riscv64-unknown-elf-gcc toolchain"
	@echo "Build steps (already done in this workspace):"
	@echo "  - Polygeist: cmake -G Ninja ../llvm-project/llvm ...; ninja cgeist mlir-opt mlir-translate"
	@echo "  - pulp-llvm: cmake -G Ninja ../llvm ...; ninja llc clang lld"
	@echo "  - gvsoc: cmake ..; make -j; make install"

.PHONY: pulp-llvm
pulp-llvm: $(PULP_LLVM_CACHE)
	@echo "[build] pulp-llvm targets: $(PULP_LLVM_TARGETS)"
	@cmake --build $(PULP_LLVM_BUILD) --target $(PULP_LLVM_TARGETS) -- -j

$(PULP_LLVM_CACHE):
	@mkdir -p $(PULP_LLVM_BUILD)
	@if [ ! -f $(PULP_LLVM_CACHE) ]; then \
		echo "[configure] pulp-llvm"; \
		cmake -S $(PULP_LLVM_SRC) -B $(PULP_LLVM_BUILD) $(PULP_LLVM_CMAKE_FLAGS); \
	else \
		echo "[skip] pulp-llvm already configured"; \
	fi

.PHONY: gvsoc
gvsoc: $(GVSOC_CACHE)
	@echo "[build] GVSoC"
	@cmake --build $(GVSOC_BUILD) -- -j
	@cmake --install $(GVSOC_BUILD)

$(GVSOC_CACHE):
	@mkdir -p $(GVSOC_BUILD)
	@if [ ! -f $(GVSOC_CACHE) ]; then \
		echo "[configure] GVSoC"; \
		cmake -S $(GVSOC_SRC) -B $(GVSOC_BUILD) $(GVSOC_CMAKE_FLAGS); \
	else \
		echo "[skip] GVSoC already configured"; \
	fi

.PHONY: test-rv32
test-rv32:
	$(TOOLCHAIN) $(TEST_SRC) rv32

.PHONY: test-pulp
test-pulp:
	$(TOOLCHAIN) $(TEST_SRC) pulp-open

.PHONY: test-all
test-all: test-rv32 test-pulp

.PHONY: package
package:
	@tar czf fl_and_compilers.tar.gz \
		--exclude='**/.git' \
		--exclude='**/build/*' \
		--exclude='**/*.elf' \
		--exclude='**/*.o' \
		--exclude='**/*.log' \
		--exclude='**/*.tar.gz' \
		."}