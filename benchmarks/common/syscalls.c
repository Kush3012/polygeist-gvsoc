/*
 * syscalls.c - Minimal bare-metal I/O for GVSoC rv32 target
 * Provides _exit() for program termination.
 *
 * Uses the HTIF (Host-Target Interface) tohost mechanism:
 * writing to address 0x80001000 signals the simulator to stop.
 */

#include <stdint.h>

/* HTIF tohost address (configured in GVSoC rv32.py) */
#define TOHOST_ADDR 0x80001000

/*
 * _exit - Terminate the program via HTIF tohost write.
 * GVSoC's Bus_watchpoint at 0x80001000 will detect the write and stop.
 * Convention: write 1 for success, other values for failure.
 */
void _exit(int status) {
    volatile uint32_t *tohost = (volatile uint32_t *)TOHOST_ADDR;
    if (status == 0) {
        *tohost = 1;   /* Success: write 1 */
    } else {
        *tohost = (uint32_t)((status << 1) | 1);  /* Failure: encode status */
    }

    /* Should not reach here; infinite loop as safety net */
    while (1) { }
}
