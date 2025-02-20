#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem-per-cpu 12000
#SBATCH -c 8
#SBATCH --time=2:0:0

fq1=$1
name=$2
ref='/home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/grch37/Homo_sapiens.GRCh37.dna.primary_assembly.fa'

out_dir=$3
readgroup='@RG\tID:'$name'\tSM:'1'\tPL:'illumina'\tLB:'$name

source activate for_bwa
bwa mem -R $readgroup -t 8 -Ma $ref $fq1 > $out_dir$name.sam
