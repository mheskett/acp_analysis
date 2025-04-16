#!/bin/bash

input=$1 ## sam file from BWA, or whatever.
out_dir=$2
b=$(basename $input) ## removes /path/to/file
filename=${b%.*} ### removes file extension

source activate for_samtools
for chrom in `seq 1 22` X
do
    samtools view -bh $input ${chrom} | samtools sort > $filename.chr$chrom.bam
    samtools index $filename.chr$chrom.bam
done
