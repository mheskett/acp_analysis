#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem 60000
#SBATCH -c 16
#SBATCH --time=1000

source activate for_samtools

./samtools.process.sam.sh $1 $2
