#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem 6000
#SBATCH -c 1
#SBATCH --time=22:0:0

srun ./redownload.missing.sh
#srun ./download.sh
