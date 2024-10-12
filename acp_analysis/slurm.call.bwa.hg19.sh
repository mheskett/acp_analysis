#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem-per-cpu 6G
#SBATCH -c 4
#SBATCH --time=10:0:0

fq1=$1
fq2=$2
name=$3
ref='/home/groups/Spellmandata/heskett/myron_refs/human_g1k_v37.fasta'
out_dir=$4
readgroup='@RG\tID:'$name'\tSM:'1'\tPL:'illumina'\tLB:'$name

source activate for_bwa
bwa mem -R $readgroup -t 4 -Ma $ref $fq1 $fq2 > $out_dir$name.sam
