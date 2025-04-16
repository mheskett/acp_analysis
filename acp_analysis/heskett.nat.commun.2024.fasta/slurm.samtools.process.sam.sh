#!/bin/bash

#SBATCH --partition=batch
#SBATCH --mem 60000
#SBATCH -c 8
#SBATCH --time=2000
#SBATCH -A thayerlab

source activate for_samtools

srun ./samtools.process.sam.sh $1 $2
