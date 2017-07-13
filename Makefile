

all:
	nvcc -c -rdc true *.cu
	nvcc *.o -o main

clean:
	rm -f *.o main

