#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem=30000
#SBATCH -c 1
#SBATCH --time=1000

srun gm12878.allele.counts.from.bam.sh $1 $2
