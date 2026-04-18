# Polygeist-GVSoC: C-to-RISC-V MLIR Compilation Pipeline for PULP

A complete toolchain for compiling C programs with OpenMP parallelism through MLIR to bare-metal RISC-V binaries, targeting the PULP multi-core cluster platform simulated on GVSoC.

---

## Overview

This project implements a 6-step compilation pipeline from C (with OpenMP pragmas) down to bare-metal RISC-V ELF binaries, executed on the [GVSoC](https://github.com/gvsoc/gvsoc) cycle-accurate simulator targeting the `pulp-open` platform (1 FC + 8-core cluster).

```
C source (with #pragma omp)
    │  cgeist (Polygeist / LLVM 18)
    ▼
MLIR  [affine + scf + omp dialects]
    │  mlir-opt  (lowering passes)
    ▼
LLVM Dialect MLIR
    │  mlir-translate
    ▼
LLVM IR  (.ll)
    │  llc  (pulp-llvm / LLVM 15, riscv32)
    ▼
RISC-V Assembly  (.s)
    │  clang + ld.lld  (link with CRT0 + OMP runtime)
    ▼
Bare-metal ELF
    │  gvsoc  (pulp-open or rv32 target)
    ▼
Simulation on PULP virtual platform
```

### Key Components

| Component | Role |
|---|---|
| [Polygeist](https://github.com/llvm/Polygeist) (LLVM 18) | C → MLIR frontend (`cgeist`) |
| [pulp-llvm](https://github.com/pulp-platform/llvm-project) (LLVM 15) | RISC-V backend (`llc`, `ld.lld`) |
| [GVSoC](https://github.com/gvsoc/gvsoc) | Cycle-accurate PULP simulator |
| `benchmarks/common/pulp_omp_runtime.c` | Custom bare-metal OpenMP runtime (FC dispatcher + 8-PE cluster) |
| `benchmarks/common/crt0_pulp.S` | Multi-core startup code (FC + `_worker_boot`) |
| `peStats.sh` | GVSoC instruction trace analyser (FC + PE counts, cycles) |

---

## Repository Structure

```
polygeist-gvsoc/
├── Dockerfile                   # Full build environment (all tools)
├── peStats.sh                   # Hardware performance analysis script
├── toolchain.sh                 # Single-file C → ELF → GVSoC pipeline
├── test_all.sh                  # Full test suite runner (23 tests)
├── benchmarks/
│   ├── Makefile                 # Multi-step build + run rules
│   ├── kernels/                 # Benchmark C source files
│   │   ├── gemm.c               # GEMM  (1 parallel region)
│   │   ├── atax.c               # ATAX  (1 parallel region)
│   │   ├── 2mm.c                # 2MM   (2 parallel regions)
│   │   └── 3mm.c                # 3MM   (3 parallel regions)
│   ├── common/
│   │   ├── pulp_omp_runtime.c   # Bare-metal OpenMP runtime
│   │   ├── crt0_pulp.S          # Multi-core startup (pulp-open)
│   │   ├── crt0.S               # Single-core startup (rv32)
│   │   ├── link_pulp.ld         # Linker script (pulp-open)
│   │   ├── link.ld              # Linker script (rv32)
│   │   ├── syscalls_pulp.c      # Bare-metal syscall stubs (pulp-open)
│   │   └── syscalls.c           # Bare-metal syscall stubs (rv32)
│   └── build/                   # Pipeline output artefacts (committed as evidence)
│       ├── gemm.mlir            # Step 1 output: C → MLIR (contains omp.parallel)
│       ├── gemm_llvm.mlir       # Step 2 output: MLIR → LLVM Dialect
│       ├── gemm.ll              # Step 3 output: LLVM IR (contains __kmpc_fork_call)
│       ├── gemm.s               # Step 4 output: RISC-V assembly
│       ├── atax.mlir / .ll / .s # Same pipeline outputs for ATAX
│       ├── 2mm.mlir / .ll / .s  # Same for 2MM (2 parallel regions)
│       ├── 3mm.mlir / .ll / .s  # Same for 3MM (3 parallel regions)
│       └── test_omp.mlir / .ll  # HW test pipeline outputs
├── test_pipeline/               # Single-kernel pipeline test files
│   ├── output/                  # simple_gemm pipeline outputs
│   └── gemm_output/             # gemm_kernel pipeline outputs
└── simple_vecadd.c              # Minimal vector-add example
```

---

## Quick Start with Docker

The Docker image builds **all tools from source** (Polygeist, pulp-llvm, GVSoC). The first build takes **60–90 minutes** and produces an image of approximately **24 GB**.

### Prerequisites

- Docker Desktop (macOS / Linux) with **≥ 16 GB RAM** allocated and **≥ 40 GB disk space**
- Git

### Step 1 — Clone the Repository

```bash
git clone https://github.com/Kush3012/polygeist-gvsoc.git
cd polygeist-gvsoc
```

### Step 2 — Build the Docker Image

```bash
docker build -t polygeist-gvsoc:final .
```

> **Apple Silicon (M1/M2/M3):** Docker automatically uses Rosetta (`linux/amd64` emulation). This is expected and handled transparently.

### Step 3 — Start a Persistent Container

```bash
docker run -dit --name pulp-dev polygeist-gvsoc:final bash
```

### Step 4 — Enter the Container

```bash
docker exec -it pulp-dev bash
```

All tools are pre-installed under `/workspace/`:

| Path | Tool |
|---|---|
| `/workspace/Polygeist/build/bin/cgeist` | Polygeist C→MLIR frontend |
| `/workspace/Polygeist/build/bin/mlir-opt` | MLIR optimizer |
| `/workspace/Polygeist/build/bin/mlir-translate` | MLIR → LLVM IR |
| `/workspace/pulp-llvm/build/bin/llc` | RISC-V code generator |
| `/workspace/pulp-llvm/build/bin/ld.lld` | RISC-V linker |
| `/workspace/gvsoc/install/bin/gvsoc` | GVSoC cycle-accurate simulator |

---

## Running the Benchmarks

### Build All Benchmarks (pulp-open, 8-core, OpenMP)

```bash
docker exec pulp-dev bash -c '
cd /workspace/benchmarks
make TARGET=pulp-open OPENMP=1 all
'
```

This builds `build/gemm.elf`, `build/atax.elf`, `build/2mm.elf`, `build/3mm.elf`.

### Run a Single Benchmark

```bash
docker exec pulp-dev bash -c '
cd /workspace/benchmarks
make TARGET=pulp-open OPENMP=1 run-gemm
'
```

### Run All Benchmarks

```bash
docker exec pulp-dev bash -c '
cd /workspace/benchmarks
make TARGET=pulp-open OPENMP=1 run-all
'
```

### Make Target Reference

| Target | Description |
|---|---|
| `make TARGET=pulp-open OPENMP=1 gemm` | Build GEMM (multi-core) |
| `make TARGET=pulp-open OPENMP=1 run-gemm` | Build + run GEMM on GVSoC |
| `make TARGET=pulp-open OPENMP=1 all` | Build all 4 benchmarks |
| `make TARGET=pulp-open OPENMP=1 run-all` | Build + run all 4 |
| `make TARGET=rv32 OPENMP=0 gemm` | Build GEMM (single-core) |
| `make TARGET=pulp-open run-test_dispatch` | Run cluster dispatch HW test |
| `make TARGET=pulp-open run-hw` | Run all 4 HW verification tests |
| `make clean` | Remove all build artefacts |

---

## Hardware Performance Analysis

`peStats.sh` runs GVSoC with `--trace=insn`, parses the instruction trace, and reports:

- **Total Cycles** — global simulation cycle count
- **FC Instructions** — Fabric Controller (serial dispatch overhead)
- **PE0–PE7 Instructions** — per-core compute instructions across all 8 cluster PEs

### Usage

```bash
# From inside the container
/workspace/peStats.sh /workspace/benchmarks/build/gemm.elf

# Or from the host, targeting a running container named pulp-dev
docker cp peStats.sh pulp-dev:/workspace/peStats.sh
docker exec pulp-dev /workspace/peStats.sh /workspace/benchmarks/build/gemm.elf
```

### Example Output — GEMM

```
=========================================
       Hardware Performance Summary
=========================================
Binary Executed       : /workspace/benchmarks/build/gemm.elf
Total Cycles (Global) : 940519
FC Instructions       : 255723
-----------------------------------------
PE0 Instructions      : 109384
PE1 Instructions      : 109434
PE2 Instructions      : 109490
PE3 Instructions      : 109546
PE4 Instructions      : 109410
PE5 Instructions      : 109466
PE6 Instructions      : 109522
PE7 Instructions      : 109578
=========================================
```

### Results for All Benchmarks

| Benchmark | Total Cycles | FC Instrs | Avg PE Instrs | PE Imbalance |
|---|---|---|---|---|
| **GEMM** | 940,519 | 255,723 | ~109,478 | < 0.3% |
| **ATAX** | 98,607 | 43,679 | ~5,636 | < 0.3% |
| **2MM** | 1,552,312 | 435,297 | 176,727 | 0.0% |
| **3MM** | 2,163,344 | 599,376 | ~256,487 | < 0.03% |

PE instruction counts are highly uniform across all 8 cores, confirming correct static contiguous-chunk scheduling in the OpenMP runtime.

---

## Pipeline Output Evidence

The `benchmarks/build/` directory contains **committed intermediate outputs** from each pipeline stage, proving the toolchain works end-to-end. These files are generated by `make TARGET=pulp-open OPENMP=1 all`.

### OMP dialect ops in MLIR (Step 1 output)

Each benchmark's `.mlir` file contains `omp.parallel` and `omp.wsloop` ops, confirming that Polygeist correctly lowers `#pragma omp` to the OMP MLIR dialect:

| File | OMP ops | Parallel regions |
|---|---|---|
| `build/gemm.mlir` | 4 | 1 (`omp.parallel` + `omp.wsloop`) |
| `build/atax.mlir` | 6 | 1 (2 loops) |
| `build/2mm.mlir` | 8 | 2 |
| `build/3mm.mlir` | 12 | 3 |

### `__kmpc_fork_call` in LLVM IR (Step 3 output)

Each `.ll` file contains calls to `__kmpc_fork_call`, proving that `--convert-openmp-to-llvm` correctly lowers OMP ops to KMP runtime calls:

| File | `__kmpc_fork_call` count |
|---|---|
| `build/gemm.ll` | 2 |
| `build/atax.ll` | 2 |
| `build/2mm.ll` | 3 |
| `build/3mm.ll` | 4 |

### RISC-V assembly (Step 4 output)

Each `.s` file contains valid `rv32imfc` assembly with PULP-compatible calling conventions, ready for linking with the bare-metal CRT0 and OpenMP runtime.

---

## Full Test Suite

```bash
docker exec pulp-dev bash -c 'cd /workspace && bash test_all.sh'
```

Expected result: **23/23 tests passed**

| Category | Count | Description |
|---|---|---|
| Tools | 7 | Verify all tool binaries exist and respond |
| Pipeline | 4 | Full C → ELF build for each benchmark |
| Benchmarks | 8 | Run all 4 benchmarks on rv32 + pulp-open |
| HW Tests | 4 | test_boot, test_dispatch, test_tcdm_lock, test_omp |

---

## OpenMP Runtime Architecture

The custom bare-metal runtime (`benchmarks/common/pulp_omp_runtime.c`) requires no OS, no atomics extension, and no external libraries:

```
FC (mhartid=992)
  │  __kmpc_fork_call()
  │  1. write CLUSTER_BOOTADDR[0..7] = &_worker_boot
  │  2. write CLUSTER_FETCH_EN = 0xFF   (boot all 8 PEs)
  │  3. _omp_active = 1                 (signal work ready)
  │  4. poll _omp_done_flags[0..7]      (wait for all PEs)
  │  5. _omp_active = 0                 (deactivate)
  │
  └─► PE0 .. PE7 (mhartid 0..7)
        _worker_boot → _worker_entry()
        loop:
          spin-wait while _omp_active == 0
          execute outlined parallel function
          _omp_done_flags[core_id] = 1
          spin-wait while _omp_active == 1
```

Synchronisation uses the TCDM test-and-set hardware alias at `0x10100000` (no A-extension required). Loop scheduling uses static contiguous chunks via `__kmpc_for_static_init_4`.

---

## Single-File Toolchain (`toolchain.sh`)

Compile and simulate any single C file end-to-end:

```bash
docker exec pulp-dev bash -c \
  'cd /workspace && bash toolchain.sh simple_vecadd.c pulp-open'
```

Arguments: `<source.c> <target>` — target is `pulp-open` (multi-core) or `rv32` (single-core).

---

## Troubleshooting

**Docker build OOM / killed**
Increase Docker Desktop memory to ≥ 16 GB: Settings → Resources → Memory.

**`rosetta error: failed to open elf at /lib64/ld-linux-x86-64.so.2`**
Benign warning from GVSoC's debug-symbol loader on Apple Silicon. Simulation is correct — ignore it.

**PE Instructions all show 0**
The ELF must be built with **both** `TARGET=pulp-open` **and** `OPENMP=1`.
Building with `OPENMP=0` produces no `omp.parallel` ops — the cluster is never booted.

**`#pragma omp parallel for` produces no OMP ops**
Polygeist's `cgeist` requires the **split form** of the pragma:
```c
// ✅ Correct — works with Polygeist
#pragma omp parallel
{
    #pragma omp for
    for (i = 0; i < n; i++) { ... }
}

// ❌ Wrong — combined form not lowered by cgeist
#pragma omp parallel for
for (i = 0; i < n; i++) { ... }
```

**GVSoC simulation hangs**
Add a timeout: `timeout 300 gvsoc --target=pulp-open --binary=foo.elf run`

---

## License

Components are subject to their respective upstream licences:
- Polygeist / LLVM: Apache 2.0
- GVSoC: Apache 2.0
- pulp-llvm: Apache 2.0
