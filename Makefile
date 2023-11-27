CC = gcc
SRC = src/
PROFLAGS = -pg
CFLAGS = -O2 -w -funroll-all-loops -ftree-vectorize -mavx -march=native -fpredictive-commoning

#-ftree-vectorize -mavx
#CFLAGS = -Ofast -w
#-fopt-info-vec-optimized
#-fopt-info-vec-optimized
#-fopt-info-vec-missed
#-O2

.DEFAULT_GOAL = all

all: MDpar.exe MDseq.exe

MDpar.exe: $(SRC)/MD.cpp
	module load gcc/11.2.0;\
	$(CC) $(PROFLAGS) $(CFLAGS) $(SRC)MD.cpp -lm -fopenmp -o MDpar.exe

MDseq.exe: $(SRC)/original.cpp
	module load gcc/11.2.0;\
	$(CC) $(PROFLAGS) $(CFLAGS) $(SRC)original.cpp -lm -o MDseq.exe

clean:
	rm -f ./MD*.exe output*.txt slurm*.out cp_output.txt cp_average.txt cp_traj.xyz gmon.out report.txt

runseq:
	./MDseq.exe < inputdata.txt

runpar:
	export OMP_NUM_THREADS=21;\
	./MDpar.exe < inputdata.txt

