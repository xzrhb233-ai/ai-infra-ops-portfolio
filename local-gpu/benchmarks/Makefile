NVCC ?= /usr/local/cuda-13.3/bin/nvcc
CFLAGS = -O3 -std=c++17
CUBLAS_LIBS = -lcublas

all: vector_add block_reduce_sum sgemm sustained_load

vector_add: vector_add.cu
	$(NVCC) $(CFLAGS) -o $@ $<

block_reduce_sum: block_reduce_sum.cu
	$(NVCC) $(CFLAGS) -o $@ $<

sgemm: sgemm.cu
	$(NVCC) $(CFLAGS) $(CUBLAS_LIBS) -o $@ $<

sustained_load: sustained_load.cu
	$(NVCC) $(CFLAGS) -o $@ $<

clean:
	rm -f vector_add block_reduce_sum sgemm sustained_load
