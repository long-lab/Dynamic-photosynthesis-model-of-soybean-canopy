#!/bin/bash
# ----------------SLURM Parameters----------------
#SBATCH -p normal
#SBATCH -n 1
#SBATCH --mem=128g
#SBATCH -N 1
# ----------------Load Modules--------------------
module load GCC/.8.2.0-2.32
# ----------------Commands------------------------
./RayTracer1904 231 12 20 50 0 76 0 100 0.1 3YCM_V231_rep2.txt 3PPF_outputV231_rep2_05-12.txt 0.075 0.075 1 1 5 12 0.0167 0 ./RayTracerParameters.txt 0 0 0 ./RayTracerclimate-data.txt 0 0 0 0
