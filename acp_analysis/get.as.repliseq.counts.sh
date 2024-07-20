#!/bin/bash

input=$1 ## BAM file from BWA, or whatever.
out_dir=$2
b=$(basename $input) ## removes /path/to/file
filename=${b%.*} ### removes file extension


## input is the haplotype resolved allele counts bed file
source activate for_bedtools

## hg19.ethan.bedtools.genome.lexicographically2.250kb.windows.bed
## hg19.ethan.bedtools.genome.lexicographically2.50kb.windows.bed
bedtools map -g hg19.ethan.bedtools.genome.lexicographically2.txt -a hg19.ethan.bedtools.genome.lexicographically2.250kb.windows.bed \
             -b $input \
             -o sum,sum -c 6,7 | awk '$4!="."{print $0}' > $filename.as.repli.counts.bed
