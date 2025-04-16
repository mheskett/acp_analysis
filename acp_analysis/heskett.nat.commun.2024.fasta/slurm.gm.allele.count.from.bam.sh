#!/bin/bash

#SBATCH --partition=batch
#SBATCH --mem 30000
#SBATCH -c 1
#SBATCH --time=22:0:0
#SBATCH -A thayerlab

srun gm12878.allele.count.from.bam.hg38.sh $1 $2
