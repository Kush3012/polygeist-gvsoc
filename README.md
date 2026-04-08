# Polygeist-GVSoC: C-to-RISC-V Compilation Pipeline for PULP

A complete toolchain for compiling C programs with OpenMP parallelism through MLIR to bare-metal RISC-V binaries, targeting the PULP multi-core platform simulated on GVSoC.

## Overview

This project investigates the use of [Polygeist](https://github.com/llvm/Polygeist) (LLVM 18) as a C-to-MLIR frontend and [pulp-llvm](https://github.com/pulp-platform/llvm-project) (LLVM 15) as a RISC-V backend with PULP custom extensions, running the generated binaries on the [GVSoC](https://github.com/gvsoc/gvsoc) cycle-accurate simulator.

### Compilation Pipeline

```
C (with OpenMP)
    │  cgeist (Polygeist)
    ▼
MLIR (affine + scf + omp dialects)
    │  mlir-opt (lowering passes)
    ▼
LLVM Dialect MLIR
    │  mlir-translate
    ▼
LLVM IR (.ll)
    │  llc (pulp-llvm, RISC-V backend)
    ▼
RISC-V Assembly (.s)
    │  riscv64-unknown-elf-gcc (linker)
    ▼
Bare-metal ELF
    │  gvsoc (simulator)
    ▼
Execution on PULP virtual platform
```

## Project Structure

```
├── Makefile                 # Top-level build orchestration
├── toolchain.sh             # Full compilation pipeline script
├── setup.sh                 # One-command clone + build setup
├── test_all.sh              # One-command test suite
├── run_pulp.sh              # Simplified PULP compilation pipeline
├── simple_vecadd.c          # Sanity test: parallel vector addition
├── test_omp.c               # OpenMP correctness test
├── test_pipeline.c          # Pipeline validation test
├── gvsoc_config.json        # GVSoC peripheral configuration
│
├── benchmarks/              # PolyBench-ACC kernels adapted for bare-metal PULP
│   ├── Makefile             # Build system (rv32 + pulp-open targets)
│   ├── kernels/             # Benchmark sources (gemm, 2mm, 3mm, atax)
│   │                        # + HW tests (boot, dispatch, omp, tcdm_lock)
│   ├── common/              # Runtime support files
│   │   ├── crt0.S / crt0_pulp.S       # Startup code (single-core / multi-core)
│   │   ├── link.ld / link_pulp.ld     # Linker scripts
│   │   ├── omp_runtime.c              # Serial OpenMP runtime (rv32)
│   │   ├── pulp_omp_runtime.c         # Multi-core OpenMP runtime (PULP)
│   │   ├── syscalls.c / syscalls_pulp.c  # Exit handlers (HTIF / semihosting)
│   │   └── libc_stubs.c              # Minimal libc stubs
│   └── build/               # Compilation intermediates (.mlir, .ll, .s, .elf)
│
└── test_pipeline/           # Early pipeline experiments with GEMM
```

## Dependencies (External Repos)

| Component | Repository | Version |
|-----------|-----------|---------|
| Polygeist | [llvm/Polygeist](https://github.com/llvm/Polygeist) | LLVM 18 |
| pulp-llvm | [pulp-platform/llvm-project](https://github.com/pulp-platform/llvm-project) | LLVM 15 |
| GVSoC | [gvsoc/gvsoc](https://github.com/gvsoc/gvsoc) | latest |
| PolyBench-ACC | [cavazos-lab/PolyBench-ACC](https://github.com/cavazos-lab/PolyBench-ACC) | latest |

## Supported Targets

| Target | Description | Status |
|--------|-------------|--------|
| `rv32` | Single-core RISC-V (RV32IMFC) | ✅ Working |
| `pulp-open` | Multi-core PULP cluster (8 PEs + FC) | ✅ Working |
| `gap8` | GreenWaves GAP8 | ❌ Missing target definition (commercial) |
| `gap9` | GreenWaves GAP9 | ❌ Missing target definition (commercial) |

> **Note:** `pulp-open` already includes GAP9 ISA extensions (`rvXgap9`) in its ISA string.

## Prerequisites

Install the following before running `setup.sh`:

```bash
sudo apt install build-essential cmake ninja-build git python3 python3-pip
```

- **GCC 12+** required (GCC 14 recommended for Polygeist/LLVM 18)
- ~30 GB disk space for all builds
- ~16 GB RAM recommended (LLVM builds are memory-intensive)

## Quick Start

### Automated setup (recommended)

Clone and build everything with a single command:

```bash
git clone https://github.com/Kush3012/polygeist-gvsoc.git
cd polygeist-gvsoc
chmod +x setup.sh test_all.sh toolchain.sh
./setup.sh              # Clone repos + build all toolchains (~1-2 hours)
```

`setup.sh` supports partial runs:

```bash
./setup.sh --clone      # Clone repos only (no build)
./setup.sh --build      # Build only (repos must already exist)
```

The script will:
1. Clone Polygeist, pulp-llvm, GVSoC, and PolyBench-ACC
2. Build Polygeist (`cgeist`, `mlir-opt`, `mlir-translate`)
3. Build pulp-llvm (`llc`, `clang`, `lld`)
4. Build and install GVSoC
5. Apply the ISS_SINGLE_REGFILE fix automatically
6. Verify all 7 tools are available

### Run the test suite

```bash
./test_all.sh           # Run all tests (tools + pipeline + benchmarks + HW tests)
./test_all.sh --quick   # Tool check + basic pipeline tests only
./test_all.sh --benchmarks  # PolyBench benchmarks only
```

`--quick` runs 11 checks: 7 tool availability + 2 rv32 pipeline + 2 pulp-open pipeline.

### Manual pipeline usage

Run the full C → GVSoC pipeline for a single file:

```bash
./toolchain.sh simple_vecadd.c rv32         # Single-core RISC-V
./toolchain.sh simple_vecadd.c pulp-open    # Multi-core PULP cluster
./toolchain.sh test_omp.c pulp-open         # OpenMP test on PULP
```

### Run benchmarks

```bash
cd benchmarks
make TARGET=rv32 OPENMP=0 run-gemm          # GEMM on single-core
make TARGET=pulp-open OPENMP=1 run-gemm     # GEMM on PULP cluster (8 cores)
make TARGET=pulp-open OPENMP=1 run-atax     # ATAX on PULP cluster
make TARGET=pulp-open OPENMP=1 run-2mm      # 2MM on PULP cluster
make TARGET=pulp-open OPENMP=1 run-3mm      # 3MM on PULP cluster
```

## Key Findings

- **ISS_SINGLE_REGFILE bug**: Default PULP core config aliases float/integer register files, corrupting SP on FP instructions. Fixed by removing `ISS_SINGLE_REGFILE=1` from `pulp_cores.py`. The `setup.sh` script applies this fix automatically.
- **Custom OpenMP runtime**: Standard OpenMP runtimes don't work on bare-metal PULP. Custom `pulp_omp_runtime.c` uses TCDM test-and-set locks for inter-core synchronization.
- **Dual-LLVM toolchain**: Polygeist requires LLVM 18 for MLIR features; pulp-llvm is LLVM 15 for PULP ISA extensions. The pipeline bridges them at the LLVM IR level.

## Authors

- **Kushagra Varshney** — [Kush3012](https://github.com/Kush3012)
- **Rajatkant Nayak** — [raj-2001-raj](https://github.com/raj-2001-raj)

Politecnico di Milano — Formal Languages and Compilers
