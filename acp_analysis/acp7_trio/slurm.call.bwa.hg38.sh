#!/bin/bash

#SBATCH --partition=batch
#SBATCH --mem-per-cpu 6G
#SBATCH -c 16
#SBATCH --time=16:0:0
#SBATCH -A thayerlab

fq1=$1
fq2=$2
name=$3
ref='/home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/hg38_fasta_ref/hg38.fa'
out_dir=$4
readgroup='@RG\tID:'$name'\tSM:'$name'\tPL:'illumina'\tLB:'$name

source activate for_bwa
bwa mem -R $readgroup -t 16 -Ma $ref $fq1 $fq2 > $out_dir$name.sam
