#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem=90000
#SBATCH -c 1
#SBATCH --time=300

# 1 input 2 outdir
srun vlinc.identifier.intergenic.only.hg19.chr.sh $1 $2 $3 $4 $5
