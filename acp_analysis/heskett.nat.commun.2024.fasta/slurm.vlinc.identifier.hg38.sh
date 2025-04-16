#!/bin/bash

#SBATCH --partition=batch
#SBATCH --mem 20000
#SBATCH -c 1
#SBATCH --time=8:0:0
#SBATCH -A thayerlab

srun vlinc.identifier.intergenic.only.hg38.by.chrom.sh $1 $2 $3 $4 $5 $6
