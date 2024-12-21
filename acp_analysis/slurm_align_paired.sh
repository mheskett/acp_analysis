#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem=40000
#SBATCH -c 12
#SBATCH --time=600

fq1=$1
fq2=$2
out_pref=$3
source activate for_star
srun STAR \
  --runThreadN 12 \
  --twopassMode Basic \
  --readFilesIn $fq1 $fq2 \
  --outFileNamePrefix $out_pref \
  --genomeDir /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/grch37 \
  --outSAMmapqUnique 60 \
  --outSAMtype BAM Unsorted \
  --outSAMstrandField intronMotif \
  --outSAMattributes NH HI NM MD jM jI \
#  --readFilesCommand zcat
#  --limitBAMsortRAM 53130127667
