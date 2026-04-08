// 2MM kernel from PolyBench-ACC (OpenMP variant)
// D := alpha * A * B * C + beta * D
// Two chained matrix multiplications
// Adapted for bare-metal RISC-V / GVSoC: no stdio, stack arrays, small size

#define NI 32
#define NJ 32
#define NK 32
#define NL 32

static void init_array(int ni, int nj, int nk, int nl,
                       float *alpha, float *beta,
                       float A[NI][NK],
                       float B[NK][NJ],
                       float C[NJ][NL],
                       float D[NI][NL]) {
    int i, j;
    *alpha = 1.5f;
    *beta = 1.2f;
    for (i = 0; i < ni; i++)
        for (j = 0; j < nk; j++)
            A[i][j] = (float)(i * j % ni) / ni;
    for (i = 0; i < nk; i++)
        for (j = 0; j < nj; j++)
            B[i][j] = (float)((i + 1) * (j + 1) % nj) / nj;
    for (i = 0; i < nj; i++)
        for (j = 0; j < nl; j++)
            C[i][j] = (float)(i * (j + 3) % nl) / nl;
    for (i = 0; i < ni; i++)
        for (j = 0; j < nl; j++)
            D[i][j] = (float)(i * (j + 2) % nk) / nk;
}

static void kernel_2mm(int ni, int nj, int nk, int nl,
                       float alpha, float beta,
                       float tmp[NI][NJ],
                       float A[NI][NK],
                       float B[NK][NJ],
                       float C[NJ][NL],
                       float D[NI][NL]) {
    int i, j, k;

    // tmp := alpha * A * B
    #pragma omp parallel for private(j, k)
    for (i = 0; i < ni; i++) {
        for (j = 0; j < nj; j++) {
            tmp[i][j] = 0.0f;
            for (k = 0; k < nk; k++)
                tmp[i][j] += alpha * A[i][k] * B[k][j];
        }
    }

    // D := tmp * C + beta * D
    #pragma omp parallel for private(j, k)
    for (i = 0; i < ni; i++) {
        for (j = 0; j < nl; j++) {
            D[i][j] *= beta;
            for (k = 0; k < nj; k++)
                D[i][j] += tmp[i][k] * C[k][j];
        }
    }
}

int main() {
    float alpha, beta;
    float tmp[NI][NJ], A[NI][NK], B[NK][NJ], C[NJ][NL], D[NI][NL];

    init_array(NI, NJ, NK, NL, &alpha, &beta, A, B, C, D);
    kernel_2mm(NI, NJ, NK, NL, alpha, beta, tmp, A, B, C, D);

    float sum = 0.0f;
    for (int i = 0; i < NI; i++)
        for (int j = 0; j < NL; j++)
            sum += D[i][j];

    return (sum > 0.0f) ? 0 : 1;
}
