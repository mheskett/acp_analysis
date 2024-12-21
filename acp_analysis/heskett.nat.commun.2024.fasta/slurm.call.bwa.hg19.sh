#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem-per-cpu 6G
#SBATCH -c 10
#SBATCH --time=16:0:0

fq1=$1
fq2=$2
name=$3
#ref='/home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/hg19.ethan.fa'
ref='/home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/grch37/Homo_sapiens.GRCh37.dna.primary_assembly.fa'

out_dir=$4
readgroup='@RG\tID:'$name'\tSM:'1'\tPL:'illumina'\tLB:'$name

source activate for_bwa
bwa mem -R $readgroup -t 12 -Ma $ref $fq1 $fq2 > $out_dir$name.sam
