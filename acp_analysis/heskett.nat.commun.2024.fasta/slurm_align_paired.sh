#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem-per-cpu 6G
#SBATCH -c 12
#SBATCH --time=1000

fq1=$1
fq2=$2
out_pref=$3

source activate for_star
srun STAR \
  --runThreadN 12 \
  --twopassMode Basic \
  --readFilesIn $fq1 $fq2 \
  --outFileNamePrefix $out_pref \
  --genomeDir /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis \
  --outSAMmapqUnique 60 \
  --outSAMtype BAM Unsorted \
  --outSAMstrandField intronMotif \
  --outSAMattributes NH HI NM MD jM jI \
  --readFilesCommand zcat
#  --limitBAMsortRAM 53130127667
