#!/bin/bash
#SBATCH --time=5:00
#SBATCH --ntasks=40
#SBATCH --partition=cpar


for i in 2 4 8 12 16 20 24 28 32 36
do
        export OMP_NUM_THREADS=$i
        echo "RUNNING WITH ${i} THREADS"
        perf stat -e L1-dcache-load-misses -M cpi ./MDpar.exe < inputdata.txt
done