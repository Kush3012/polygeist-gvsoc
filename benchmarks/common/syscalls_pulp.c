/*
 * syscalls_pulp.c - Bare-metal syscalls for GVSoC pulp-open target
 *
 * Provides: _exit (semihosting), malloc/free (bump allocator on L2 heap),
 * and printf stub.
 * The semihosting ebreak sequence is recognized by GVSoC's ISS.
 */

#include <stdint.h>
#include <stddef.h>

/* ---- Simple bump allocator using L2 heap region ---- */
/* _heap_start and _heap_end are defined by the linker script */
extern char _heap_start;
extern char _heap_end;

static char *heap_ptr = 0;

void *malloc(size_t size) {
    if (!heap_ptr) heap_ptr = &_heap_start;
    /* Align to 8 bytes */
    size = (size + 7) & ~(size_t)7;
    if (heap_ptr + size > &_heap_end) return (void *)0;
    void *p = heap_ptr;
    heap_ptr += size;
    return p;
}

void free(void *ptr) {
    (void)ptr; /* bump allocator: no-op */
}

/* ---- Minimal printf stub (for any leftover references) ---- */
int printf(const char *fmt, ...) {
    (void)fmt;
    return 0;
}

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
