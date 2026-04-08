/* Test: TCDM test-and-set based spin-lock + shared counter */
#include <stdint.h>

#define CLUSTER_CTRL_BASE   0x10200000
#define CLUSTER_FETCH_EN    (*(volatile uint32_t *)(CLUSTER_CTRL_BASE + 0x08))
#define CLUSTER_BOOTADDR(i) (*(volatile uint32_t *)(CLUSTER_CTRL_BASE + 0x40 + (i)*4))

#define NUM_CORES 8

/* TCDM addresses for synchronization primitives */
#define TCDM_LOCK_ADDR      (*(volatile int32_t *)0x10000000)
#define TCDM_LOCK_TS_ADDR   (*(volatile int32_t *)0x10100000) /* test-and-set alias */
#define TCDM_COUNTER_ADDR   (*(volatile int32_t *)0x10000004)

/* Shared state in L2 */
static volatile int32_t _active;
static volatile int32_t done_flags[NUM_CORES];

extern void _worker_boot(void);

static inline void tcdm_lock(void) {
    while (TCDM_LOCK_TS_ADDR != 0) { /* read via T&S: returns old val, sets to 1 */
        __asm__ volatile("nop");
    }
}

static inline void tcdm_unlock(void) {
    __asm__ volatile("fence" ::: "memory");
    TCDM_LOCK_ADDR = 0;
}

void _worker_entry(void) {
    uint32_t hartid;
    __asm__ volatile("csrr %0, mhartid" : "=r"(hartid));
    uint32_t core_id = hartid & 0x1F;

    /* Wait for activation */
    while (!_active) {
        __asm__ volatile("nop");
    }
    __asm__ volatile("fence" ::: "memory");

    /* Atomically increment TCDM counter using test-and-set lock */
    tcdm_lock();
    TCDM_COUNTER_ADDR = TCDM_COUNTER_ADDR + 1;
    tcdm_unlock();

    /* Signal done */
    __asm__ volatile("fence" ::: "memory");
    done_flags[core_id] = 1;

    while(1) { __asm__ volatile("nop"); }
}

int main() {
    /* Initialize */
    _active = 0;
    for (int i = 0; i < NUM_CORES; i++)
        done_flags[i] = 0;

    /* Initialize TCDM sync variables */
    TCDM_LOCK_ADDR = 0;
    TCDM_COUNTER_ADDR = 0;

    __asm__ volatile("fence" ::: "memory");

    /* Boot all cluster PEs */
    for (int i = 0; i < NUM_CORES; i++)
        CLUSTER_BOOTADDR(i) = (uint32_t)_worker_boot;
    __asm__ volatile("fence" ::: "memory");
    CLUSTER_FETCH_EN = (1U << NUM_CORES) - 1;

    for (volatile int k = 0; k < 200; k++)
        __asm__ volatile("nop");

    /* Activate */
    _active = 1;
    __asm__ volatile("fence" ::: "memory");

    /* Wait for all done */
    for (int i = 0; i < NUM_CORES; i++) {
        while (!done_flags[i])
            __asm__ volatile("nop");
    }

    /* Check counter = NUM_CORES */
    return (TCDM_COUNTER_ADDR == NUM_CORES) ? 0 : 1;
}
