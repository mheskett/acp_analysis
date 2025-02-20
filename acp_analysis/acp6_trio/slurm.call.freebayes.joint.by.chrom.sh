#!/bin/bash

#SBATCH --partition=batch
#SBATCH --mem 40000
#SBATCH -c 1
#SBATCH --time=30:0:0
#SBATCH -A thayerlab

chrom=$1
out_dir=$2

source activate for_freebayes
#echo ALL_20141222.dbSNP142_human_GRCh38.snps.chr$chrom.bed
freebayes \
  -f /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/hg38_fasta_ref/hg38.fa \
  --min-mapping-quality 30 \
  --min-base-quality 20 \
  --use-mapping-quality \
  --targets ALL_20141222.dbSNP142_human_GRCh38.snps.$chrom.bed \
  --limit-coverage 30 \
  --min-alternate-count 1 \
  --genotype-qualities \
  acp1001a_mom.sorted.markdup.$chrom.bam  acp1001b_dad.sorted.markdup.$chrom.bam  acp6_child.sorted.markdup.$chrom.bam \
  > ./acp6_joint.fb30.$chrom.vcf

###
#  --min-alternate-count 2 \
#  --min-coverage 3 \
