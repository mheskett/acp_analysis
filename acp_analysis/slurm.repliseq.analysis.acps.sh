#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem=10000
#SBATCH -c 1
#SBATCH --time=30

source activate for_bedtools

srun repliseq.analysis.acps.sh $1 $2 $3
