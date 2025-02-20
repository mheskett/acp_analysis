#!/bin/bash

## start from sorted, index and rmduped BAM file.

source activate for_bcftools
input=$1
b=$(basename $input) ## removes /path/to/file
filename=${b%.*} ### removes file extension
out_dir=$2

bcftools mpileup -R ../hg38_1kg_reference_snps/ALL_20141222.dbSNP142_human_GRCh38.snps.vcf.gz \
  -f ../hg38_fasta_ref/hg38.fa \
  -a DP,AD \
  -q 20 \
  -d 6000 \
  $input > $out_dir$filename.allele.counts.vcf

# get allele specific counts of all het sites into a table
/home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/gatk-4.5.0.0/jdk-17.0.11/bin/java -Xmx6G -jar /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/gatk-4.5.0.0/gatk-package-4.5.0.0-local.jar \
          VariantsToTable -V $out_dir$filename.allele.counts.vcf -O $out_dir$filename.table -F CHROM -F POS -F REF -F ALT -GF AD

## update with new phasing files 
## turn this table into a bed file so that it can be intersected with the haplotype resolved file
tail -n +2 $out_dir$filename.table | awk 'OFS="\t"{print $1,$2-1,$2,$3,$4,$5}' |
  bedtools intersect -a stdin -b ../acp6_trio/acp6_joint.fb30.all.chrom.no.missing.wh.phased.final.hets.bed -wa -wb > $out_dir$filename.allele.counts.bed

## plug this into python script to filter and align the haplotypes to get final file
