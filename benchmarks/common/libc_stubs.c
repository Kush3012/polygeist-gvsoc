/*
 * libc_stubs.c - Minimal libc stubs for bare-metal PolyBench-ACC compilation
 *
 * These stubs satisfy linker references from PolyBench overhead code
 * (fprintf in print_array, strcmp in polybench_prevent_dce) that are
 * never reached at runtime because crt0.S passes argc=0 (so the
 * "argc > 42" guard in POLYBENCH_DCE_ONLY_CODE is always false).
 */

typedef unsigned int size_t;

/* FILE type stub */
struct _FILE { int dummy; };
typedef struct _FILE FILE;
static FILE _stderr_file;
FILE *stderr = &_stderr_file;

int fprintf(FILE *stream, const char *fmt, ...) {
    (void)stream; (void)fmt;
    return 0;
}

int strcmp(const char *s1, const char *s2) {
    (void)s1; (void)s2;
    return 1; /* never equal — ensures DCE guard always fails */
}

/* polybench_alloc_data - fallback heap allocator (used when
   POLYBENCH_STACK_ARRAYS is NOT defined) */
static char _heap[131072]; /* 128 KB */
static unsigned int _heap_off = 0;

void *polybench_alloc_data(unsigned long long n, int elt_size) {
    unsigned int total = (unsigned int)(n * (unsigned int)elt_size);
    total = (total + 7u) & ~7u; /* 8-byte align */
    void *ptr = &_heap[_heap_off];
    _heap_off += total;
    return ptr;
}
