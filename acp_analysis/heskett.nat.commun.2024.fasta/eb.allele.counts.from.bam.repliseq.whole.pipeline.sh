#!/bin/bash

## start from sorted, index and rmduped BAM file.

source activate for_bcftools
input=$1
b=$(basename $input) ## removes /path/to/file
filename=${b%.*} ### removes file extension
out_dir=$2

bcftools mpileup -R VCF3_2_fixed.haplotype.aligned.het.bed \
  -f ../hg19.ethan.fa \
  -a DP,AD \
  -q 20 \
  -d 6000 \
  $input > $out_dir$filename.allele.counts.vcf

# get allele specific counts of all het sites into a table
/home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/gatk-4.5.0.0/jdk-17.0.11/bin/java -Xmx6G -jar /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/gatk-4.5.0.0/gatk-package-4.5.0.0-local.jar \
          VariantsToTable -V $out_dir$filename.allele.counts.vcf -O $out_dir$filename.table -F CHROM -F POS -F REF -F ALT -GF AD

## turn this table into a bed file so that it can be intersected with the haplotype resolved file
tail -n +2 $out_dir$filename.table | awk 'OFS="\t"{print $1,$2-1,$2,$3,$4,$5}' |
  bedtools intersect -a stdin \
                     -b VCF3_2_fixed.haplotype.aligned.het.bed -wa -wb > $out_dir$filename.allele.counts.bed

## Python script to align haplotypes

python align.haplotypes.py --bed $out_dir$filename.allele.counts.bed --out_directory ./

##

source activate for_bedtools

input=$1 ## bam file
b=$(basename $input) ## removes /path/to/file
filename=${b%.*} ### removes file extension

## for GM samples use this human_g1k_v37.windows.500w.s50.bed
## for EB samples use this hg19.ethan.bedtools.genome.lexicographically2.w250.s50.bed

bedtools sort -g hg19.ethan.bedtools.genome.lexicographically2.txt -i $1 | 
              bedtools map -a hg19.ethan.bedtools.genome.lexicographically2.w250.s50.bed \
                -b stdin -o sum,sum -c 6,7 | grep -v "\." > $filename.allele.counts.windows.bed
