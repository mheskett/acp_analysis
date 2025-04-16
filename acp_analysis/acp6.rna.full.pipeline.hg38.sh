## align to hg38
sbatch slurm.align.star.rna.sh RNA210216MT_1_tACP6c1_hg19Aligned.out.R1.fq.gz RNA210216MT_1_tACP6c1_hg19Aligned.out.R2.fq.gz acp6_c1_rna
sbatch slurm.align.star.rna.sh RNA210216MT_2_tACP6c2_hg19Aligned.out.R1.fq.gz RNA210216MT_2_tACP6c2_hg19Aligned.out.R2.fq.gz acp6_c2_rna
sbatch slurm.align.star.rna.sh RNA210216MT_3_tACP6c5_hg19Aligned.out.R1.fq.gz RNA210216MT_3_tACP6c5_hg19Aligned.out.R2.fq.gz acp6_c5_rna
sbatch slurm.align.star.rna.sh RNA210216MT_4_tACP6c6_hg19Aligned.out.R1.fq.gz RNA210216MT_4_tACP6c6_hg19Aligned.out.R2.fq.gz acp6_c6_rna

## samtools process bam
sbatch slurm.samtools.process.bam.sh acp6_c1_rnaAligned.out.bam ./
sbatch slurm.samtools.process.bam.sh acp6_c2_rnaAligned.out.bam ./
sbatch slurm.samtools.process.bam.sh acp6_c5_rnaAligned.out.bam ./
sbatch slurm.samtools.process.bam.sh acp6_c6_rnaAligned.out.bam ./

## filter by strand
srun --mem 6000 --time 200 ./filter.by.strand.sh acp6_c1_rnaAligned.out.samtool.rmdup.bam ./ &
srun --mem 6000 --time 200 ./filter.by.strand.sh acp6_c2_rnaAligned.out.samtool.rmdup.bam ./ &
srun --mem 6000 --time 200 ./filter.by.strand.sh acp6_c5_rnaAligned.out.samtool.rmdup.bam ./ &
srun --mem 6000 --time 200 ./filter.by.strand.sh acp6_c6_rnaAligned.out.samtool.rmdup.bam ./ &

# get allele counts.probs need to do parallel
for chrom in `seq 1 22` X; do sbatch  slurm.acp6.allele.count.from.bam.by.chrom.sh acp6_c1_rnaAligned.out.samtool.rmdup.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch  slurm.acp6.allele.count.from.bam.by.chrom.sh acp6_c1_rnaAligned.out.samtool.rmdup.minus.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch  slurm.acp6.allele.count.from.bam.by.chrom.sh acp6_c1_rnaAligned.out.samtool.rmdup.plus.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch  slurm.acp6.allele.count.from.bam.by.chrom.sh acp6_c2_rnaAligned.out.samtool.rmdup.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch  slurm.acp6.allele.count.from.bam.by.chrom.sh acp6_c2_rnaAligned.out.samtool.rmdup.minus.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch  slurm.acp6.allele.count.from.bam.by.chrom.sh acp6_c2_rnaAligned.out.samtool.rmdup.plus.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch  slurm.acp6.allele.count.from.bam.by.chrom.sh acp6_c5_rnaAligned.out.samtool.rmdup.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch  slurm.acp6.allele.count.from.bam.by.chrom.sh acp6_c5_rnaAligned.out.samtool.rmdup.minus.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch  slurm.acp6.allele.count.from.bam.by.chrom.sh acp6_c5_rnaAligned.out.samtool.rmdup.plus.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch  slurm.acp6.allele.count.from.bam.by.chrom.sh acp6_c6_rnaAligned.out.samtool.rmdup.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch  slurm.acp6.allele.count.from.bam.by.chrom.sh acp6_c6_rnaAligned.out.samtool.rmdup.minus.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch  slurm.acp6.allele.count.from.bam.by.chrom.sh acp6_c6_rnaAligned.out.samtool.rmdup.plus.bam $chrom ./; done

# cat the beds together
cat acp6_c1_rnaAligned.out.samtool.rmdup.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp6_c1_rnaAligned.out.samtool.rmdup.allele.counts.all.chrom.bed
cat acp6_c1_rnaAligned.out.samtool.rmdup.plus.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp6_c1_rnaAligned.out.samtool.rmdup.plus.allele.counts.all.chrom.bed
cat acp6_c1_rnaAligned.out.samtool.rmdup.minus.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp6_c1_rnaAligned.out.samtool.rmdup.minus.allele.counts.all.chrom.bed
cat acp6_c2_rnaAligned.out.samtool.rmdup.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp6_c2_rnaAligned.out.samtool.rmdup.allele.counts.all.chrom.bed
cat acp6_c2_rnaAligned.out.samtool.rmdup.plus.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp6_c2_rnaAligned.out.samtool.rmdup.plus.allele.counts.all.chrom.bed
cat acp6_c2_rnaAligned.out.samtool.rmdup.minus.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp6_c2_rnaAligned.out.samtool.rmdup.minus.allele.counts.all.chrom.bed
cat acp6_c5_rnaAligned.out.samtool.rmdup.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp6_c5_rnaAligned.out.samtool.rmdup.allele.counts.all.chrom.bed
cat acp6_c5_rnaAligned.out.samtool.rmdup.plus.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp6_c5_rnaAligned.out.samtool.rmdup.plus.allele.counts.all.chrom.bed
cat acp6_c5_rnaAligned.out.samtool.rmdup.minus.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp6_c5_rnaAligned.out.samtool.rmdup.minus.allele.counts.all.chrom.bed
cat acp6_c6_rnaAligned.out.samtool.rmdup.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp6_c6_rnaAligned.out.samtool.rmdup.allele.counts.all.chrom.bed
cat acp6_c6_rnaAligned.out.samtool.rmdup.plus.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp6_c6_rnaAligned.out.samtool.rmdup.plus.allele.counts.all.chrom.bed
cat acp6_c6_rnaAligned.out.samtool.rmdup.minus.chr*.allele.counts.bed | sort -k1,1 -k2,2n > acp6_c6_rnaAligned.out.samtool.rmdup.minus.allele.counts.all.chrom.bed

# Call Transcribed Loci
for chrom in `seq 1 22` X; do sbatch slurm.vlinc.identifier.hg38.sh acp6_c1_rnaAligned.out.samtool.rmdup.chr$chrom.bam ./ 1000 10000 50000 $chrom & done
for chrom in `seq 1 22` X; do sbatch slurm.vlinc.identifier.hg38.sh acp6_c2_rnaAligned.out.samtool.rmdup.chr$chrom.bam ./ 1000 10000 50000 $chrom & done
for chrom in `seq 1 22` X; do sbatch slurm.vlinc.identifier.hg38.sh acp6_c5_rnaAligned.out.samtool.rmdup.chr$chrom.bam ./ 1000 10000 50000 $chrom & done
for chrom in `seq 1 22` X; do sbatch slurm.vlinc.identifier.hg38.sh acp6_c6_rnaAligned.out.samtool.rmdup.chr$chrom.bam ./ 1000 10000 50000 $chrom & done

# cat the vlincs together
cat acp6_c1_rnaAligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed > acp6_c1.tls.plus.bed
cat acp6_c1_rnaAligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed > acp6_c1.tls.minus.bed
cat acp6_c2_rnaAligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed > acp6_c2.tls.plus.bed
cat acp6_c2_rnaAligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed > acp6_c2.tls.minus.bed
cat acp6_c5_rnaAligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed > acp6_c5.tls.plus.bed
cat acp6_c5_rnaAligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed > acp6_c5.tls.minus.bed
cat acp6_c6_rnaAligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed > acp6_c6.tls.plus.bed
cat acp6_c6_rnaAligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed > acp6_c6.tls.minus.bed


## combined BAMs and then split bams by chromosome. goal is to call TLs on split chroms
srun --mem 16000 --time 500 split.bam.sh acp6.all.clones.rna.bam &

## call TLs on the combined samples
for chrom in `seq 1 22` X; do sbatch slurm.vlinc.identifier.hg38.sh acp6.all.clones.rna.chr$chrom.bam ./ 1000 10000 50000 $chrom & done
#
# cat the combined vlincs together

