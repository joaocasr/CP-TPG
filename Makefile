CC = gcc
SRC = src/
PROFLAGS = -pg
CFLAGS = -O2 -w -fopenmp -funroll-all-loops -ftree-vectorize -mavx -march=native

#-ftree-vectorize -mavx
#CFLAGS = -Ofast -w
#-fopt-info-vec-optimized
#-fopt-info-vec-optimized
#-fopt-info-vec-missed
#-O2

.DEFAULT_GOAL = all

all: MDpar.exe #MDseq.exe

MDpar.exe: $(SRC)/MD.cpp
	module load gcc/11.2.0;
	$(CC) $(PROFLAGS) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe

MDseq.exe: $(SRC)/original.cpp
	module load gcc/11.2.0;
	$(CC) $(PROFLAGS) $(CFLAGS) $(SRC)original.cpp -lm -o MD.exe

clean:
	rm -f ./MD.exe cp_output.txt cp_average.txt cp_traj.xyz gmon.out report.txt

run:
	sbatch script.sh
