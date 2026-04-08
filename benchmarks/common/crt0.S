/*
 * crt0.S - Minimal startup code for bare-metal RISC-V (rv32)
 * Initializes stack, clears BSS, calls main, and exits via semihosting.
 */

    .section .init, "ax"
    .global _start
    .type   _start, @function

_start:
    /* Set up stack pointer */
    la      sp, _stack_top

    /* Set up global pointer (if used) */
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
    li      a0, 0           /* argc = 0 */
    li      a1, 0           /* argv = NULL */
    call    main

    /* Exit with return value from main (in a0) */
    call    _exit

    /* Should not reach here */
.Lhalt:
    j       .Lhalt

    .size   _start, . - _start
