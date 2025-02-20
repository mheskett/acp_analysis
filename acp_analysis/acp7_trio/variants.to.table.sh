#!/bin/bash
input=$1
b=$(basename $input) ## removes /path/to/file
filename=${b%.*}
out_dir=$2


### input.list file required
source activate for_gatk
/home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/gatk-4.5.0.0/jdk-17.0.11/bin/java -jar -Xmx20g \
    /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/gatk-4.5.0.0/gatk-package-4.5.0.0-local.jar \
    VariantsToTable \
   -R /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/hg38_fasta_ref/hg38.fa \
   -V $input \
   -F CHROM -F POS -F REF -F ALT \
   -GF GT \
   -O $out_dir$filename.table

# can include GQ  for genotype quality per sample if youw ant
