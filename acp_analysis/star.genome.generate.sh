#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem=60000
#SBATCH -c 6
#SBATCH --time=1000


srun STAR \
  --runThreadN 6 \
  --runMode genomeGenerate \
  --genomeDir /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis \
  --genomeFastaFiles /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/Homo_sapiens.GRCh37.dna.primary_assembly.fa \
  --sjdbGTFfile /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/Homo_sapiens.GRCh37.87.gtf \
  --sjdbOverhang 100
