#!/bin/bash
input_list=$1
b=$(basename $input_list) ## removes /path/to/file
filename=${b%.*}
out_pref=$2
out_dir=$3


### input.list file required
source activate for_gatk
/home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/gatk-4.5.0.0/jdk-17.0.11/bin/java -jar -Xmx40g \
    /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/gatk-4.5.0.0/gatk-package-4.5.0.0-local.jar \
    MergeVcfs \
   -R /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/hg38_fasta_ref/hg38.fa \
   -I $input_list \
   -O $out_dir$out_pref.vcf.gz \

#java -jar picard.jar MergeVcfs \
#          I=input_variant_files.list \
#          O=output_variants.vcf.gz
