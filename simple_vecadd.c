// file: tests/simple_vecadd.c
#define N 64

static void init(float *a, float *b) {
    for (int i = 0; i < N; i++) {
        a[i] = (float)i;
        b[i] = (float)(2 * i);
    }
}

int main() {
    float a[N], b[N], c[N];
    init(a, b);

    #pragma omp parallel for
    for (int i = 0; i < N; i++) {
        c[i] = a[i] + b[i];
    }

    float sum = 0.0f;
    for (int i = 0; i < N; i++) sum += c[i];
    return (sum > 0.0f) ? 0 : 1;
}