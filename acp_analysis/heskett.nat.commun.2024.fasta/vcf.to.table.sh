#!/bin/bash


/home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/gatk-4.5.0.0/jdk-17.0.11/bin/java -Xmx16G -jar /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/gatk-4.5.0.0/gatk-package-4.5.0.0-local.jar VariantsToTable \
  -O $1.table \
  -F CHROM -F POS -F REF -F ALT \
  -GF GT \
  -V $1
