#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem=10000
#SBATCH -c 1
#SBATCH --time=20

srun get.gene.counts.sh $1
