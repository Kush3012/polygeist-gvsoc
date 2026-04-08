/* Minimal OpenMP parallel test — just fork/join, verify thread count */
#include <stdint.h>

static volatile int32_t thread_seen[8];

void kernel_test(void) {
    int i;
    #pragma omp parallel for
    for (i = 0; i < 8; i++) {
        thread_seen[i] = 1;
    }
}

int main() {
    for (int i = 0; i < 8; i++)
        thread_seen[i] = 0;

    kernel_test();

    int count = 0;
    for (int i = 0; i < 8; i++)
        count += thread_seen[i];

    return (count == 8) ? 0 : 1;
}
