#!/bin/bash

#SBATCH --partition=batch
#SBATCH --mem 50000
#SBATCH -c 8
#SBATCH --time=500
#SBATCH -A thayerlab

source activate for_samtools

./samtools.process.bam.sh $1 $2
