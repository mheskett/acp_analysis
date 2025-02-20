#!/bin/bash

#SBATCH --partition=batch
#SBATCH --mem 30000
#SBATCH -c 1
#SBATCH --time=35:0:0
#SBATCH -A thayerlab

srun haplotypecaller.sh $1 $2
