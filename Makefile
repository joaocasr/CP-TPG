CC = gcc
SRC = src/
PROFLAGS = -pg
CFLAGS = -O2 -w -fopenmp -floop-interchange -funroll-all-loops -ftree-vectorize -mavx

#-ftree-vectorize -mavx
#CFLAGS = -Ofast -w
#-fopt-info-vec-optimized
#-fopt-info-vec-optimized
#-fopt-info-vec-missed
#-O2

.DEFAULT_GOAL = MD.exe

MD.exe: $(SRC)/MD.cpp
	$(CC) $(PROFLAGS) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe

clean:
	rm ./MD.exe cp_output.txt cp_average.txt cp_traj.xyz gmon.out

run:
	srun --partition=cpar --cpus-per-task=2 perf stat -e L1-dcache-load-misses -M cpi ./MD.exe < inputdata.txt
	#srun --partition=cpar --cpus-per-task=2 perf stat
