#!/bin/bash

#SBATCH --partition=batch
#SBATCH --mem 30000
#SBATCH -c 1
#SBATCH --time=20:0:0
#SBATCH -A thayerlab

srun acp7.allele.count.from.bam.by.chrom.sh $1 $2 $3
