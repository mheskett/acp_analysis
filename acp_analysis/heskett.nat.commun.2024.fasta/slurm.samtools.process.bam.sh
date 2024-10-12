#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem 50000
#SBATCH -c 8
#SBATCH --time=500

source activate for_samtools

./samtools.process.bam.sh $1 $2
