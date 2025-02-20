#!/bin/bash

#SBATCH --partition=batch
#SBATCH --mem 40000
#SBATCH -c 1
#SBATCH --time=30:0:0
#SBATCH -A thayerlab

source activate for_freebayes

freebayes \
  -f /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/hg38_fasta_ref/hg38.fa \
  --min-mapping-quality 30 \
  --min-base-quality 20 \
  --min-alternate-count 2 \
  --min-coverage 3 \
  --use-mapping-quality \
  --limit-coverage 50 \
  --genotype-qualities \
  acp1001a_mom.sorted.markdup.bam  acp1001b_dad.sorted.markdup.bam  acp6_child.sorted.markdup.bam \
  > ./acp6_joint.fb30.vcf
