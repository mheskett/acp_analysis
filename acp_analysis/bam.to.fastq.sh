#!/bin/bash

input=$1 ## BAM file from BWA, or whatever.
out_dir=$2
b=$(basename $input) ## removes /path/to/file
filename=${b%.*} ### removes file extension

source activate for_bedtools
bedtools bamtofastq -i $input \
                    -fq $filename.R1.fq \
                    -fq2 $filename.R2.fq
