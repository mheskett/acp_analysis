## Align hg38

sbatch slurm.call.bwa.hg38.sh acp6_c1_early.fq acp6_c1_early ./
sbatch slurm.call.bwa.hg38.sh acp6_c1_late.fq acp6_c1_late ./
sbatch slurm.call.bwa.hg38.sh acp6_c2_early.fq acp6_c2_early ./
sbatch slurm.call.bwa.hg38.sh acp6_c2_late.fq acp6_c2_late ./
sbatch slurm.call.bwa.hg38.sh acp6_c5_early.fq acp6_c5_early ./
sbatch slurm.call.bwa.hg38.sh acp6_c5_late.fq acp6_c5_late ./
sbatch slurm.call.bwa.hg38.sh acp6_c6_early.fq acp6_c6_early ./
sbatch slurm.call.bwa.hg38.sh acp6_c6_late.fq acp6_c6_late ./

## Process SAM files
sbatch slurm.samtools.process.sam.sh acp6_c1_early.hg38.sam ./
sbatch slurm.samtools.process.sam.sh acp6_c1_late.hg38.sam ./
sbatch slurm.samtools.process.sam.sh acp6_c2_early.hg38.sam ./
sbatch slurm.samtools.process.sam.sh acp6_c2_late.hg38.sam ./
sbatch slurm.samtools.process.sam.sh acp6_c5_early.hg38.sam ./
sbatch slurm.samtools.process.sam.sh acp6_c5_late.hg38.sam ./
sbatch slurm.samtools.process.sam.sh acp6_c6_early.hg38.sam ./
sbatch slurm.samtools.process.sam.sh acp6_c6_late.hg38.sam ./

## Call acp allele count from bams with correct reference and SNP positions
sbatch slurm.acp.allele.count.from.bam.sh acp6_c1_early.hg38.sorted.markdup.bam ./
sbatch slurm.acp.allele.count.from.bam.sh acp6_c1_late.hg38.sorted.markdup.bam ./
sbatch slurm.acp.allele.count.from.bam.sh acp6_c2_early.hg38.sorted.markdup.bam ./
sbatch slurm.acp.allele.count.from.bam.sh acp6_c2_late.hg38.sorted.markdup.bam ./
sbatch slurm.acp.allele.count.from.bam.sh acp6_c5_early.hg38.sorted.markdup.bam ./
sbatch slurm.acp.allele.count.from.bam.sh acp6_c5_late.hg38.sorted.markdup.bam ./
sbatch slurm.acp.allele.count.from.bam.sh acp6_c6_early.hg38.sorted.markdup.bam ./
sbatch slurm.acp.allele.count.from.bam.sh acp6_c6_late.hg38.sorted.markdup.bam ./
