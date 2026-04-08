/*
 * omp_runtime.c - Minimal OpenMP runtime for bare-metal single-core RISC-V
 *
 * Implements the KMP (LLVM OpenMP) runtime functions that MLIR's
 * --convert-openmp-to-llvm pass generates calls to. This provides a
 * serial (single-threaded) fallback: all parallel regions execute
 * sequentially on a single core.
 *
 * Generated functions:
 *   __kmpc_global_thread_num    -> always returns 0
 *   __kmpc_fork_call            -> calls outlined function directly
 *   __kmpc_for_static_init_4    -> assigns full range to single thread
 *   __kmpc_for_static_init_4u   -> unsigned 32-bit variant
 *   __kmpc_for_static_init_8    -> signed 64-bit variant
 *   __kmpc_for_static_init_8u   -> unsigned 64-bit variant
 *   __kmpc_for_static_fini      -> no-op
 *   __kmpc_barrier              -> no-op
 *   __kmpc_push_num_threads     -> no-op
 *   __kmpc_dispatch_init_4      -> no-op
 *   __kmpc_dispatch_next_4      -> single iteration
 *   omp_get_num_threads         -> returns 1
 *   omp_get_thread_num          -> returns 0
 *   omp_get_max_threads         -> returns 1
 */

#include <stdarg.h>
#include <stdint.h>

/* ident_t structure used by LLVM's OpenMP codegen */
typedef struct {
    int32_t reserved_1;
    int32_t flags;
    int32_t reserved_2;
    int32_t reserved_3;
    char   *psource;
} ident_t;

/* Microtask function type (outlined parallel region) */
typedef void (*kmpc_micro)(int32_t *global_tid, int32_t *bound_tid, ...);

/*
 * __kmpc_global_thread_num - Return the global thread ID.
 * Single-threaded: always 0.
 */
int32_t __kmpc_global_thread_num(ident_t *loc) {
    (void)loc;
    return 0;
}

/*
 * __kmpc_fork_call - Fork a parallel region.
 * Single-threaded: just call the outlined function directly on this thread.
 * The outlined function has signature: void fn(int *tid, int *bound, arg0, arg1, ...)
 * We support up to 8 captured arguments (covers all PolyBench cases).
 */
void __kmpc_fork_call(ident_t *loc, int32_t argc, kmpc_micro fn, ...) {
    (void)loc;
    int32_t tid = 0;
    int32_t bound = 0;

    va_list ap;
    va_start(ap, fn);

    void *argv[8];
    for (int i = 0; i < argc && i < 8; i++)
        argv[i] = va_arg(ap, void *);
    va_end(ap);

    switch (argc) {
        case 0: fn(&tid, &bound); break;
        case 1: fn(&tid, &bound, argv[0]); break;
        case 2: fn(&tid, &bound, argv[0], argv[1]); break;
        case 3: fn(&tid, &bound, argv[0], argv[1], argv[2]); break;
        case 4: fn(&tid, &bound, argv[0], argv[1], argv[2], argv[3]); break;
        case 5: fn(&tid, &bound, argv[0], argv[1], argv[2], argv[3], argv[4]); break;
        case 6: fn(&tid, &bound, argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]); break;
        case 7: fn(&tid, &bound, argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]); break;
        case 8: fn(&tid, &bound, argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7]); break;
        default: fn(&tid, &bound, argv[0]); break;
    }
}

/*
 * __kmpc_for_static_init_4 - Initialize a statically-scheduled worksharing loop.
 * Signed 32-bit variant.
 * Single-threaded: keep the full iteration range as-is.
 */
void __kmpc_for_static_init_4(ident_t *loc, int32_t gtid, int32_t sched,
                               int32_t *plastiter,
                               int32_t *plower, int32_t *pupper,
                               int32_t *pstride,
                               int32_t incr, int32_t chunk) {
    (void)loc; (void)gtid; (void)sched; (void)incr; (void)chunk;
    *plastiter = 1;
    /* plower, pupper, pstride: keep the caller-set values for single thread */
}

/*
 * __kmpc_for_static_init_4u - Unsigned 32-bit variant
 */
void __kmpc_for_static_init_4u(ident_t *loc, int32_t gtid, int32_t sched,
                                int32_t *plastiter,
                                uint32_t *plower, uint32_t *pupper,
                                int32_t *pstride,
                                int32_t incr, int32_t chunk) {
    (void)loc; (void)gtid; (void)sched; (void)incr; (void)chunk;
    *plastiter = 1;
}

/*
 * __kmpc_for_static_init_8 - Signed 64-bit variant
 */
void __kmpc_for_static_init_8(ident_t *loc, int32_t gtid, int32_t sched,
                               int32_t *plastiter,
                               int64_t *plower, int64_t *pupper,
                               int64_t *pstride,
                               int64_t incr, int64_t chunk) {
    (void)loc; (void)gtid; (void)sched; (void)incr; (void)chunk;
    *plastiter = 1;
}

/*
 * __kmpc_for_static_init_8u - Unsigned 64-bit variant
 * (This is the one MLIR's OpenMP lowering generates)
 */
void __kmpc_for_static_init_8u(ident_t *loc, int32_t gtid, int32_t sched,
                                int32_t *plastiter,
                                uint64_t *plower, uint64_t *pupper,
                                int64_t *pstride,
                                int64_t incr, int64_t chunk) {
    (void)loc; (void)gtid; (void)sched; (void)incr; (void)chunk;
    *plastiter = 1;
}

/*
 * __kmpc_for_static_fini - Finalize a worksharing construct.
 * No-op for single-threaded.
 */
void __kmpc_for_static_fini(ident_t *loc, int32_t gtid) {
    (void)loc; (void)gtid;
}

/*
 * __kmpc_barrier - Synchronization barrier.
 * No-op for single-threaded.
 */
void __kmpc_barrier(ident_t *loc, int32_t gtid) {
    (void)loc; (void)gtid;
}

/*
 * __kmpc_push_num_threads - Set thread count for next parallel region.
 * No-op for single-threaded.
 */
void __kmpc_push_num_threads(ident_t *loc, int32_t gtid, int32_t num_threads) {
    (void)loc; (void)gtid; (void)num_threads;
}

/*
 * __kmpc_dispatch_init_4 - Initialize dynamic scheduling.
 * No-op for single-threaded.
 */
void __kmpc_dispatch_init_4(ident_t *loc, int32_t gtid, int32_t sched,
                             int32_t lb, int32_t ub,
                             int32_t st, int32_t chunk) {
    (void)loc; (void)gtid; (void)sched;
    (void)lb; (void)ub; (void)st; (void)chunk;
}

/*
 * __kmpc_dispatch_next_4 - Get next chunk for dynamic scheduling.
 * Single-threaded: return full range once, then done.
 */
static int __dispatch_done = 0;
int32_t __kmpc_dispatch_next_4(ident_t *loc, int32_t gtid,
                                int32_t *plastiter,
                                int32_t *plower, int32_t *pupper,
                                int32_t *pstride) {
    (void)loc; (void)gtid;
    if (!__dispatch_done) {
        *plastiter = 1;
        __dispatch_done = 1;
        return 1;
    }
    __dispatch_done = 0;
    return 0;
}

/* Standard OpenMP API functions */

int omp_get_num_threads(void) { return 1; }
int omp_get_thread_num(void) { return 0; }
int omp_get_max_threads(void) { return 1; }
int omp_get_num_procs(void) { return 1; }
int omp_in_parallel(void) { return 0; }
void omp_set_num_threads(int n) { (void)n; }
