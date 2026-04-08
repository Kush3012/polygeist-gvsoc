/*
 * crt0_pulp.S - Multi-core startup code for PULP-open cluster on GVSoC
 *
 * Boot flow on pulp-open:
 *   1. GVSoC loader loads ELF into L2 and boots the FC (Fabric Controller)
 *   2. FC has mhartid = (31 << 5) | 0 = 992 (cluster_id=31, core_id=0)
 *   3. FC runs _start -> main() -> __kmpc_fork_call which enables cluster PEs
 *   4. Cluster PEs (mhartid 0..7) boot into _worker_boot, set up stacks,
 *      then call _worker_entry (in pulp_omp_runtime.c)
 *
 * Stack layout:
 *   FC uses _stack_top (top of stack region)
 *   Cluster PE N uses _stack_base + (N+1) * _core_stack_size
 */

    .section .init, "ax"
    .global _start
    .global _worker_boot
    .type   _start, @function
    .type   _worker_boot, @function

_start:
    /* FC entry point - always runs as master.
     * The FC is the only core booted by the loader.
     * Cluster PEs are booted later with boot_addr = _worker_boot.
     */

    /* Set up stack pointer to top of FC stack */
    la      sp, _stack_top

    /* Set up global pointer */
    .option push
    .option norelax
    la      gp, __global_pointer$
    .option pop

    /* Clear BSS section */
    la      a0, _bss_start
    la      a1, _bss_end
.Lclear_bss:
    bge     a0, a1, .Lbss_done
    sw      zero, 0(a0)
    addi    a0, a0, 4
    j       .Lclear_bss
.Lbss_done:

    /* Call main */
    li      a0, 0               /* argc = 0 */
    li      a1, 0               /* argv = NULL */
    call    main

    /* Exit with return value from main (in a0) */
    call    _exit

    /* Should not reach here */
.Lhalt:
    j       .Lhalt

    .size   _start, . - _start

/* ---- Worker core boot entry ---- */
/* Cluster PEs (mhartid 0..7) enter here after FC enables them
 * via cluster controller FETCH_EN register.
 */
_worker_boot:
    /* Read core_id from mhartid (lower 5 bits) */
    csrr    t0, mhartid
    andi    t0, t0, 0x1F

    /* Set up global pointer */
    .option push
    .option norelax
    la      gp, __global_pointer$
    .option pop

    /* Compute per-core stack pointer:
     * sp = _stack_base + (core_id + 1) * _core_stack_size
     */
    la      t1, _stack_base
    la      t2, _core_stack_size
    addi    t3, t0, 1           /* core_id + 1 */
    mul     t3, t3, t2          /* (core_id + 1) * stack_size */
    add     sp, t1, t3          /* sp = _stack_base + offset */

    /* Jump to C worker entry (does not return) */
    call    _worker_entry

    /* Safety: infinite loop */
.Lworker_halt:
    j       .Lworker_halt

    .size   _worker_boot, . - _worker_boot
