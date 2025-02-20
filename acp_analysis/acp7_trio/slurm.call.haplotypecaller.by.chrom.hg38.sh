#!/bin/bash

#SBATCH --partition=batch
#SBATCH --mem 30000
#SBATCH -c 1
#SBATCH --time=8:0:0
#SBATCH -A thayerlab

srun haplotypecaller.by.chrom.sh $1 $2 $3
