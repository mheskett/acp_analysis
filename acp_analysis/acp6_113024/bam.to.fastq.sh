#!/bin/bash

input=$1 ## BAM file from BWA, or whatever.
out_dir=$2
b=$(basename $input) ## removes /path/to/file
filename=${b%.*} ### removes file extension

source activate for_samtools
samtools sort -n -o $filename.qsort.bam $1
conda deactivate

source activate for_bedtools
bedtools bamtofastq -i $filename.qsort.bam \
                      -fq $filename.fq \

rm $filename.qsort.bam
