#!/bin/bash

srun --mem 30000 -c 12 --time 1000 docker run \
  -v /home/exacloud/gscratch:/home/exacloud/gscratch \
  -t hpcregistry.ohsu.edu/heskett/dmill903/triophaser:latest python3 /trio_phaser.py \
  -c /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/acp6_trio/acp6_child.g.vcf.gz \
  -p /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/acp6_trio/acp1001b_dad.g.vcf.gz \
  -m /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/acp6_trio/acp1001a_mom.g.vcf.gz \
  --haplotype_reference_files ./ \
  --output_file ./test.txt
