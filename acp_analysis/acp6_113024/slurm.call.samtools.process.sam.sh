#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem 12000
#SBATCH -c 1
#SBATCH --time=6:0:0

./samtools.process.sam.sh $1 $2
