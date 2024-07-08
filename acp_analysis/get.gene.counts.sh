#!/bin/bash

input=$1 ## BAM file from BWA, or whatever.
out_dir=$2
b=$(basename $input) ## removes /path/to/file
filename=${b%.*} ### removes file extension


## input is the haplotype resolved allele counts bed file
source activate for_bedtools

bedtools map -a ./annotation.files/ucsc.known.gene.hg19.txn.start.stop.bed.cds.only.bed.filtered.bed \
             -b $input \
             -o sum,sum -c 6,7 | awk '$9!="."{print $0}' | awk '$9!=0 && $10!=0{print $0}' > $filename.gene.counts.bed
