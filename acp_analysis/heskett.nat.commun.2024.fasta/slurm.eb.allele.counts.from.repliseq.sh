#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem=30000
#SBATCH -c 1
#SBATCH --time=1000

srun eb.allele.counts.from.bam.repliseq.sh $1 $2