#!/bin/bash
input=$1 ## sam file from BWA, or whatever.
name=$2
out_dir=$3
b=$(basename $input) ## removes /path/to/file
filename=${b%.*} ### removes file extension

source activate for_samtools

samtools addreplacerg -w -r ID:$name'\t'SM:$name'\t'PL:illumina'\t'LB:$name $input > $out_dir$filename.rrg.bam
