#!/bin/bash

## start from sorted, index and rmduped BAM file.

source activate for_bcftools
input=$1
b=$(basename $input) ## removes /path/to/file
filename=${b%.*} ### removes file extension
chrom=$2
out_dir=$3

bcftools mpileup -R ./acp7_trio/acp7_joint.fb30.chr$chrom.vcf.no.missing.vcf.wh.phased.final.hets.bed \
  -f ./hg38_fasta_ref/hg38.fa \
  -a DP,AD \
  -q 20 \
  -d 6000 \
  $input > $out_dir$filename.chr$chrom.allele.counts.vcf

# get allele specific counts of all het sites into a table
/home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/gatk-4.5.0.0/jdk-17.0.11/bin/java -Xmx6G -jar /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/gatk-4.5.0.0/gatk-package-4.5.0.0-local.jar \
          VariantsToTable -V $out_dir$filename.chr$chrom.allele.counts.vcf -O $out_dir$filename.chr$chrom.table -F CHROM -F POS -F REF -F ALT -GF AD

## update with new phasing files 
## turn this table into a bed file so that it can be intersected with the haplotype resolved file
tail -n +2 $out_dir$filename.chr$chrom.table | awk 'OFS="\t"{print $1,$2-1,$2,$3,$4,$5}' |
  bedtools intersect -a stdin -b ./acp7_trio/acp7_joint.fb30.all.chrom.no.missing.wh.phased.final.hets.bed -wa -wb > $out_dir$filename.chr$chrom.allele.counts.bed

## plug this into python script to filter and align the haplotypes to get final file
