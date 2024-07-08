#!/bin/bash
input=$1 ## bam file from star
out_dir=$2
b=$(basename $input) ## removes /path/to/file
filename=${b%.*} ### removes file extension

source activate for_bedtools

bedtools sort -i $input -faidx hg19.ethan.fa.fai > $filename.faisorted.bed
