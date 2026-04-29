// Floyd-Warshall kernel from PolyBench-ACC (OpenMP variant)
// Adapted for bare-metal RISC-V / GVSoC: no stdio, stack arrays, small size
// All-pairs shortest paths: path[i][j] = min path from i to j

#define N 32

static void init_array(int n, float path[N][N]) {
    int i, j;
    for (i = 0; i < n; i++)
        for (j = 0; j < n; j++)
            path[i][j] = (float)((i + 1) * (j + 1)) / n;
}

static void kernel_floyd_warshall(int n, float path[N][N]) {
    int i, j, k;
    for (k = 0; k < n; k++) {
        #pragma omp parallel
        {
            #pragma omp for
            for (i = 0; i < n; i++) {
                for (j = 0; j < n; j++) {
                    float path_new = path[i][k] + path[k][j];
                    path[i][j] = (path[i][j] < path_new) ? path[i][j] : path_new;
                }
            }
        }
    }
}

int main() {
    float path[N][N];

    init_array(N, path);
    kernel_floyd_warshall(N, path);

    // Checksum to prevent DCE and validate
    float sum = 0.0f;
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++)
            sum += path[i][j];

    return (sum > 0.0f) ? 0 : 1;
}
