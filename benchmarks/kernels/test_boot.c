/* Minimal test: does FC boot cluster PEs successfully? */
#include <stdint.h>

#define CLUSTER_CTRL_BASE   0x10200000
#define CLUSTER_FETCH_EN    (*(volatile uint32_t *)(CLUSTER_CTRL_BASE + 0x08))
#define CLUSTER_BOOTADDR(i) (*(volatile uint32_t *)(CLUSTER_CTRL_BASE + 0x40 + (i)*4))

#define NUM_CORES 8

static volatile int32_t done_flags[NUM_CORES];

extern void _worker_boot(void);

/* This is called by workers from _worker_entry in the runtime.
 * But for this test, we define our own _worker_entry. */

void _worker_entry(void) {
    uint32_t hartid;
    __asm__ volatile("csrr %0, mhartid" : "=r"(hartid));
    uint32_t core_id = hartid & 0x1F;
    if (core_id < NUM_CORES) {
        done_flags[core_id] = 1;
    }
    while(1) { __asm__ volatile("nop"); }
}

int main() {
    /* Clear flags */
    for (int i = 0; i < NUM_CORES; i++)
        done_flags[i] = 0;

    __asm__ volatile("fence" ::: "memory");

    /* Boot all cluster PEs */
    for (int i = 0; i < NUM_CORES; i++) {
        CLUSTER_BOOTADDR(i) = (uint32_t)_worker_boot;
    }
    __asm__ volatile("fence" ::: "memory");
    CLUSTER_FETCH_EN = (1U << NUM_CORES) - 1;

    /* Wait for all PEs to check in */
    for (volatile int wait = 0; wait < 100000; wait++) {
        int all_done = 1;
        for (int i = 0; i < NUM_CORES; i++) {
            if (!done_flags[i]) { all_done = 0; break; }
        }
        if (all_done) return 0;  /* Success */
    }

    return 1;  /* Timeout — some PEs didn't boot */
}
