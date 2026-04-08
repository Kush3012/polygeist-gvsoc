// ATAX kernel from PolyBench-ACC (OpenMP variant)
// y = A^T * (A * x)
// Adapted for bare-metal RISC-V / GVSoC: no stdio, stack arrays, small size

#define NX 32
#define NY 32

static void init_array(int nx, int ny,
                       float A[NX][NY],
                       float x[NY]) {
    int i, j;
    for (i = 0; i < ny; i++)
        x[i] = 1.0f + (float)i / ny;
    for (i = 0; i < nx; i++)
        for (j = 0; j < ny; j++)
            A[i][j] = (float)(i * (j + 1)) / nx;
}

static void kernel_atax(int nx, int ny,
                        float A[NX][NY],
                        float x[NY],
                        float y[NY],
                        float tmp[NX]) {
    int i, j;
    #pragma omp parallel
    {
        #pragma omp for
        for (i = 0; i < ny; i++)
            y[i] = 0.0f;

        #pragma omp for private(j)
        for (i = 0; i < nx; i++) {
            tmp[i] = 0.0f;
            for (j = 0; j < ny; j++)
                tmp[i] += A[i][j] * x[j];
            for (j = 0; j < ny; j++)
                y[j] += A[i][j] * tmp[i];
        }
    }
}

int main() {
    float A[NX][NY], x[NY], y[NY], tmp[NX];

    init_array(NX, NY, A, x);
    kernel_atax(NX, NY, A, x, y, tmp);

    float sum = 0.0f;
    for (int i = 0; i < NY; i++)
        sum += y[i];

    return (sum > 0.0f) ? 0 : 1;
}
