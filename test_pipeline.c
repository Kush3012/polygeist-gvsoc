#define N 64

// Declare globally so they are placed in L2 memory as per your linker script
int A[N];
int B[N];
int C[N];

int main() {
    // 1. Master thread initializes the data
    for (int i = 0; i < N; i++) {
        A[i] = i;
        B[i] = 3;
    }

    // 2. The OpenMP parallel region (Polygeist will convert this to MLIR scf/omp dialects)
    #pragma omp parallel for
    for (int i = 0; i < N; i++) {
        C[i] = A[i] + B[i];
    }

    return 0;
}
