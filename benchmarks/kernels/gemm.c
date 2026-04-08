// GEMM kernel from PolyBench-ACC (OpenMP variant)
// Adapted for bare-metal RISC-V / GVSoC: no stdio, stack arrays, small size
// C := alpha * A * B + beta * C

#define NI 32
#define NJ 32
#define NK 32

static void init_array(int ni, int nj, int nk,
                       float *alpha, float *beta,
                       float C[NI][NJ],
                       float A[NI][NK],
                       float B[NK][NJ]) {
    int i, j;
    *alpha = 1.5f;
    *beta = 1.2f;
    for (i = 0; i < ni; i++)
        for (j = 0; j < nj; j++)
            C[i][j] = (float)(i * j % ni) / ni;
    for (i = 0; i < ni; i++)
        for (j = 0; j < nk; j++)
            A[i][j] = (float)(i * (j + 1) % nk) / nk;
    for (i = 0; i < nk; i++)
        for (j = 0; j < nj; j++)
            B[i][j] = (float)(i * (j + 2) % nj) / nj;
}

static void kernel_gemm(int ni, int nj, int nk,
                        float alpha, float beta,
                        float C[NI][NJ],
                        float A[NI][NK],
                        float B[NK][NJ]) {
    int i, j, k;
    #pragma omp parallel
    {
        #pragma omp for private(j, k)
        for (i = 0; i < ni; i++) {
            for (j = 0; j < nj; j++)
                C[i][j] *= beta;
            for (k = 0; k < nk; k++)
                for (j = 0; j < nj; j++)
                    C[i][j] += alpha * A[i][k] * B[k][j];
        }
    }
}

int main() {
    float alpha, beta;
    float C[NI][NJ], A[NI][NK], B[NK][NJ];

    init_array(NI, NJ, NK, &alpha, &beta, C, A, B);
    kernel_gemm(NI, NJ, NK, alpha, beta, C, A, B);

    // Checksum to prevent DCE and validate
    float sum = 0.0f;
    for (int i = 0; i < NI; i++)
        for (int j = 0; j < NJ; j++)
            sum += C[i][j];

    return (sum > 0.0f) ? 0 : 1;
}
