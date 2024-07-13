#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem=10000
#SBATCH -c 1
#SBATCH --time=20

srun get.vlinc.counts.sh $1 $2
