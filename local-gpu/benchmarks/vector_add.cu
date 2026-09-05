// Day 4 benchmark: classic vectorAdd (element-wise C = A + B on the GPU).
// Self-contained, no external deps beyond the CUDA runtime — built with plain nvcc.
#include <cstdio>
#include <cstdlib>
#include <cuda_runtime.h>

#define CUDA_CHECK(call)                                                      \
  do {                                                                        \
    cudaError_t err__ = (call);                                               \
    if (err__ != cudaSuccess) {                                               \
      fprintf(stderr, "CUDA error %s at %s:%d\n", cudaGetErrorString(err__),  \
              __FILE__, __LINE__);                                            \
      exit(1);                                                                \
    }                                                                         \
  } while (0)

__global__ void vector_add_kernel(const float *a, const float *b, float *c,
                                   int n) {
  int idx = blockIdx.x * blockDim.x + threadIdx.x;
  if (idx < n)
    c[idx] = a[idx] + b[idx];
}

int main(int argc, char **argv) {
  const int n = argc > 1 ? atoi(argv[1]) : (1 << 24); // 16,777,216 elements
  const int repeats = argc > 2 ? atoi(argv[2]) : 3;
  size_t bytes = (size_t)n * sizeof(float);

  float *h_a = (float *)malloc(bytes);
  float *h_b = (float *)malloc(bytes);
  float *h_c = (float *)malloc(bytes);
  for (int i = 0; i < n; ++i) {
    h_a[i] = 1.0f;
    h_b[i] = 2.0f;
  }

  float *d_a, *d_b, *d_c;
  CUDA_CHECK(cudaMalloc(&d_a, bytes));
  CUDA_CHECK(cudaMalloc(&d_b, bytes));
  CUDA_CHECK(cudaMalloc(&d_c, bytes));
  CUDA_CHECK(cudaMemcpy(d_a, h_a, bytes, cudaMemcpyHostToDevice));
  CUDA_CHECK(cudaMemcpy(d_b, h_b, bytes, cudaMemcpyHostToDevice));

  int threads = 256;
  int blocks = (n + threads - 1) / threads;

  cudaEvent_t start, stop;
  CUDA_CHECK(cudaEventCreate(&start));
  CUDA_CHECK(cudaEventCreate(&stop));

  // warmup (not timed) so the first-launch JIT/context cost doesn't pollute results
  vector_add_kernel<<<blocks, threads>>>(d_a, d_b, d_c, n);
  CUDA_CHECK(cudaDeviceSynchronize());

  printf("kernel,n,run,time_ms,bandwidth_gbps\n");
  for (int r = 1; r <= repeats; ++r) {
    CUDA_CHECK(cudaEventRecord(start));
    vector_add_kernel<<<blocks, threads>>>(d_a, d_b, d_c, n);
    CUDA_CHECK(cudaEventRecord(stop));
    CUDA_CHECK(cudaEventSynchronize(stop));
    float ms = 0;
    CUDA_CHECK(cudaEventElapsedTime(&ms, start, stop));
    // 2 reads + 1 write of 4 bytes per element
    double gbps = (3.0 * bytes / 1e9) / (ms / 1000.0);
    printf("vector_add,%d,%d,%.4f,%.2f\n", n, r, ms, gbps);
  }

  CUDA_CHECK(cudaMemcpy(h_c, d_c, bytes, cudaMemcpyDeviceToHost));
  int errors = 0;
  for (int i = 0; i < n; ++i)
    if (h_c[i] != 3.0f)
      errors++;
  fprintf(stderr, "correctness_check: %s (%d mismatches out of %d)\n",
          errors == 0 ? "PASS" : "FAIL", errors, n);

  cudaFree(d_a);
  cudaFree(d_b);
  cudaFree(d_c);
  free(h_a);
  free(h_b);
  free(h_c);
  return errors == 0 ? 0 : 1;
}
