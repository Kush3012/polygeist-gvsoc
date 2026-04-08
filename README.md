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
├── test_pipeline/           # Early pipeline experiments with GEMM
│
└── Materials_Reports/       # Reference materials
```

## Dependencies (External Repos — clone separately)

| Component | Repository | Version |
|-----------|-----------|---------|
| Polygeist | [llvm/Polygeist](https://github.com/llvm/Polygeist) | LLVM 18 |
| pulp-llvm | [pulp-platform/llvm-project](https://github.com/pulp-platform/llvm-project) | LLVM 15 |
| GVSoC | [gvsoc/gvsoc](https://github.com/gvsoc/gvsoc) | latest |
| PolyBench-ACC | [cavazos-lab/PolyBench-ACC](https://github.com/cavazos-lab/PolyBench-ACC) | latest |


## Authors

- **Kushagra Varshney** — [Kush3012](https://github.com/Kush3012)
- **Rajatkant Nayak** — [raj-2001-raj](https://github.com/raj-2001-raj)

Politecnico di Milano — Formal Languages and Compilers
