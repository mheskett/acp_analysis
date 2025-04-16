## align to hg38
sbatch slurm.align.star.rna.sh RNA210216MT_1_tACP7c1Aligned.out.R1.fq.gz RNA210216MT_1_tACP7c1Aligned.out.R2.fq.gz acp7_c1_rna
sbatch slurm.align.star.rna.sh RNA210216MT_6_tACP7c2Aligned.out.R1.fq.gz RNA210216MT_6_tACP7c2Aligned.out.R2.fq.gz acp7_c2_rna
sbatch slurm.align.star.rna.sh RNA210216MT_7_tACP7c4Aligned.out.R1.fq.gz RNA210216MT_7_tACP7c4Aligned.out.R2.fq.gz acp7_c4_rna

# process bam
sbatch slurm.samtools.process.bam.sh acp7_c1_rnaAligned.out.bam ./
sbatch slurm.samtools.process.bam.sh acp7_c2_rnaAligned.out.bam ./
sbatch slurm.samtools.process.bam.sh acp7_c4_rnaAligned.out.bam ./

# filter by strand
srun --mem 6000 --time 200 ./filter.by.strand.sh acp7_c1_rnaAligned.out.samtool.rmdup.bam ./ &
srun --mem 6000 --time 200 ./filter.by.strand.sh acp7_c2_rnaAligned.out.samtool.rmdup.bam ./ &
srun --mem 6000 --time 200 ./filter.by.strand.sh acp7_c4_rnaAligned.out.samtool.rmdup.bam ./ &


# allele counts
#for chrom in `seq 1 22` X; do sbatch  slurm.acp6.allele.count.from.bam.by.chrom.sh acp6_c1_rnaAligned.out.samtool.rmdup.bam $chrom ./; done

for chrom in `seq 1 22` X; do sbatch slurm.acp7.allele.count.from.bam.by.chrom.sh acp7_c1_rnaAligned.out.samtool.rmdup.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch slurm.acp7.allele.count.from.bam.by.chrom.sh acp7_c1_rnaAligned.out.samtool.rmdup.minus.bam $chrom  ./; done
for chrom in `seq 1 22` X; do sbatch slurm.acp7.allele.count.from.bam.by.chrom.sh acp7_c1_rnaAligned.out.samtool.rmdup.plus.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch slurm.acp7.allele.count.from.bam.by.chrom.sh acp7_c2_rnaAligned.out.samtool.rmdup.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch slurm.acp7.allele.count.from.bam.by.chrom.sh acp7_c2_rnaAligned.out.samtool.rmdup.minus.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch slurm.acp7.allele.count.from.bam.by.chrom.sh acp7_c2_rnaAligned.out.samtool.rmdup.plus.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch slurm.acp7.allele.count.from.bam.by.chrom.sh acp7_c4_rnaAligned.out.samtool.rmdup.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch slurm.acp7.allele.count.from.bam.by.chrom.sh acp7_c4_rnaAligned.out.samtool.rmdup.minus.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch slurm.acp7.allele.count.from.bam.by.chrom.sh acp7_c4_rnaAligned.out.samtool.rmdup.plus.bam $chrom ./; done

# cat the beds together
cat acp7_c1_rnaAligned.out.samtool.rmdup.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp7_c1_rnaAligned.out.samtool.rmdup.allele.counts.all.chrom.bed
cat acp7_c1_rnaAligned.out.samtool.rmdup.plus.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp7_c1_rnaAligned.out.samtool.rmdup.plus.allele.counts.all.chrom.bed
cat acp7_c1_rnaAligned.out.samtool.rmdup.minus.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp7_c1_rnaAligned.out.samtool.rmdup.minus.allele.counts.all.chrom.bed

cat acp7_c2_rnaAligned.out.samtool.rmdup.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp7_c2_rnaAligned.out.samtool.rmdup.allele.counts.all.chrom.bed
cat acp7_c2_rnaAligned.out.samtool.rmdup.plus.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp7_c2_rnaAligned.out.samtool.rmdup.plus.allele.counts.all.chrom.bed
cat acp7_c2_rnaAligned.out.samtool.rmdup.minus.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp7_c2_rnaAligned.out.samtool.rmdup.minus.allele.counts.all.chrom.bed

cat acp7_c4_rnaAligned.out.samtool.rmdup.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp7_c4_rnaAligned.out.samtool.rmdup.allele.counts.all.chrom.bed
cat acp7_c4_rnaAligned.out.samtool.rmdup.plus.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp7_c4_rnaAligned.out.samtool.rmdup.plus.allele.counts.all.chrom.bed
cat acp7_c4_rnaAligned.out.samtool.rmdup.minus.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp7_c4_rnaAligned.out.samtool.rmdup.minus.allele.counts.all.chrom.bed

## call Trancscribed loci per chromosome


for chrom in `seq 1 22` X; do sbatch slurm.vlinc.identifier.hg38.sh acp7_c1_rnaAligned.out.samtool.rmdup.chr$chrom.bam ./ 1000 10000 50000 $chrom & done
for chrom in `seq 1 22` X; do sbatch slurm.vlinc.identifier.hg38.sh acp7_c2_rnaAligned.out.samtool.rmdup.chr$chrom.bam ./ 1000 10000 50000 $chrom & done
for chrom in `seq 1 22` X; do sbatch slurm.vlinc.identifier.hg38.sh acp7_c4_rnaAligned.out.samtool.rmdup.chr$chrom.bam ./ 1000 10000 50000 $chrom & done

## cat the vlincs together
cat acp7_c1_rnaAligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed > acp7_c1.tls.plus.bed
cat acp7_c1_rnaAligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed > acp7_c1.tls.minus.bed
cat acp7_c2_rnaAligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed > acp7_c2.tls.plus.bed
cat acp7_c2_rnaAligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed > acp7_c2.tls.minus.bed
cat acp7_c4_rnaAligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed > acp7_c4.tls.plus.bed
cat acp7_c4_rnaAligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed > acp7_c4.tls.minus.bed

## split combined bam for TL calling
srun --mem 16000 --time 500 split.bam.sh acp7.all.clones.rna.bam &
for chrom in `seq 1 22` X; do sbatch slurm.vlinc.identifier.hg38.sh acp7.all.clones.rna.chr$chrom.bam ./ 1000 10000 50000 $chrom & done
