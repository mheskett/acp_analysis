#!/bin/bash

#SBATCH --partition=batch
#SBATCH --mem 20000
#SBATCH -c 1
#SBATCH --time=16:0:0
#SBATCH -A thayerlab

#input bam
input=$1
chrom=$2
out_dir=$3

b=$(basename $input) ## removes /path/to/file
filename=${b%.*}

source activate for_samtools

samtools mpileup -l ALL_20141222.dbSNP142_human_GRCh38.snps.$chrom.bed $input | gzip -c > $out_dir$filename.$chrom.mpileup.gz


