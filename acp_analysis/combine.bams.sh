#!/bin/bash

## combine bams then separate by chrom for TL calling

conda activate for_samtools
srun --mem 16000 --time 500 samtools merge -o acp6.all.clones.rna.bam acp6_c1_rnaAligned.out.samtool.rmdup.bam \
    acp6_c2_rnaAligned.out.samtool.rmdup.bam \
    acp6_c5_rnaAligned.out.samtool.rmdup.bam \
    acp6_c6_rnaAligned.out.samtool.rmdup.bam &

srun --mem 16000 --time 500 samtools merge -o ac7.all.clones.rna.bam acp7_c1_rnaAligned.out.samtool.rmdup.bam \
    acp7_c2_rnaAligned.out.samtool.rmdup.bam \
    acp7_c4_rnaAligned.out.samtool.rmdup.bam &
