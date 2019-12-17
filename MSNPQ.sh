#!/bin/bash
# ----------------SLURM Parameters----------------
#SBATCH -p normal
#SBATCH -n 1
#SBATCH --mem=16g
#SBATCH -N 1
# ----------------Load Modules--------------------
module load MATLAB/2017b
# ----------------Commands------------------------
matlab -nodisplay -nodesktop -r "SimNPQ;quit"
