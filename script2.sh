#!/bin/bash
#SBATCH --time=10:00
#SBATCH --ntasks=6
#SBATCH --partition=cpar

export OMP_NUM_THREADS=21
time mpirun -np 6 ./MDmpi.exe < inputdata.txt
