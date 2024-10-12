#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem-per-cpu 6G
#SBATCH -c 12
#SBATCH --time=16:0:0

fq1=$1
fq2=$2
name=$3
ref='/home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/hg19.ethan.fa'
out_dir=$4
readgroup='@RG\tID:'$name'\tSM:'1'\tPL:'illumina'\tLB:'$name

source activate for_bwa
bwa mem -R $readgroup -t 12 -Ma $ref $fq1 $fq2 > $out_dir$name.sam
