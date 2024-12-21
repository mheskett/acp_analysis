#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem=60000
#SBATCH -c 6
#SBATCH --time=1000

source activate for_star
srun STAR \
  --runThreadN 6 \
  --runMode genomeGenerate \
  --genomeDir /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/grch37 \
  --genomeFastaFiles /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/grch37/Homo_sapiens.GRCh37.dna.primary_assembly.fa \
  --sjdbGTFfile /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/grch37/Homo_sapiens.GRCh37.87.gtf \
  --sjdbOverhang 100
