#!/bin/bash
# ============================================================================
# setup.sh - One-command setup for the entire toolchain
#
# Clones all external repositories, installs Python dependencies,
# configures and builds Polygeist (LLVM 18), pulp-llvm (LLVM 15), and GVSoC.
#
# Usage:
#   ./setup.sh           # Full setup (clone + build everything)
#   ./setup.sh --clone   # Clone repos only (no build)
#   ./setup.sh --build   # Build only (repos must already exist)
#
# Prerequisites (install manually before running):
#   sudo apt install build-essential cmake ninja-build git python3 python3-pip
#   # GCC 12 and GCC 14 must both be installed.
# ============================================================================

set -e

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
NPROC=$(nproc 2>/dev/null || echo 4)
MODE="${1:-all}"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info()  { echo -e "${GREEN}[INFO]${NC} $1"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

# ============================================================================
# Step 0: Check prerequisites
# ============================================================================
check_prereqs() {
    info "Checking prerequisites..."
    local missing=()
    for cmd in cmake ninja git python3 gcc-12 g++-12 gcc-13 g++-13 gcc-14 g++-14; do
        if ! command -v "$cmd" &>/dev/null; then
            missing+=("$cmd")
        fi
    done
    if [ ${#missing[@]} -ne 0 ]; then
        error "Missing tools: ${missing[*]}\nPlease install required GCC versions and build tools."
    fi

    info "Prerequisites OK ($(cmake --version | head -1), $(ninja --version 2>/dev/null || echo 'ninja'))"
}

# ============================================================================
# Step 1: Clone repositories
# ============================================================================
clone_repos() {
    info "=== Cloning external repositories ==="

    # Polygeist (LLVM 18 C-to-MLIR frontend)
    if [ ! -d "$PROJECT_DIR/Polygeist" ]; then
        info "Cloning Polygeist..."
        git clone https://github.com/llvm/Polygeist.git "$PROJECT_DIR/Polygeist"
        cd "$PROJECT_DIR/Polygeist" && git checkout 77c04bb && git submodule update --init --recursive
    else
        info "Polygeist already exists, skipping."
    fi

    # pulp-llvm (LLVM 15 with PULP RISC-V extensions)
    if [ ! -d "$PROJECT_DIR/pulp-llvm" ]; then
        info "Cloning pulp-llvm..."
        git clone https://github.com/pulp-platform/llvm-project.git "$PROJECT_DIR/pulp-llvm"
        cd "$PROJECT_DIR/pulp-llvm" && git checkout 15.0.0-snitch-0.5.0
    else
        info "pulp-llvm already exists, skipping."
    fi

    # GVSoC (cycle-accurate RISC-V simulator)
    # Pin to a9fbef0 (Nov 28 2025) to avoid broken CMake in later commits
    if [ ! -d "$PROJECT_DIR/gvsoc" ]; then
        info "Cloning GVSoC (pinned to a9fbef0)..."
        git clone https://github.com/gvsoc/gvsoc.git "$PROJECT_DIR/gvsoc"
        cd "$PROJECT_DIR/gvsoc" && git checkout a9fbef0 && git submodule update --init --recursive
    else
        info "GVSoC already exists, skipping."
    fi

    # PolyBench-ACC (reference benchmarks)
    if [ ! -d "$PROJECT_DIR/PolyBench-ACC" ]; then
        info "Cloning PolyBench-ACC..."
        git clone https://github.com/cavazos-lab/PolyBench-ACC.git "$PROJECT_DIR/PolyBench-ACC"
    else
        info "PolyBench-ACC already exists, skipping."
    fi

    info "All repositories cloned and checked out to stable commits."
}

# ============================================================================
# Step 2: Install Python dependencies
# ============================================================================
install_python_deps() {
    info "Installing Python dependencies..."
    if [ -f "$PROJECT_DIR/gvsoc/requirements.txt" ]; then
        pip3 install --user --break-system-packages -r "$PROJECT_DIR/gvsoc/requirements.txt" 2>/dev/null || \
        pip3 install --user --break-system-packages pyelftools || true
    fi
}

# ============================================================================
# Step 3: Build Polygeist (LLVM 18)
# ============================================================================
build_polygeist() {
    info "=== Building Polygeist (LLVM 18) ==="
    local SRC="$PROJECT_DIR/Polygeist/llvm-project/llvm"
    local BUILD="$PROJECT_DIR/Polygeist/build"

    if [ ! -d "$SRC" ]; then
        error "Polygeist source not found at $SRC. Run with --clone first."
    fi

    mkdir -p "$BUILD"
    if [ ! -f "$BUILD/CMakeCache.txt" ]; then
        info "Configuring Polygeist (Enforcing GCC-13)..."
        cmake -S "$SRC" -B "$BUILD" -G Ninja \
            -DCMAKE_C_COMPILER=gcc-13 \
            -DCMAKE_CXX_COMPILER=g++-13 \
            -DLLVM_ENABLE_PROJECTS="clang;mlir" \
            -DLLVM_EXTERNAL_PROJECTS="polygeist" \
            -DLLVM_EXTERNAL_POLYGEIST_SOURCE_DIR="$PROJECT_DIR/Polygeist" \
            -DLLVM_TARGETS_TO_BUILD="host;RISCV" \
            -DLLVM_ENABLE_ASSERTIONS=ON \
            -DCMAKE_BUILD_TYPE=Release
    else
        info "Polygeist already configured."
    fi

    info "Building cgeist, mlir-opt, mlir-translate, llc (this may take 30-60 minutes)..."
    cmake --build "$BUILD" --target cgeist polygeist-opt mlir-opt mlir-translate llc -- -j"$NPROC"

    # Verify
    for tool in cgeist mlir-opt mlir-translate; do
        if [ ! -f "$BUILD/bin/$tool" ]; then
            error "Failed to build $tool"
        fi
    done
    info "Polygeist built successfully."
}

# ============================================================================
# Step 4: Build pulp-llvm (LLVM 15)
# ============================================================================
build_pulp_llvm() {
    info "=== Building pulp-llvm (LLVM 15) ==="
    local SRC="$PROJECT_DIR/pulp-llvm/llvm"
    local BUILD="$PROJECT_DIR/pulp-llvm/build"

    if [ ! -d "$SRC" ]; then
        error "pulp-llvm source not found at $SRC. Run with --clone first."
    fi

    mkdir -p "$BUILD"
    if [ ! -f "$BUILD/CMakeCache.txt" ]; then
        info "Configuring pulp-llvm (Enforcing GCC-12 and disabling assertions)..."
        cmake -S "$SRC" -B "$BUILD" -G Ninja \
            -DCMAKE_C_COMPILER=gcc-12 \
            -DCMAKE_CXX_COMPILER=g++-12 \
            -DLLVM_ENABLE_PROJECTS="clang;lld" \
            -DLLVM_TARGETS_TO_BUILD="RISCV" \
            -DLLVM_DEFAULT_TARGET_TRIPLE="riscv32-unknown-elf" \
            -DLLVM_ENABLE_ASSERTIONS=OFF \
            -DCMAKE_BUILD_TYPE=Release
    else
        info "pulp-llvm already configured."
    fi

    info "Building llc, clang, lld (this may take 30-60 minutes)..."
    cmake --build "$BUILD" --target llc clang lld -- -j"$NPROC"

    # Verify (ld.lld is a symlink to lld)
    for tool in llc clang lld; do
        if [ ! -f "$BUILD/bin/$tool" ]; then
            error "Failed to build $tool"
        fi
    done
    info "pulp-llvm built successfully."
}

# ============================================================================
# Step 5: Build GVSoC
# ============================================================================
build_gvsoc() {
    info "=== Building GVSoC ==="
    local SRC="$PROJECT_DIR/gvsoc"
    local BUILD="$PROJECT_DIR/gvsoc/build"
    local PULP_CORES="$SRC/pulp/pulp/cpu/iss/pulp_cores.py"

    if [ ! -f "$SRC/CMakeLists.txt" ]; then
        error "GVSoC source not found at $SRC. Run with --clone first."
    fi

    # Apply ISS_SINGLE_REGFILE fix before configuring
    # ISS_SINGLE_REGFILE=1 aliases float/int registers in the RI5CY ISS,
    # causing float computations to read corrupted values. Remove entire lines.
    if grep -q "ISS_SINGLE_REGFILE" "$PULP_CORES" 2>/dev/null; then
        info "Applying ISS_SINGLE_REGFILE fix (float/int register aliasing bug)..."
        sed -i '/ISS_SINGLE_REGFILE/d' "$PULP_CORES" || true
        sed -i '/CONFIG_GVSOC_ISS_NO_MSTATUS_FS/d' "$PULP_CORES" || true
    fi

    mkdir -p "$BUILD"
    if [ ! -f "$BUILD/CMakeCache.txt" ]; then
        info "Configuring GVSoC..."

        # First build gvrun (matching GVSoC Makefile for this commit)
        cmake -S "$SRC/gvrun" -B "$BUILD/gvrun" -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX="$SRC/install"
        cmake --build "$BUILD/gvrun" -- -j"$NPROC"
        cmake --install "$BUILD/gvrun"

        # Configure main GVSoC build with proper modules and targets
        # gapy must be on PATH for CMake's execute_process to find it
        export PATH="$SRC/gapy/bin:$SRC/install/bin:$PATH"
        export PYTHONPATH="$SRC/install/python:${PYTHONPATH:-}"
        cd "$SRC" && cmake -S . -B "$BUILD" -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX="$SRC/install" \
            -DGVSOC_MODULES="$SRC/core/models;$SRC/pulp;$SRC/gvrun/python" \
            -DGVSOC_TARGETS="pulp-open" \
            -DCMAKE_SKIP_INSTALL_RPATH=false
    else
        info "GVSoC already configured."
    fi

    info "Building GVSoC..."
    cmake --build "$BUILD" -- -j"$NPROC"
    cmake --install "$BUILD"

    info "GVSoC built and installed."
}

# ============================================================================
# Step 6: Fix hardcoded paths in toolchain.sh
# ============================================================================
fix_paths() {
    info "Updating toolchain paths to current directory..."
    local TOOLCHAIN="$PROJECT_DIR/toolchain.sh"
    local BENCH_MAKEFILE="$PROJECT_DIR/benchmarks/Makefile"

    if [ -f "$TOOLCHAIN" ]; then
        sed -i "s|PROJECT_DIR=.*|PROJECT_DIR=\"$PROJECT_DIR\"|" "$TOOLCHAIN"
    fi
    if [ -f "$BENCH_MAKEFILE" ]; then
        sed -i "s|WORKSPACE   := .*|WORKSPACE   := $PROJECT_DIR|" "$BENCH_MAKEFILE"
    fi
}

# ============================================================================
# Step 7: Verify installation
# ============================================================================
verify() {
    info "=== Verifying installation ==="
    local ok=0
    local total=0

    for tool in \
        "$PROJECT_DIR/Polygeist/build/bin/cgeist" \
        "$PROJECT_DIR/Polygeist/build/bin/mlir-opt" \
        "$PROJECT_DIR/Polygeist/build/bin/mlir-translate" \
        "$PROJECT_DIR/pulp-llvm/build/bin/llc" \
        "$PROJECT_DIR/pulp-llvm/build/bin/clang" \
        "$PROJECT_DIR/pulp-llvm/build/bin/ld.lld" \
        "$PROJECT_DIR/gvsoc/install/bin/gvsoc"; do
        total=$((total + 1))
        if [ -f "$tool" ]; then
            ok=$((ok + 1))
            info "  ✅ $(basename "$tool")"
        else
            warn "  ❌ $(basename "$tool") NOT FOUND"
        fi
    done

    echo ""
    if [ "$ok" -eq "$total" ]; then
        info "All $total tools verified. Setup complete!"
        echo ""
        info "Next steps:"
        echo "  make test-all                                    # Run sanity tests"
        echo "  cd benchmarks && make TARGET=pulp-open OPENMP=1 run-gemm  # Run GEMM"
    else
        warn "$ok/$total tools found. Some builds may have failed."
    fi
}

# ============================================================================
# Main
# ============================================================================
echo "============================================="
echo " Polygeist-GVSoC Toolchain Setup"
echo " Project: $PROJECT_DIR"
echo " Cores:   $NPROC"
echo "============================================="

check_prereqs

case "$MODE" in
    --clone)
        clone_repos
        ;;
    --build)
        install_python_deps
        build_polygeist
        build_pulp_llvm
        build_gvsoc
        fix_paths
        verify
        ;;
    all|*)
        clone_repos
        install_python_deps
        build_polygeist
        build_pulp_llvm
        build_gvsoc
        fix_paths
        verify
        ;;
esac
