#!/bin/bash

input=$1 ## BAM file from BWA, or whatever.
out_dir=$2
b=$(basename $input) ## removes /path/to/file
filename=${b%.*} ### removes file extension

## remove reads with less than 20 map quality
## sort
## remove duplicates

source activate for_samtools
samtools view -@ 4 -bhq 20 $input > $out_dir$filename.mq20.bam
samtools sort -@ 4 -m 4G $out_dir$filename.mq20.bam > $out_dir$filename.mq20.sorted.bam

# paired end default
samtools rmdup $out_dir$filename.mq20.sorted.bam $out_dir$filename.samtool.rmdup.bam

## index bam
samtools index -b $out_dir$filename.samtool.rmdup.bam

rm $out_dir$filename.mq20.bam
rm $out_dir$filename.mq20.sorted.bam
