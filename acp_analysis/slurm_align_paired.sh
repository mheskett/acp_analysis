#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem=30000
#SBATCH -c 4
#SBATCH --time=600

fq1=$1
fq2=$2
out_pref=$3

srun STAR \
  --runThreadN 16 \
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
