#!/bin/bash

#SBATCH --partition=batch
#SBATCH --mem 12000
#SBATCH -c 1
#SBATCH --time=4:0:0
#SBATCH -A thayerlab

input=$1
b=$(basename $input) ## removes /path/to/file
filename=${b%.*}
out_dir=$2

source activate for_freebayes

## filter to GQ 20
vcffilter -f "QUAL > 20" -g "GQ > 20" $input > $out_dir$filename.filtered.vcf

## filter to GQ 30
vcffilter -f "QUAL > 30" -g "GQ > 30" $input > $out_dir$filename.filtered30.vcf
