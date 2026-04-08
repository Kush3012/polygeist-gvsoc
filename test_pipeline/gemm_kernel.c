// GEMM kernel extracted from PolyBench-ACC (OpenMP variant)
// Simplified for bare-metal RISC-V / GVSoC target
// C = alpha * A * B + beta * C

#define NI 32
#define NJ 32
#define NK 32

void init_array(int ni, int nj, int nk,
                float *alpha, float *beta,
                float C[NI][NJ],
                float A[NI][NK],
                float B[NK][NJ]) {
  int i, j;
  *alpha = 32412.0f;
  *beta = 2123.0f;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
      C[i][j] = ((float)i * j) / ni;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      A[i][j] = ((float)i * j) / ni;
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      B[i][j] = ((float)i * j) / ni;
}

void kernel_gemm(int ni, int nj, int nk,
                 float alpha, float beta,
                 float C[NI][NJ],
                 float A[NI][NK],
                 float B[NK][NJ]) {
  int i, j, k;
  #pragma omp parallel
  {
    #pragma omp for private(j, k)
    for (i = 0; i < ni; i++) {
      for (j = 0; j < nj; j++) {
        C[i][j] *= beta;
      }
      for (k = 0; k < nk; k++) {
        for (j = 0; j < nj; j++) {
          C[i][j] += alpha * A[i][k] * B[k][j];
        }
      }
    }
  }
}

int main() {
  float alpha, beta;
  float C[NI][NJ], A[NI][NK], B[NK][NJ];

  init_array(NI, NJ, NK, &alpha, &beta, C, A, B);
  kernel_gemm(NI, NJ, NK, alpha, beta, C, A, B);

  // Return a checksum value to prevent DCE
  float sum = 0.0f;
  for (int i = 0; i < NI; i++)
    for (int j = 0; j < NJ; j++)
      sum += C[i][j];
  return (int)sum;
}
