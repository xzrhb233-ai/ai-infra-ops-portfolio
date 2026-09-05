// Day 4 benchmark: SGEMM (C = A*B, square matrices), naive shared-memory tiled
// kernel vs. cuBLAS SGEMM as a reference upper bound. Self-contained nvcc build.
#include <cstdio>
#include <cstdlib>
#include <cublas_v2.h>
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

#define CUBLAS_CHECK(call)                                                    \
  do {                                                                        \
    cublasStatus_t st__ = (call);                                             \
    if (st__ != CUBLAS_STATUS_SUCCESS) {                                      \
      fprintf(stderr, "cuBLAS error %d at %s:%d\n", (int)st__, __FILE__,      \
              __LINE__);                                                      \
      exit(1);                                                                \
    }                                                                         \
  } while (0)

#define TILE 32

__global__ void sgemm_naive_tiled(const float *A, const float *B, float *C,
                                   int M, int N, int K) {
  __shared__ float As[TILE][TILE];
  __shared__ float Bs[TILE][TILE];
  int row = blockIdx.y * TILE + threadIdx.y;
  int col = blockIdx.x * TILE + threadIdx.x;
  float acc = 0.0f;
  for (int t = 0; t < (K + TILE - 1) / TILE; ++t) {
    int a_col = t * TILE + threadIdx.x;
    int b_row = t * TILE + threadIdx.y;
    As[threadIdx.y][threadIdx.x] = (row < M && a_col < K) ? A[row * K + a_col] : 0.0f;
    Bs[threadIdx.y][threadIdx.x] = (b_row < K && col < N) ? B[b_row * N + col] : 0.0f;
    __syncthreads();
#pragma unroll
    for (int k = 0; k < TILE; ++k)
      acc += As[threadIdx.y][k] * Bs[k][threadIdx.x];
    __syncthreads();
  }
  if (row < M && col < N)
    C[row * N + col] = acc;
}

static double run_naive(const float *dA, const float *dB, float *dC, int M,
                         int N, int K, int repeats, const char *tag) {
  dim3 block(TILE, TILE);
  dim3 grid((N + TILE - 1) / TILE, (M + TILE - 1) / TILE);
  cudaEvent_t start, stop;
  CUDA_CHECK(cudaEventCreate(&start));
  CUDA_CHECK(cudaEventCreate(&stop));

  sgemm_naive_tiled<<<grid, block>>>(dA, dB, dC, M, N, K); // warmup
  CUDA_CHECK(cudaDeviceSynchronize());

  double total_ms = 0;
  for (int r = 1; r <= repeats; ++r) {
    CUDA_CHECK(cudaEventRecord(start));
    sgemm_naive_tiled<<<grid, block>>>(dA, dB, dC, M, N, K);
    CUDA_CHECK(cudaEventRecord(stop));
    CUDA_CHECK(cudaEventSynchronize(stop));
    float ms = 0;
    CUDA_CHECK(cudaEventElapsedTime(&ms, start, stop));
    double gflops = (2.0 * M * N * K / 1e9) / (ms / 1000.0);
    printf("%s,%d,%d,%.4f,%.2f\n", tag, M, r, ms, gflops);
    total_ms += ms;
  }
  return total_ms / repeats;
}

static double run_cublas(cublasHandle_t handle, const float *dA, const float *dB,
                          float *dC, int M, int N, int K, int repeats,
                          const char *tag) {
  const float alpha = 1.0f, beta = 0.0f;
  cudaEvent_t start, stop;
  CUDA_CHECK(cudaEventCreate(&start));
  CUDA_CHECK(cudaEventCreate(&stop));

  // cuBLAS is column-major; compute C^T = B^T * A^T to get row-major C = A*B.
  CUBLAS_CHECK(cublasSgemm(handle, CUBLAS_OP_N, CUBLAS_OP_N, N, M, K, &alpha,
                           dB, N, dA, K, &beta, dC, N)); // warmup
  CUDA_CHECK(cudaDeviceSynchronize());

  double total_ms = 0;
  for (int r = 1; r <= repeats; ++r) {
    CUDA_CHECK(cudaEventRecord(start));
    CUBLAS_CHECK(cublasSgemm(handle, CUBLAS_OP_N, CUBLAS_OP_N, N, M, K, &alpha,
                             dB, N, dA, K, &beta, dC, N));
    CUDA_CHECK(cudaEventRecord(stop));
    CUDA_CHECK(cudaEventSynchronize(stop));
    float ms = 0;
    CUDA_CHECK(cudaEventElapsedTime(&ms, start, stop));
    double gflops = (2.0 * M * N * K / 1e9) / (ms / 1000.0);
    printf("%s,%d,%d,%.4f,%.2f\n", tag, M, r, ms, gflops);
    total_ms += ms;
  }
  return total_ms / repeats;
}

int main(int argc, char **argv) {
  const int dim = argc > 1 ? atoi(argv[1]) : 1024; // M=N=K=dim
  const int repeats = argc > 2 ? atoi(argv[2]) : 3;
  size_t bytes = (size_t)dim * dim * sizeof(float);

  float *h_a = (float *)malloc(bytes);
  float *h_b = (float *)malloc(bytes);
  for (int i = 0; i < dim * dim; ++i) {
    h_a[i] = 0.01f;
    h_b[i] = 0.02f;
  }

  float *d_a, *d_b, *d_c;
  CUDA_CHECK(cudaMalloc(&d_a, bytes));
  CUDA_CHECK(cudaMalloc(&d_b, bytes));
  CUDA_CHECK(cudaMalloc(&d_c, bytes));
  CUDA_CHECK(cudaMemcpy(d_a, h_a, bytes, cudaMemcpyHostToDevice));
  CUDA_CHECK(cudaMemcpy(d_b, h_b, bytes, cudaMemcpyHostToDevice));

  printf("kernel,dim,run,time_ms,gflops\n");
  run_naive(d_a, d_b, d_c, dim, dim, dim, repeats, "sgemm_naive_tiled");

  // correctness spot check for the naive kernel: every element should be
  // dim * 0.01 * 0.02 (within fp32 tolerance)
  float *h_c = (float *)malloc(bytes);
  CUDA_CHECK(cudaMemcpy(h_c, d_c, bytes, cudaMemcpyDeviceToHost));
  float expected = dim * 0.01f * 0.02f;
  float diff = fabsf(h_c[0] - expected);
  fprintf(stderr, "naive correctness_check: %s (C[0]=%.4f expected=%.4f)\n",
          diff < expected * 0.01f ? "PASS" : "FAIL", h_c[0], expected);

  cublasHandle_t handle;
  CUBLAS_CHECK(cublasCreate(&handle));
  run_cublas(handle, d_a, d_b, d_c, dim, dim, dim, repeats, "sgemm_cublas");
  CUBLAS_CHECK(cublasDestroy(handle));

  cudaFree(d_a);
  cudaFree(d_b);
  cudaFree(d_c);
  free(h_a);
  free(h_b);
  free(h_c);
  return 0;
}
