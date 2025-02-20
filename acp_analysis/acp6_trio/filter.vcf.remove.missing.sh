#!/bin/bash

#SBATCH --partition=batch
#SBATCH --mem 12000
#SBATCH -c 1
#SBATCH --time=4:0:0
#SBATCH -A thayerlab

input=$1
b=$(basename $input) ## removes /path/to/file
filename=${b%.vcf.gz}
out_dir=$2

source activate for_bcftools

## filter to expression meaning all three samples have GT data
bcftools view -e 'GT[*] = "mis"' $input | bgzip > $out_dir$filename.no.missing.vcf.gz
