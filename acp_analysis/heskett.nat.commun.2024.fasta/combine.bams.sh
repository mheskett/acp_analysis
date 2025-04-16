#!/bin/bash

## combine bams then separate by chrom for TL calling

conda activate for_samtools

srun --mem 16000 --time 500 samtools merge -o eb32.all.clones.rna.bam \
eb3_2_clone10Aligned.out.samtool.rmdup.bam \
eb3_2_clone13Aligned.out.samtool.rmdup.bam \
eb3_2_clone15Aligned.out.samtool.rmdup.bam \
eb3_2_clone2Aligned.out.samtool.rmdup.bam \
eb3_2_clone3Aligned.out.samtool.rmdup.bam \
eb3_2_clone4Aligned.out.samtool.rmdup.bam &

srun --mem 16000 --time 500 samtools merge -o gm.all.clones.rna.bam \
gm12878_clone4_rnaAligned.out.samtool.rmdup.bam \
gm12878_clone5_rnaAligned.out.samtool.rmdup.bam &
