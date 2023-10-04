CC = gcc
SRC = src/
CFLAGS = -pg

.DEFAULT_GOAL = MD.exe

MD.exe: $(SRC)/MD.cpp
	$(CC) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe

clean:
	rm ./MD.exe cp_output.txt cp_average.txt cp_traj.xyz gmon.out

run:
	./MD.exe < inputdata.txt
