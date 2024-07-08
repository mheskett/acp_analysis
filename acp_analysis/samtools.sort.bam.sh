#!/bin/bash
input=$1 ## bam file from star
out_dir=$2
b=$(basename $input) ## removes /path/to/file
filename=${b%.*} ### removes file extension

samtools sort -@ 6 -o $out_dir$filename.sorted.bam $input
