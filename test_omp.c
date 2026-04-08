
#define N 32

int A[N], B[N], C[N];

int main() {
    for (int i = 0; i < N; i++) {
        A[i] = i;
        B[i] = i * 2;
    }

    #pragma omp parallel for
    for (int i = 0; i < N; i++) {
        C[i] = A[i] + B[i];
    }

    return 0;
}
