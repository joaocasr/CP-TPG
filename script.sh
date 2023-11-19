#!/bin/bash
#SBATCH --time=1:00
#SBATCH --ntasks=40
#SBATCH --partition=cpar


for i in 2 4 8 16 32
do
        export OMP_NUM_THREADS=$i
        perf stat -e L1-dcache-load-misses -M cpi ./MDpar.exe < inputdata.txt
done