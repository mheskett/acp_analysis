#!/bin/bash

#SBATCH --partition=batch
#SBATCH --mem 60000
#SBATCH -c 12
#SBATCH --time=1500
#SBATCH -A thayerlab

source activate for_samtools

./samtools.process.sam.sh $1 $2
