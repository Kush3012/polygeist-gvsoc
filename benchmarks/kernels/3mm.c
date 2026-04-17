// 3MM kernel from PolyBench-ACC (OpenMP variant)
// G := (A * B) * (C * D)
// Three matrix multiplications: E = A*B, F = C*D, G = E*F
// Adapted for bare-metal RISC-V / GVSoC: no stdio, stack arrays, small size

#define NI 32
#define NJ 32
#define NK 32
#define NL 32
#define NM 32

static void init_array(int ni, int nj, int nk, int nl, int nm,
                       float A[NI][NK],
                       float B[NK][NJ],
                       float C[NJ][NM],
                       float D[NM][NL]) {
    int i, j;
    for (i = 0; i < ni; i++)
        for (j = 0; j < nk; j++)
            A[i][j] = (float)(i * j % ni) / (5 * ni);
    for (i = 0; i < nk; i++)
        for (j = 0; j < nj; j++)
            B[i][j] = (float)((i + 1) * (j + 1) % nj) / (5 * nj);
    for (i = 0; i < nj; i++)
        for (j = 0; j < nm; j++)
            C[i][j] = (float)(i * (j + 3) % nl) / (5 * nl);
    for (i = 0; i < nm; i++)
        for (j = 0; j < nl; j++)
            D[i][j] = (float)(i * (j + 2) % nk) / (5 * nk);
}

static void kernel_3mm(int ni, int nj, int nk, int nl, int nm,
                       float E[NI][NJ],
                       float A[NI][NK],
                       float B[NK][NJ],
                       float F[NJ][NL],
                       float C[NJ][NM],
                       float D[NM][NL],
                       float G[NI][NL]) {
    int i, j, k;

    // E := A * B
    #pragma omp parallel
    {
        #pragma omp for private(j, k)
        for (i = 0; i < ni; i++)
            for (j = 0; j < nj; j++) {
                E[i][j] = 0.0f;
                for (k = 0; k < nk; k++)
                    E[i][j] += A[i][k] * B[k][j];
            }
    }

    // F := C * D
    #pragma omp parallel
    {
        #pragma omp for private(j, k)
        for (i = 0; i < nj; i++)
            for (j = 0; j < nl; j++) {
                F[i][j] = 0.0f;
                for (k = 0; k < nm; k++)
                    F[i][j] += C[i][k] * D[k][j];
            }
    }

    // G := E * F
    #pragma omp parallel
    {
        #pragma omp for private(j, k)
        for (i = 0; i < ni; i++)
            for (j = 0; j < nl; j++) {
                G[i][j] = 0.0f;
                for (k = 0; k < nj; k++)
                    G[i][j] += E[i][k] * F[k][j];
            }
    }
}

int main() {
    float E[NI][NJ], A[NI][NK], B[NK][NJ];
    float F[NJ][NL], C[NJ][NM], D[NM][NL];
    float G[NI][NL];

    init_array(NI, NJ, NK, NL, NM, A, B, C, D);
    kernel_3mm(NI, NJ, NK, NL, NM, E, A, B, F, C, D, G);

    float sum = 0.0f;
    for (int i = 0; i < NI; i++)
        for (int j = 0; j < NL; j++)
            sum += G[i][j];

    return (sum > 0.0f) ? 0 : 1;
}
