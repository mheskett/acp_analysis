#!/bin/bash

#SBATCH --partition=batch
#SBATCH --mem 40000
#SBATCH -c 1
#SBATCH --time=30:0:0
#SBATCH -A thayerlab

chrom=$1
out_dir=$2

source activate for_freebayes

freebayes \
  -f /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/hg38_fasta_ref/hg38.fa \
  --min-mapping-quality 30 \
  --min-base-quality 20 \
  --use-mapping-quality \
  --targets ../hg38_1kg_reference_snps/ALL_20141222.dbSNP142_human_GRCh38.snps.$chrom.bed \
  --limit-coverage 30 \
  --min-alternate-count 1 \
  --genotype-qualities \
  acp1005a_mom.sorted.markdup.$chrom.bam  acp1005b_dad.sorted.markdup.$chrom.bam  acp7_child.sorted.markdup.$chrom.bam \
  > ./acp7_joint.fb30.$chrom.vcf
