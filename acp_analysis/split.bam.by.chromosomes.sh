#!/bin/bash
input=$1
b=$(basename $input) ## removes /path/to/file
filename=${b%.*} ### removes file extension
out_dir=$2

samtools view -bh $1 chr1 > $out_dir$filename.1.bam &
samtools view -bh $1 chr2 > $out_dir$filename.2.bam &
samtools view -bh $1 chr3 > $out_dir$filename.3.bam &
samtools view -bh $1 chr4 > $out_dir$filename.4.bam &
samtools view -bh $1 chr5 > $out_dir$filename.5.bam &
samtools view -bh $1 chr6 > $out_dir$filename.6.bam &
samtools view -bh $1 chr7 > $out_dir$filename.7.bam &
samtools view -bh $1 chr8 > $out_dir$filename.8.bam &
samtools view -bh $1 chr9 > $out_dir$filename.9.bam &
samtools view -bh $1 chr10 > $out_dir$filename.10.bam &
samtools view -bh $1 chr11 > $out_dir$filename.11.bam &
samtools view -bh $1 chr12 > $out_dir$filename.12.bam &
samtools view -bh $1 chr13 > $out_dir$filename.13.bam &
samtools view -bh $1 chr14 > $out_dir$filename.14.bam &
samtools view -bh $1 chr15 > $out_dir$filename.15.bam &
samtools view -bh $1 chr16 > $out_dir$filename.16.bam &
samtools view -bh $1 chr17 > $out_dir$filename.17.bam &
samtools view -bh $1 chr18 > $out_dir$filename.18.bam &
samtools view -bh $1 chr19 > $out_dir$filename.19.bam &
samtools view -bh $1 chr20 > $out_dir$filename.20.bam &
samtools view -bh $1 chr21 > $out_dir$filename.21.bam &
samtools view -bh $1 chr22 > $out_dir$filename.22.bam &
samtools view -bh $1 chrX > $out_dir$filename.X.bam &
samtools view -bh $1 chrY > $out_dir$filename.Y.bam &