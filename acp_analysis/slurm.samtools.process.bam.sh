#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem=40000
#SBATCH -c 4
#SBATCH --time=1000

#1 is inpiut #2 is out dir

srun samtools.process.bam.sh $1 $2
