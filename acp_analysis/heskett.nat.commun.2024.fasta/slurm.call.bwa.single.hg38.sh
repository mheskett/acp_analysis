#!/bin/bash

#SBATCH --partition=batch
#SBATCH --mem-per-cpu 6G
#SBATCH -c 16
#SBATCH --time=24:0:0
#SBATCH -A thayerlab

fq1=$1
rg_name=$2
sample_name=$3
ref='/home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/hg38_fasta_ref/hg38.fa'
out_dir=$4
### setting the ID, SM, and LB just to the sample name
readgroup='@RG\tID:'$rg_name'\tSM:'$rg_name'\tPL:'illumina'\tLB:'$rg_name

source activate for_bwa
bwa mem -R $readgroup -t 16 -Ma $ref $fq1 > $out_dir$sample_name.hg38.sam
