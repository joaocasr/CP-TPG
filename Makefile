CC = gcc
SRC = src/
PROFLAGS = -pg
CFLAGS = -w -Ofast
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
	./MD.exe < inputdata.txt
