#!/bin/bash

#SBATCH --partition=batch
#SBATCH --mem 30000
#SBATCH -c 4
#SBATCH --time=500
#SBATCH -A thayerlab

source activate for_samtools

./samtools.process.sam.sh $1 $2
