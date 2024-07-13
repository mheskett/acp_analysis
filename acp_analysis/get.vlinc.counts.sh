#!/bin/bash

input=$1 ## BAM file from BWA, or whatever.
b=$(basename $input) ## removes /path/to/file
filename=${b%.*} ### removes file extension
rna=$2

## input is the vlincs file matched to the RNA sample
source activate for_bedtools

bedtools map -a $input \
             -b $rna \
             -o sum,sum -c 6,7 | awk '$9!="."{print $0}' > $filename.ase.counts.bed
