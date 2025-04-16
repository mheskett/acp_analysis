#!/bin.bash

## call TLs
for chrom in `seq 1 22` X; do sbatch slurm.vlinc.identifier.hg19.sh eb3_2_clone2Aligned.out.samtool.rmdup.chr$chrom.bam ./ 1000 10000 50000 $chrom & done
for chrom in `seq 1 22` X; do sbatch slurm.vlinc.identifier.hg19.sh eb3_2_clone3Aligned.out.samtool.rmdup.chr$chrom.bam ./ 1000 10000 50000 $chrom & done
for chrom in `seq 1 22` X; do sbatch slurm.vlinc.identifier.hg19.sh eb3_2_clone4Aligned.out.samtool.rmdup.chr$chrom.bam ./ 1000 10000 50000 $chrom & done
for chrom in `seq 1 22` X; do sbatch slurm.vlinc.identifier.hg19.sh eb3_2_clone10Aligned.out.samtool.rmdup.chr$chrom.bam ./ 1000 10000 50000 $chrom & done
for chrom in `seq 1 22` X; do sbatch slurm.vlinc.identifier.hg19.sh eb3_2_clone13Aligned.out.samtool.rmdup.chr$chrom.bam ./ 1000 10000 50000 $chrom & done
for chrom in `seq 1 22` X; do sbatch slurm.vlinc.identifier.hg19.sh eb3_2_clone15Aligned.out.samtool.rmdup.chr$chrom.bam ./ 1000 10000 50000 $chrom & done

## cat the beds together

cat eb3_2_clone2Aligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed eb3_2_clone2Aligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed | sort -k1,1 -k2,2n > eb32_clone2.tls.bed
cat eb3_2_clone3Aligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed eb3_2_clone3Aligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed | sort -k1,1 -k2,2n > eb32_clone3.tls.bed
cat eb3_2_clone4Aligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed eb3_2_clone4Aligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed | sort -k1,1 -k2,2n > eb32_clone4.tls.bed
cat eb3_2_clone10Aligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed eb3_2_clone10Aligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed | sort -k1,1 -k2,2n > eb32_clone10.tls.bed
cat eb3_2_clone13Aligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed eb3_2_clone13Aligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed | sort -k1,1 -k2,2n > eb32_clone13.tls.bed
cat eb3_2_clone15Aligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed eb3_2_clone15Aligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed | sort -k1,1 -k2,2n > eb32_clone15.tls.bed

cat eb3_2_clone2Aligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed | sort -k1,1 -k2,2n > eb32_clone2.plus.tls.bed
cat eb3_2_clone3Aligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed | sort -k1,1 -k2,2n > eb32_clone3.plus.tls.bed
cat eb3_2_clone4Aligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed | sort -k1,1 -k2,2n > eb32_clone4.plus.tls.bed
cat eb3_2_clone10Aligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed | sort -k1,1 -k2,2n > eb32_clone10.plus.tls.bed
cat eb3_2_clone13Aligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed | sort -k1,1 -k2,2n > eb32_clone13.plus.tls.bed
cat eb3_2_clone15Aligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed | sort -k1,1 -k2,2n > eb32_clone15.plus.tls.bed

cat eb3_2_clone2Aligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed | sort -k1,1 -k2,2n > eb32_clone2.minus.tls.bed
cat eb3_2_clone3Aligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed | sort -k1,1 -k2,2n > eb32_clone3.minus.tls.bed
cat eb3_2_clone4Aligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed | sort -k1,1 -k2,2n > eb32_clone4.minus.tls.bed
cat eb3_2_clone10Aligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed | sort -k1,1 -k2,2n > eb32_clone10.minus.tls.bed
cat eb3_2_clone13Aligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed | sort -k1,1 -k2,2n > eb32_clone13.minus.tls.bed
cat eb3_2_clone15Aligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed | sort -k1,1 -k2,2n > eb32_clone15.minus.tls.bed

# for TL calling on combined bams

srun --mem 16000 --time 500 split.bam.hg19.sh eb32.all.clones.rna.bam &
for chrom in `seq 1 22` X; do sbatch slurm.vlinc.identifier.hg19.sh eb32.all.clones.rna.chr$chrom.bam ./ 1000 10000 50000 $chrom & done
