#include <stdio.h>
#include <cuda_runtime.h>

#include <iostream>

using namespace std;

__device__ extern double access_const_mem(int index);
extern void init_const_mem(double initValue);


__global__
void const_kernel() {
	for(int i=0;i<10;i++) {
		printf("%d: %.3f\n", i, access_const_mem(i));
	}
}

int main() {
	init_const_mem(23);

	const_kernel<<<1, 1>>>();

	cudaDeviceSynchronize();

	return 0;
}
