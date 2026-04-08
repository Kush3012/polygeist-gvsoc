// Simple GEMM kernel for toolchain testing
// C = alpha * A * B + beta * C

#define N 16

void gemm(int n, float alpha, float beta,
          float C[N][N], float A[N][N], float B[N][N]) {
  int i, j, k;
  for (i = 0; i < n; i++) {
    for (j = 0; j < n; j++) {
      C[i][j] *= beta;
      for (k = 0; k < n; k++) {
        C[i][j] += alpha * A[i][k] * B[k][j];
      }
    }
  }
}

int main() {
  float A[N][N], B[N][N], C[N][N];
  int i, j;
  for (i = 0; i < N; i++)
    for (j = 0; j < N; j++) {
      A[i][j] = (float)(i + j);
      B[i][j] = (float)(i * j);
      C[i][j] = 0.0f;
    }
  gemm(N, 1.0f, 0.0f, C, A, B);
  return (int)C[0][0];
}
