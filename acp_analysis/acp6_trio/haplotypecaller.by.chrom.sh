#!/bin/bash
input=$1
b=$(basename $input) ## removes /path/to/file
filename=${b%.*}
chrom=$2
out_dir=$3

source activate for_gatk
/home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/gatk-4.5.0.0/jdk-17.0.11/bin/java -jar -Xmx40g \
    /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/gatk-4.5.0.0/gatk-package-4.5.0.0-local.jar HaplotypeCaller \
   -R /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/hg38_fasta_ref/GRCh38_full_analysis_set_plus_decoy_hla.fa \
   -I $input \
   -L chr$chrom \
   -O $out_dir$filename.vcf.gz
#   -ERC GVCF
# try not wasting time with GVCF
