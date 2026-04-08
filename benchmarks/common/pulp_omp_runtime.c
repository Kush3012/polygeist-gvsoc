/*
 * pulp_omp_runtime.c - Multi-core OpenMP runtime for PULP cluster on GVSoC
 *
 * Architecture (PULP-open, FC-as-dispatcher):
 *   The FC (Fabric Controller, mhartid=992) runs main() and dispatches work.
 *   When __kmpc_fork_call is invoked, the FC:
 *     1. Sets up shared work descriptor (function ptr + args) in L2
 *     2. Boots cluster PEs 0..NUM_CORES-1 (on first call only)
 *     3. Signals PEs to execute the outlined parallel function
 *     4. Waits for all PEs to finish via per-core done flags
 *
 *   Cluster PEs (mhartid 0..NUM_CORES-1) are the OpenMP threads.
 *   FC never participates in any barrier or microtask execution.
 *
 * Synchronization:
 *   PULP RI5CY cores lack the 'A' (atomic) extension.
 *   We use TCDM test-and-set (read from 0x10100000 alias atomically returns
 *   old value and sets to 1) for proper spin-locks.
 *   Barrier state is stored in TCDM for single-cycle PE access.
 */

#include <stdarg.h>
#include <stdint.h>

/* ---- PULP Cluster Hardware Addresses ---- */

#define CLUSTER_CTRL_BASE   0x10200000
#define CLUSTER_FETCH_EN    (*(volatile uint32_t *)(CLUSTER_CTRL_BASE + 0x08))
#define CLUSTER_BOOTADDR(i) (*(volatile uint32_t *)(CLUSTER_CTRL_BASE + 0x40 + (i)*4))

/* TCDM synchronization variables (at known addresses in L1 scratchpad).
 * Test-and-set alias: read from 0x10100000+offset returns old value and
 * atomically sets the word at 0x10000000+offset to 1. */
#define TCDM_LOCK       (*(volatile int32_t *)0x10000000)
#define TCDM_LOCK_TS    (*(volatile int32_t *)0x10100000)  /* test-and-set alias */
#define TCDM_BARR_CNT   (*(volatile int32_t *)0x10000004)
#define TCDM_BARR_SENSE (*(volatile int32_t *)0x10000008)

/* ---- Configuration ---- */
#define NUM_CORES  8   /* Cluster PEs to use (0..7) */

/* ---- Core Identification ---- */
static inline uint32_t __pulp_core_id(void) {
    uint32_t hartid;
    __asm__ volatile("csrr %0, mhartid" : "=r"(hartid));
    return hartid & 0x1F;
}

static inline int __is_fc(void) {
    uint32_t hartid;
    __asm__ volatile("csrr %0, mhartid" : "=r"(hartid));
    return (hartid >> 5) == 31;
}

/* ---- Types ---- */

typedef void (*kmpc_micro)(int32_t *global_tid, int32_t *bound_tid, ...);

typedef struct {
    int32_t reserved_1;
    int32_t flags;
    int32_t reserved_2;
    int32_t reserved_3;
    char   *psource;
} ident_t;

/* ---- Shared State (L2 BSS, accessible by FC and cluster PEs) ---- */

static volatile kmpc_micro _omp_fn;
static volatile int32_t    _omp_argc;
static volatile void      *_omp_argv[8];
static volatile int32_t    _omp_active;         /* 1 = parallel region active */
static volatile int32_t    _omp_done_flags[NUM_CORES]; /* per-core done flags */
static volatile int32_t    _num_threads;

/* ---- TCDM Test-and-Set Spin-Lock ---- */

/*
 * Atomic lock using TCDM test-and-set hardware.
 * Reading TCDM_LOCK_TS atomically returns the old value and sets to 1.
 * If old value was 0, we acquired the lock. Otherwise spin.
 * Only cluster PEs use this (FC never calls locked sections).
 */
static inline void __tcdm_lock(void) {
    while (TCDM_LOCK_TS != 0) {
        __asm__ volatile("nop");
    }
}

static inline void __tcdm_unlock(void) {
    __asm__ volatile("" ::: "memory");
    TCDM_LOCK = 0;
}

/* ---- Barrier (PEs only, sense-reversing with TCDM lock) ---- */

static void __omp_barrier_wait(void) {
    int32_t num = _num_threads;
    int32_t local_sense = !TCDM_BARR_SENSE;

    __tcdm_lock();
    int32_t pos = TCDM_BARR_CNT;
    TCDM_BARR_CNT = pos + 1;
    __tcdm_unlock();

    if (pos + 1 == num) {
        TCDM_BARR_CNT = 0;
        __asm__ volatile("" ::: "memory");
        TCDM_BARR_SENSE = local_sense;
    } else {
        while (TCDM_BARR_SENSE != local_sense) {
            __asm__ volatile("nop");
        }
    }
    __asm__ volatile("" ::: "memory");
}

/* ---- Microtask Caller ---- */

static void __attribute__((noinline)) _call_microtask(
    kmpc_micro fn, int32_t argc, void **argv,
    int32_t *tid, int32_t *bound)
{
    switch (argc) {
        case 0: fn(tid, bound); break;
        case 1: fn(tid, bound, argv[0]); break;
        case 2: fn(tid, bound, argv[0], argv[1]); break;
        case 3: fn(tid, bound, argv[0], argv[1], argv[2]); break;
        case 4: fn(tid, bound, argv[0], argv[1], argv[2], argv[3]); break;
        case 5: fn(tid, bound, argv[0], argv[1], argv[2], argv[3], argv[4]); break;
        case 6: fn(tid, bound, argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]); break;
        case 7: fn(tid, bound, argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]); break;
        case 8: fn(tid, bound, argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7]); break;
        default: fn(tid, bound); break;
    }
}

/* ---- Worker (Cluster PE) Entry Point ---- */

void _worker_entry(void);
void _worker_entry(void) {
    uint32_t core_id = __pulp_core_id();

    while (1) {
        /* Spin-wait for work */
        while (!_omp_active) {
            __asm__ volatile("nop");
        }
        __asm__ volatile("" ::: "memory");

        /* Read shared parallel region descriptor */
        kmpc_micro fn = (kmpc_micro)_omp_fn;
        int32_t argc = _omp_argc;
        void *argv[8];
        for (int i = 0; i < argc && i < 8; i++)
            argv[i] = (void *)_omp_argv[i];

        int32_t tid = (int32_t)core_id;
        int32_t bound = (int32_t)(NUM_CORES - 1);

        /* Execute the outlined parallel function */
        _call_microtask(fn, argc, argv, &tid, &bound);

        /* Signal completion to FC via per-core flag (no lock needed) */
        __asm__ volatile("" ::: "memory");
        _omp_done_flags[core_id] = 1;

        /* Wait for FC to deactivate before accepting new work */
        while (_omp_active) {
            __asm__ volatile("nop");
        }
        __asm__ volatile("" ::: "memory");
    }
}

/* ---- Runtime Initialization (called by FC) ---- */

static volatile int _runtime_initialized = 0;

static void __omp_runtime_init(void) {
    if (_runtime_initialized)
        return;
    _runtime_initialized = 1;

    _omp_active = 0;
    _num_threads = NUM_CORES;
    for (int i = 0; i < NUM_CORES; i++)
        _omp_done_flags[i] = 0;

    /* Initialize TCDM sync variables */
    TCDM_LOCK = 0;
    TCDM_BARR_CNT = 0;
    TCDM_BARR_SENSE = 0;

    __asm__ volatile("fence" ::: "memory");

    /* Set boot address for all cluster PEs (0..NUM_CORES-1) */
    extern void _worker_boot(void);
    for (int i = 0; i < NUM_CORES; i++) {
        CLUSTER_BOOTADDR(i) = (uint32_t)_worker_boot;
    }

    __asm__ volatile("fence" ::: "memory");

    /* Enable all cluster PEs (bits 0..NUM_CORES-1) */
    CLUSTER_FETCH_EN = (1U << NUM_CORES) - 1;

    /* Give PEs time to boot and reach spin-wait loop */
    for (volatile int k = 0; k < 200; k++)
        __asm__ volatile("nop");
}

/* ---- KMP Runtime Functions ---- */

int32_t __kmpc_global_thread_num(ident_t *loc) {
    (void)loc;
    if (__is_fc()) return 0;
    return (int32_t)__pulp_core_id();
}

/*
 * __kmpc_fork_call - Fork a parallel region.
 * FC sets up work descriptor, signals PEs, waits for all per-core done flags.
 */
void __kmpc_fork_call(ident_t *loc, int32_t argc, kmpc_micro fn, ...) {
    (void)loc;

    __omp_runtime_init();

    /* Collect captured arguments */
    va_list ap;
    va_start(ap, fn);
    void *argv[8];
    for (int i = 0; i < argc && i < 8; i++)
        argv[i] = va_arg(ap, void *);
    va_end(ap);

    /* Set up shared descriptor */
    _omp_fn = fn;
    _omp_argc = argc;
    for (int i = 0; i < argc && i < 8; i++)
        _omp_argv[i] = argv[i];

    _num_threads = NUM_CORES;
    for (int i = 0; i < NUM_CORES; i++)
        _omp_done_flags[i] = 0;

    /* Reset TCDM barrier state */
    TCDM_LOCK = 0;
    TCDM_BARR_CNT = 0;
    TCDM_BARR_SENSE = 0;

    __asm__ volatile("fence" ::: "memory");

    /* Activate PEs */
    _omp_active = 1;
    __asm__ volatile("fence" ::: "memory");

    /* FC waits for all PEs to finish via per-core flags */
    for (int i = 0; i < NUM_CORES; i++) {
        while (!_omp_done_flags[i]) {
            __asm__ volatile("nop");
        }
    }

    /* Deactivate */
    _omp_active = 0;
    __asm__ volatile("fence" ::: "memory");
}

/* ---- Static Loop Scheduling ---- */

void __kmpc_for_static_init_4(ident_t *loc, int32_t gtid, int32_t sched,
                               int32_t *plastiter,
                               int32_t *plower, int32_t *pupper,
                               int32_t *pstride,
                               int32_t incr, int32_t chunk) {
    (void)loc; (void)sched; (void)chunk;
    int32_t total = *pupper - *plower + 1;
    int32_t nt = (int32_t)_num_threads;
    int32_t cs = total / nt;
    int32_t rem = total % nt;

    int32_t lo, hi;
    if (gtid < rem) {
        lo = *plower + gtid * (cs + 1);
        hi = lo + cs;
    } else {
        lo = *plower + rem * (cs + 1) + (gtid - rem) * cs;
        hi = lo + cs - 1;
    }
    *plower = lo;
    *pupper = hi;
    *pstride = total;
    *plastiter = (gtid == nt - 1) ? 1 : 0;
}

void __kmpc_for_static_init_4u(ident_t *loc, int32_t gtid, int32_t sched,
                                int32_t *plastiter,
                                uint32_t *plower, uint32_t *pupper,
                                int32_t *pstride,
                                int32_t incr, int32_t chunk) {
    (void)loc; (void)sched; (void)chunk;
    uint32_t total = *pupper - *plower + 1;
    uint32_t nt = (uint32_t)_num_threads;
    uint32_t cs = total / nt;
    uint32_t rem = total % nt;
    uint32_t uid = (uint32_t)gtid;

    uint32_t lo, hi;
    if (uid < rem) {
        lo = *plower + uid * (cs + 1);
        hi = lo + cs;
    } else {
        lo = *plower + rem * (cs + 1) + (uid - rem) * cs;
        hi = lo + cs - 1;
    }
    *plower = lo;
    *pupper = hi;
    *pstride = (int32_t)total;
    *plastiter = (uid == nt - 1) ? 1 : 0;
}

void __kmpc_for_static_init_8(ident_t *loc, int32_t gtid, int32_t sched,
                               int32_t *plastiter,
                               int64_t *plower, int64_t *pupper,
                               int64_t *pstride,
                               int64_t incr, int64_t chunk) {
    (void)loc; (void)sched; (void)chunk;
    int32_t total = (int32_t)(*pupper - *plower + 1);
    int32_t nt = (int32_t)_num_threads;
    int32_t cs = total / nt;
    int32_t rem = total % nt;

    int32_t lo, hi;
    if (gtid < rem) {
        lo = (int32_t)*plower + gtid * (cs + 1);
        hi = lo + cs;
    } else {
        lo = (int32_t)*plower + rem * (cs + 1) + (gtid - rem) * cs;
        hi = lo + cs - 1;
    }
    *plower = (int64_t)lo;
    *pupper = (int64_t)hi;
    *pstride = (int64_t)total;
    *plastiter = (gtid == nt - 1) ? 1 : 0;
}

void __kmpc_for_static_init_8u(ident_t *loc, int32_t gtid, int32_t sched,
                                int32_t *plastiter,
                                uint64_t *plower, uint64_t *pupper,
                                int64_t *pstride,
                                int64_t incr, int64_t chunk) {
    (void)loc; (void)sched; (void)chunk;
    uint32_t total = (uint32_t)(*pupper - *plower + 1);
    uint32_t nt = (uint32_t)_num_threads;
    uint32_t cs = total / nt;
    uint32_t rem = total % nt;
    uint32_t uid = (uint32_t)gtid;

    uint32_t lo, hi;
    if (uid < rem) {
        lo = (uint32_t)*plower + uid * (cs + 1);
        hi = lo + cs;
    } else {
        lo = (uint32_t)*plower + rem * (cs + 1) + (uid - rem) * cs;
        hi = lo + cs - 1;
    }
    *plower = (uint64_t)lo;
    *pupper = (uint64_t)hi;
    *pstride = (int64_t)total;
    *plastiter = (uid == nt - 1) ? 1 : 0;
}

void __kmpc_for_static_fini(ident_t *loc, int32_t gtid) {
    (void)loc; (void)gtid;
}

void __kmpc_barrier(ident_t *loc, int32_t gtid) {
    (void)loc; (void)gtid;
    __omp_barrier_wait();
}

void __kmpc_push_num_threads(ident_t *loc, int32_t gtid, int32_t num_threads) {
    (void)loc; (void)gtid;
    if (num_threads > 0 && num_threads <= NUM_CORES)
        _num_threads = num_threads;
}

void __kmpc_dispatch_init_4(ident_t *loc, int32_t gtid, int32_t sched,
                             int32_t lb, int32_t ub,
                             int32_t st, int32_t chunk) {
    (void)loc; (void)gtid; (void)sched;
    (void)lb; (void)ub; (void)st; (void)chunk;
}

static volatile int32_t __dispatch_counter;
int32_t __kmpc_dispatch_next_4(ident_t *loc, int32_t gtid,
                                int32_t *plastiter,
                                int32_t *plower, int32_t *pupper,
                                int32_t *pstride) {
    (void)loc; (void)gtid;
    __tcdm_lock();
    int32_t old = __dispatch_counter;
    __dispatch_counter = old + 1;
    __tcdm_unlock();
    if (old == 0) {
        *plastiter = 1;
        return 1;
    }
    return 0;
}

/* ---- Standard OpenMP API ---- */

int omp_get_num_threads(void) { return (int)_num_threads; }
int omp_get_thread_num(void)  { return (int)__pulp_core_id(); }
int omp_get_max_threads(void) { return NUM_CORES; }
int omp_get_num_procs(void)   { return NUM_CORES; }
int omp_in_parallel(void)     { return _omp_active ? 1 : 0; }
void omp_set_num_threads(int n) {
    if (n > 0 && n <= NUM_CORES)
        _num_threads = n;
}
