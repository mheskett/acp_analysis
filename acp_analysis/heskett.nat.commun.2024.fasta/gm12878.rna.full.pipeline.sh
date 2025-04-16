## align to hg38
sbatch slurm.align.star.rna.sh gm12878_clone4_rna_1.fastq.gz gm12878_clone4_rna_2.fastq.gz gm12878_clone4_rna gm12878_clone4_rna ./
sbatch slurm.align.star.rna.sh gm12878_clone5_rna_1.fastq.gz gm12878_clone5_rna_2.fastq.gz gm12878_clone5_rna gm12878_clone5_rna ./

## samtools process bam
sbatch slurm.samtools.process.bam.sh gm12878_clone4_rnaAligned.out.bam ./
sbatch slurm.samtools.process.bam.sh gm12878_clone5_rnaAligned.out.bam ./

## split to plus and minus
srun --mem 6000 --time 200 ./filter.by.strand.sh gm12878_clone4_rnaAligned.out.samtool.rmdup.bam ./ &
srun --mem 6000 --time 200 ./filter.by.strand.sh gm12878_clone5_rnaAligned.out.samtool.rmdup.bam ./ &

## count alleles strand specific
sbatch slurm.gm.allele.count.from.bam.sh gm12878_clone4_rnaAligned.out.samtool.rmdup.bam ./
sbatch slurm.gm.allele.count.from.bam.sh gm12878_clone4_rnaAligned.out.samtool.rmdup.minus.bam ./
sbatch slurm.gm.allele.count.from.bam.sh gm12878_clone4_rnaAligned.out.samtool.rmdup.plus.bam ./
sbatch slurm.gm.allele.count.from.bam.sh gm12878_clone5_rnaAligned.out.samtool.rmdup.bam ./
sbatch slurm.gm.allele.count.from.bam.sh gm12878_clone5_rnaAligned.out.samtool.rmdup.minus.bam ./
sbatch slurm.gm.allele.count.from.bam.sh gm12878_clone5_rnaAligned.out.samtool.rmdup.plus.bam ./

## calculate transcribed loci
for chrom in `seq 1 22` X; do sbatch slurm.vlinc.identifier.hg38.sh gm12878_clone4_rnaAligned.out.samtool.rmdup.chr$chrom.bam ./ 1000 10000 50000 $chrom & done
for chrom in `seq 1 22` X; do sbatch slurm.vlinc.identifier.hg38.sh gm12878_clone5_rnaAligned.out.samtool.rmdup.chr$chrom.bam ./ 1000 10000 50000 $chrom & done

# cat the beds tgoether

cat gm12878_clone4_rnaAligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed > gm_clone4.tls.plus.bed
cat gm12878_clone4_rnaAligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed > gm_clone4.tls.minus.bed

cat gm12878_clone5_rnaAligned.out.samtool.rmdup.chr*.intergenic.plus.1000.10000.50000.vlinc.discovery.bed > gm_clone5.tls.plus.bed
cat gm12878_clone5_rnaAligned.out.samtool.rmdup.chr*.intergenic.minus.1000.10000.50000.vlinc.discovery.bed > gm_clone5.tls.minus.bed

## split combined bams for TL calling
srun --mem 16000 --time 500 split.bam.sh gm.all.clones.rna.bam &
for chrom in `seq 1 22` X; do sbatch slurm.vlinc.identifier.hg38.sh gm.all.clones.rna.chr$chrom.bam ./ 1000 10000 50000 $chrom & done
