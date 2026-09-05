// Day 4 benchmark: block-level parallel reduction (sum of N floats).
// Warp-shuffle + shared-memory tree reduction, self-contained (plain nvcc, no torch).
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

#define WARP_SIZE 32
#define NUM_THREADS 256

__device__ __forceinline__ float warp_reduce_sum(float val) {
#pragma unroll
  for (int mask = WARP_SIZE >> 1; mask >= 1; mask >>= 1)
    val += __shfl_xor_sync(0xffffffff, val, mask);
  return val;
}

__global__ void block_all_reduce_sum_kernel(const float *a, float *y, int n) {
  constexpr int NUM_WARPS = NUM_THREADS / WARP_SIZE;
  __shared__ float smem[NUM_WARPS];
  int tid = threadIdx.x;
  int idx = blockIdx.x * NUM_THREADS + tid;
  float sum = (idx < n) ? a[idx] : 0.0f;
  int warp = tid / WARP_SIZE, lane = tid % WARP_SIZE;
  sum = warp_reduce_sum(sum);
  if (lane == 0)
    smem[warp] = sum;
  __syncthreads();
  sum = (lane < NUM_WARPS) ? smem[lane] : 0.0f;
  if (warp == 0)
    sum = warp_reduce_sum(sum);
  if (tid == 0)
    atomicAdd(y, sum);
}

int main(int argc, char **argv) {
  const int n = argc > 1 ? atoi(argv[1]) : (1 << 24);
  const int repeats = argc > 2 ? atoi(argv[2]) : 3;
  size_t bytes = (size_t)n * sizeof(float);

  float *h_a = (float *)malloc(bytes);
  for (int i = 0; i < n; ++i)
    h_a[i] = 1.0f; // expected sum == n, exact in fp32 for these sizes

  float *d_a, *d_y;
  CUDA_CHECK(cudaMalloc(&d_a, bytes));
  CUDA_CHECK(cudaMalloc(&d_y, sizeof(float)));
  CUDA_CHECK(cudaMemcpy(d_a, h_a, bytes, cudaMemcpyHostToDevice));

  int blocks = (n + NUM_THREADS - 1) / NUM_THREADS;
  cudaEvent_t start, stop;
  CUDA_CHECK(cudaEventCreate(&start));
  CUDA_CHECK(cudaEventCreate(&stop));

  float zero = 0.0f;
  CUDA_CHECK(cudaMemcpy(d_y, &zero, sizeof(float), cudaMemcpyHostToDevice));
  block_all_reduce_sum_kernel<<<blocks, NUM_THREADS>>>(d_a, d_y, n); // warmup
  CUDA_CHECK(cudaDeviceSynchronize());

  printf("kernel,n,run,time_ms,bandwidth_gbps\n");
  for (int r = 1; r <= repeats; ++r) {
    CUDA_CHECK(cudaMemcpy(d_y, &zero, sizeof(float), cudaMemcpyHostToDevice));
    CUDA_CHECK(cudaEventRecord(start));
    block_all_reduce_sum_kernel<<<blocks, NUM_THREADS>>>(d_a, d_y, n);
    CUDA_CHECK(cudaEventRecord(stop));
    CUDA_CHECK(cudaEventSynchronize(stop));
    float ms = 0;
    CUDA_CHECK(cudaEventElapsedTime(&ms, start, stop));
    double gbps = (bytes / 1e9) / (ms / 1000.0); // one read per element
    printf("block_reduce_sum,%d,%d,%.4f,%.2f\n", n, r, ms, gbps);
  }

  float h_y = 0;
  CUDA_CHECK(cudaMemcpy(&h_y, d_y, sizeof(float), cudaMemcpyDeviceToHost));
  fprintf(stderr, "correctness_check: %s (got %.1f, expected %.1f)\n",
          h_y == (float)n ? "PASS" : "FAIL", h_y, (float)n);

  cudaFree(d_a);
  cudaFree(d_y);
  free(h_a);
  return h_y == (float)n ? 0 : 1;
}
