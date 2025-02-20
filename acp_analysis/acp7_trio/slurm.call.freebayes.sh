#!/bin/bash

#SBATCH --partition=batch
#SBATCH --mem 30000
#SBATCH -c 1
#SBATCH --time=12:0:0
#SBATCH -A thayerlab

input=$1
b=$(basename $input) ## removes /path/to/file
filename=${b%.*}
chrom=$2
out_dir=$3

source activate for_freebayes

freebayes \
  -f /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/hg38_fasta_ref/hg38.fa \
  -r chr$chrom \
  --min-mapping-quality 20 \
  --min-base-quality 20 \
  --min-alternate-count 2 \
  --min-coverage 3 \
  --use-mapping-quality \
  --limit-coverage 50 \
  --genotype-qualities \
  $input \
  > $out_dir$filename.fb.vcf
