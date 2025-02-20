#!/bin/bash
input=$1
b=$(basename $input) ## removes /path/to/file
filename=${b%.*}
out_dir=$2


### -ERC GVCF with no -GQB will lead to 1bp resolution essentially
### use GQB ranges to make the file size smaller
source activate for_gatk
/home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/gatk-4.5.0.0/jdk-17.0.11/bin/java -jar -Xmx40g \
    /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/gatk-4.5.0.0/gatk-package-4.5.0.0-local.jar HaplotypeCaller \
   -R /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/hg38_fasta_ref/GRCh38_full_analysis_set_plus_decoy_hla.fa \
   -I $input \
   -O $out_dir$filename.g.vcf.gz \
   -ERC GVCF
#   -GQB 20 -GQB 30
