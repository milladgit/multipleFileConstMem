
#define N 100


extern __constant__ double buffer[];


void init_const_mem(double initValue) {
	double *a = (double*) malloc(N * sizeof(double));
	for(int i=0;i<N;i++) {
		a[i] = initValue * i;
	}
	cudaMemcpyToSymbol(buffer, a, N * sizeof(double));
	free(a);
}


__device__
double access_const_mem(int index) {
	return buffer[index];
}



