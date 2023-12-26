#!/bin/bash
#SBATCH --time=10:00
#SBATCH --ntasks=4
#SBATCH --partition=cpar

export OMP_NUM_THREADS=21
time mpirun -np 4 ./MDmpi.exe < inputdata.txt
