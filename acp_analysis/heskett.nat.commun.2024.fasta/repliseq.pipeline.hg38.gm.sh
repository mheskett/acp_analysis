##  Align to hg38
sbatch slurm.call.bwa.paired.hg38.sh gm12878_clone4_early_rt_1.fastq.gz gm12878_clone4_early_rt_2.fastq.gz gm12878_clone4_early gm12878_clone4_early ./
sbatch slurm.call.bwa.paired.hg38.sh gm12878_clone4_late_rt_1.fastq.gz gm12878_clone4_late_rt_2.fastq.gz gm12878_clone4_late gm12878_clone4_late ./
sbatch slurm.call.bwa.paired.hg38.sh gm12878_clone5_early_rt_1.fastq.gz gm12878_clone5_early_rt_2.fastq.gz gm12878_clone5_early gm12878_clone5_early ./
sbatch slurm.call.bwa.paired.hg38.sh gm12878_clone5_late_rt_1.fastq.gz gm12878_clone5_late_rt_2.fastq.gz gm12878_clone5_late gm12878_clone5_late ./

## process SAM files
sbatch slurm.samtools.process.sam.sh gm12878_clone4_early.hg38.sam ./
sbatch slurm.samtools.process.sam.sh gm12878_clone4_late.hg38.sam ./
sbatch slurm.samtools.process.sam.sh gm12878_clone5_early.hg38.sam ./
sbatch slurm.samtools.process.sam.sh gm12878_clone5_late.hg38.sam ./

##  get allele counts
sbatch slurm.gm.allele.count.from.bam.sh gm12878_clone4_early.hg38.sorted.markdup.bam ./
sbatch slurm.gm.allele.count.from.bam.sh gm12878_clone4_late.hg38.sorted.markdup.bam ./
sbatch slurm.gm.allele.count.from.bam.sh gm12878_clone5_early.hg38.sorted.markdup.bam ./
sbatch slurm.gm.allele.count.from.bam.sh gm12878_clone5_late.hg38.sorted.markdup.bam ./
