/* Test: FC dispatches work to cluster PEs via per-core done flags */
#include <stdint.h>

#define CLUSTER_CTRL_BASE   0x10200000
#define CLUSTER_FETCH_EN    (*(volatile uint32_t *)(CLUSTER_CTRL_BASE + 0x08))
#define CLUSTER_BOOTADDR(i) (*(volatile uint32_t *)(CLUSTER_CTRL_BASE + 0x40 + (i)*4))

#define NUM_CORES 8

/* Shared state in L2 BSS */
static volatile int32_t _active;
static volatile int32_t done_flags[NUM_CORES];
static volatile int32_t results[NUM_CORES];

extern void _worker_boot(void);

void _worker_entry(void) {
    uint32_t hartid;
    __asm__ volatile("csrr %0, mhartid" : "=r"(hartid));
    uint32_t core_id = hartid & 0x1F;

    /* Wait for activation */
    while (!_active) {
        __asm__ volatile("nop");
    }
    __asm__ volatile("fence" ::: "memory");

    /* Do some work */
    results[core_id] = (int32_t)(core_id * core_id + 1);

    /* Signal done via per-core flag (no lock needed) */
    __asm__ volatile("fence" ::: "memory");
    done_flags[core_id] = 1;

    while(1) { __asm__ volatile("nop"); }
}

int main() {
    /* Initialize */
    _active = 0;
    for (int i = 0; i < NUM_CORES; i++) {
        done_flags[i] = 0;
        results[i] = 0;
    }

    __asm__ volatile("fence" ::: "memory");

    /* Boot all cluster PEs */
    for (int i = 0; i < NUM_CORES; i++) {
        CLUSTER_BOOTADDR(i) = (uint32_t)_worker_boot;
    }
    __asm__ volatile("fence" ::: "memory");
    CLUSTER_FETCH_EN = (1U << NUM_CORES) - 1;

    /* Wait for PEs to reach spin-wait */
    for (volatile int k = 0; k < 200; k++)
        __asm__ volatile("nop");

    /* Activate workers */
    _active = 1;
    __asm__ volatile("fence" ::: "memory");

    /* Wait for all PEs to finish via per-core flags */
    for (int i = 0; i < NUM_CORES; i++) {
        while (!done_flags[i]) {
            __asm__ volatile("nop");
        }
    }

    /* Verify results */
    int ok = 1;
    for (int i = 0; i < NUM_CORES; i++) {
        if (results[i] != (int32_t)(i * i + 1)) {
            ok = 0;
        }
    }

    return ok ? 0 : 1;
}
