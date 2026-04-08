/*
 * syscalls_pulp.c - Bare-metal exit for GVSoC pulp-open target
 *
 * Uses RISC-V semihosting to signal program termination.
 * The semihosting ebreak sequence is recognized by GVSoC's ISS.
 */

#include <stdint.h>

#define SEMIHOST_EXIT_SUCCESS 0x20026
#define SEMIHOST_EXIT_ERROR   0x20023

static inline long __semihost(long n, long a1) {
    register long a0 __asm__("a0") = n;
    register long _a1 __asm__("a1") = a1;
    __asm__ volatile(
        ".option norvc\n\t"
        "slli    zero, zero, 0x1f\n\t"
        "ebreak\n\t"
        "srai    zero, zero, 0x7\n\t"
        ".option rvc\n\t"
        : "+r"(a0)
        : "r"(_a1)
    );
    return a0;
}

void _exit(int status) {
    long code = (status == 0) ? SEMIHOST_EXIT_SUCCESS : SEMIHOST_EXIT_ERROR;
    __semihost(0x18, code);  /* SYS_EXIT = 0x18 */
    while (1) { }
}
