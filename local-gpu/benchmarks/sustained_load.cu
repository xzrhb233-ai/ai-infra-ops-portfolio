// Day 6 load generator: keeps the GPU queue continuously full for a fixed
// wall-clock duration by relaunching the SGEMM kernel back-to-back, syncing
// only occasionally to check elapsed time (so the sync itself doesn't starve
// the queue and create artificial idle gaps between launches).
#include <chrono>
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

int main(int argc, char **argv) {
  const int dim = argc > 1 ? atoi(argv[1]) : 2048;
  const int duration_s = argc > 2 ? atoi(argv[2]) : 600;
  size_t bytes = (size_t)dim * dim * sizeof(float);

  float *h_a = (float *)malloc(bytes);
  float *h_b = (float *)malloc(bytes);
  for (int i = 0; i < dim * dim; ++i) {
    h_a[i] = 0.001f;
    h_b[i] = 0.002f;
  }
  float *d_a, *d_b, *d_c;
  CUDA_CHECK(cudaMalloc(&d_a, bytes));
  CUDA_CHECK(cudaMalloc(&d_b, bytes));
  CUDA_CHECK(cudaMalloc(&d_c, bytes));
  CUDA_CHECK(cudaMemcpy(d_a, h_a, bytes, cudaMemcpyHostToDevice));
  CUDA_CHECK(cudaMemcpy(d_b, h_b, bytes, cudaMemcpyHostToDevice));

  dim3 block(TILE, TILE);
  dim3 grid((dim + TILE - 1) / TILE, (dim + TILE - 1) / TILE);

  fprintf(stderr, "sustained_load: dim=%d duration=%ds starting\n", dim, duration_s);
  auto t_start = std::chrono::steady_clock::now();
  long launches = 0;
  const int SYNC_EVERY = 20; // check the clock every N launches, not every launch
  while (true) {
    for (int i = 0; i < SYNC_EVERY; ++i) {
      sgemm_naive_tiled<<<grid, block>>>(d_a, d_b, d_c, dim, dim, dim);
      launches++;
    }
    CUDA_CHECK(cudaDeviceSynchronize());
    double elapsed = std::chrono::duration<double>(
                          std::chrono::steady_clock::now() - t_start)
                          .count();
    if (elapsed >= duration_s)
      break;
  }
  double total = std::chrono::duration<double>(std::chrono::steady_clock::now() -
                                                t_start)
                     .count();
  fprintf(stderr, "sustained_load: done, %ld kernel launches in %.1fs (%.1f launches/s)\n",
          launches, total, launches / total);

  cudaFree(d_a);
  cudaFree(d_b);
  cudaFree(d_c);
  free(h_a);
  free(h_b);
  return 0;
}
