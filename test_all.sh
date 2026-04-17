#!/bin/bash
# ============================================================================
# test_all.sh - One-command test suite for the entire toolchain
#
# Runs all tests to verify the toolchain works correctly:
#   1. Tool availability check
#   2. Single-core (rv32) pipeline test
#   3. Multi-core (pulp-open) pipeline test
#   4. All PolyBench benchmarks on both targets
#   5. Hardware verification tests (boot, dispatch, omp, tcdm_lock)
#
# Usage:
#   ./test_all.sh              # Run all tests
#   ./test_all.sh --quick      # Tool check + basic pipeline tests only
#   ./test_all.sh --benchmarks # PolyBench benchmarks only
# ============================================================================

set -e

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
MODE="${1:-all}"

PASS=0
FAIL=0
SKIP=0
RESULTS=()

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

run_test() {
    local name="$1"
    shift
    echo -e "${CYAN}[TEST]${NC} $name"
    if "$@" >/dev/null 2>&1; then
        echo -e "  ${GREEN}PASS${NC}"
        PASS=$((PASS + 1))
        RESULTS+=("PASS  $name")
    else
        echo -e "  ${RED}FAIL${NC}"
        FAIL=$((FAIL + 1))
        RESULTS+=("FAIL  $name")
    fi
}

skip_test() {
    local name="$1"
    echo -e "${YELLOW}[SKIP]${NC} $name"
    SKIP=$((SKIP + 1))
    RESULTS+=("SKIP  $name")
}

# ============================================================================
# 1. Tool availability
# ============================================================================
check_tools() {
    echo ""
    echo "==========================================="
    echo " 1. Checking tool availability"
    echo "==========================================="

    for tool in \
        "$PROJECT_DIR/Polygeist/build/bin/cgeist" \
        "$PROJECT_DIR/Polygeist/build/bin/mlir-opt" \
        "$PROJECT_DIR/Polygeist/build/bin/mlir-translate" \
        "$PROJECT_DIR/pulp-llvm/build/bin/llc" \
        "$PROJECT_DIR/pulp-llvm/build/bin/clang" \
        "$PROJECT_DIR/pulp-llvm/build/bin/ld.lld"; do
        local tname=$(basename "$tool")
        if [ -f "$tool" ] && [ -x "$tool" ]; then
            echo -e "  ${GREEN}✅${NC} $tname"
            PASS=$((PASS + 1))
            RESULTS+=("PASS  tool: $tname")
        else
            echo -e "  ${RED}❌${NC} $tname NOT FOUND"
            FAIL=$((FAIL + 1))
            RESULTS+=("FAIL  tool: $tname")
        fi
    done

    if [ -f "$PROJECT_DIR/gvsoc/install/bin/gvsoc" ]; then
        echo -e "  ${GREEN}✅${NC} gvsoc"
        PASS=$((PASS + 1))
        RESULTS+=("PASS  tool: gvsoc")
    else
        echo -e "  ${RED}❌${NC} gvsoc NOT FOUND"
        FAIL=$((FAIL + 1))
        RESULTS+=("FAIL  tool: gvsoc")
    fi
}

# ============================================================================
# 2. Pipeline tests (single-core rv32)
# ============================================================================
test_rv32() {
    echo ""
    echo "==========================================="
    echo " 2. Single-core (rv32) pipeline tests"
    echo "==========================================="

    if [ ! -f "$PROJECT_DIR/Polygeist/build/bin/cgeist" ]; then
        skip_test "rv32: simple_vecadd (tools not built)"
        skip_test "rv32: test_omp (tools not built)"
        return
    fi

    run_test "rv32: simple_vecadd" \
        "$PROJECT_DIR/toolchain.sh" "$PROJECT_DIR/simple_vecadd.c" rv32

    run_test "rv32: test_omp" \
        "$PROJECT_DIR/toolchain.sh" "$PROJECT_DIR/test_omp.c" rv32
}

# ============================================================================
# 3. Pipeline tests (multi-core pulp-open)
# ============================================================================
test_pulp() {
    echo ""
    echo "==========================================="
    echo " 3. Multi-core (pulp-open) pipeline tests"
    echo "==========================================="

    if [ ! -f "$PROJECT_DIR/Polygeist/build/bin/cgeist" ]; then
        skip_test "pulp-open: simple_vecadd (tools not built)"
        skip_test "pulp-open: test_omp (tools not built)"
        return
    fi

    run_test "pulp-open: simple_vecadd" \
        "$PROJECT_DIR/toolchain.sh" "$PROJECT_DIR/simple_vecadd.c" pulp-open

    run_test "pulp-open: test_omp" \
        "$PROJECT_DIR/toolchain.sh" "$PROJECT_DIR/test_omp.c" pulp-open
}

# ============================================================================
# 4. PolyBench benchmarks
# ============================================================================
test_benchmarks() {
    echo ""
    echo "==========================================="
    echo " 4. PolyBench benchmarks"
    echo "==========================================="

    local BENCH_DIR="$PROJECT_DIR/benchmarks"
    if [ ! -f "$PROJECT_DIR/Polygeist/build/bin/cgeist" ]; then
        for k in gemm 2mm 3mm atax; do
            skip_test "benchmark: $k (tools not built)"
        done
        return
    fi

    # Single-core
    for kernel in gemm 2mm 3mm atax; do
        run_test "rv32: $kernel" \
            make -C "$BENCH_DIR" TARGET=rv32 OPENMP=0 "run-$kernel"
    done

    # Multi-core
    for kernel in gemm 2mm 3mm atax; do
        run_test "pulp-open (OpenMP): $kernel" \
            make -C "$BENCH_DIR" TARGET=pulp-open OPENMP=1 "run-$kernel"
    done
}

# ============================================================================
# 5. Hardware verification tests
# ============================================================================
test_hw() {
    echo ""
    echo "==========================================="
    echo " 5. Hardware verification tests (pulp-open)"
    echo "==========================================="

    local BENCH_DIR="$PROJECT_DIR/benchmarks"
    if [ ! -f "$PROJECT_DIR/Polygeist/build/bin/cgeist" ]; then
        for t in test_boot test_dispatch test_omp test_tcdm_lock; do
            skip_test "hw: $t (tools not built)"
        done
        return
    fi

    for test_name in test_boot test_dispatch test_omp test_tcdm_lock; do
        if grep -q "run-$test_name" "$BENCH_DIR/Makefile" 2>/dev/null; then
            run_test "hw: $test_name" \
                make -C "$BENCH_DIR" TARGET=pulp-open "run-$test_name"
        else
            skip_test "hw: $test_name (no Makefile target)"
        fi
    done
}

# ============================================================================
# Summary
# ============================================================================
print_summary() {
    echo ""
    echo "==========================================="
    echo " TEST SUMMARY"
    echo "==========================================="
    for r in "${RESULTS[@]}"; do
        case "$r" in
            PASS*) echo -e "  ${GREEN}$r${NC}" ;;
            FAIL*) echo -e "  ${RED}$r${NC}" ;;
            SKIP*) echo -e "  ${YELLOW}$r${NC}" ;;
        esac
    done
    echo ""
    echo "==========================================="
    echo -e "  ${GREEN}PASS: $PASS${NC}  ${RED}FAIL: $FAIL${NC}  ${YELLOW}SKIP: $SKIP${NC}  TOTAL: $((PASS + FAIL + SKIP))"
    echo "==========================================="

    if [ "$FAIL" -gt 0 ]; then
        exit 1
    fi
}

# ============================================================================
# Main
# ============================================================================
echo "============================================="
echo " Polygeist-GVSoC Test Suite"
echo " Project: $PROJECT_DIR"
echo "============================================="

case "$MODE" in
    --quick)
        check_tools
        test_rv32
        test_pulp
        ;;
    --benchmarks)
        test_benchmarks
        ;;
    all|*)
        check_tools
        test_rv32
        test_pulp
        test_benchmarks
        test_hw
        ;;
esac

print_summary
