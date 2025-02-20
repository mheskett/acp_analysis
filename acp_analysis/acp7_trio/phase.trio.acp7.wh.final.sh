#!/bin/bash

### cat lanes from fastq files
srun --mem 8000 --time 200 cat DNA210115MT_ACP1005A_mom_S1_L004_R1_001.fastq-003.gz DNA210115MT_ACP1005A_mom_S23_L002_R1_001.fastq-008.gz > acp1005a_mom_r1.fastq.gz &
srun --mem 8000 --time 200 cat DNA210115MT_ACP1005A_mom_S1_L004_R2_001.fastq-001.gz DNA210115MT_ACP1005A_mom_S23_L002_R2_001.fastq-004.gz > acp1005a_mom_r2.fastq.gz &
srun --mem 8000 --time 200 cat DNA210115MT_ACP1005B_dad_S24_L002_R1_001.fastq-005.gz DNA210115MT_ACP1005B_dad_S2_L004_R1_001.fastq.gz > acp1005b_dad_r1.fastq.gz &
srun --mem 8000 --time 200 cat DNA210115MT_ACP1005B_dad_S24_L002_R2_001.fastq-003.gz DNA210115MT_ACP1005B_dad_S2_L004_R2_001.fastq-002.gz > acp1005b_dad_r2.fastq.gz &
srun --mem 8000 --time 200 cat DNA210115MT_tHAC5_child_S25_L002_R1_001.fastq-009.gz DNA210115MT_tHAC5_child_S3_L004_R1_001.fastq-010.gz > acp7_child_r1.fastq.gz &
srun --mem 8000 --time 200 cat DNA210115MT_tHAC5_child_S25_L002_R2_001.fastq-002.gz DNA210115MT_tHAC5_child_S3_L004_R2_001.fastq-007.gz > acp6_child_r2.fastq.gz &

### align with bwa and hg38
sbatch slurm.call.bwa.hg38.sh acp1005a_mom_r1.fastq.gz acp1005a_mom_r2.fastq.gz acp1005a_mom ./
sbatch slurm.call.bwa.hg38.sh acp1005b_dad_r1.fastq.gz acp1005b_dad_r2.fastq.gz acp1005b_dad ./
sbatch slurm.call.bwa.hg38.sh acp7_child_r1.fastq.gz acp7_child_r2.fastq.gz acp7_child ./

### Process SAM Files
sbatch slurm.samtools.process.sam.sh acp1005a_mom.sam ./
sbatch slurm.samtools.process.sam.sh acp1005b_dad.sam ./
sbatch slurm.samtools.process.sam.sh acp7_child.sam ./

### split bam
srun --mem 6000 --time 500 split.bam.sh acp1005a_mom.sorted.markdup.bam ./ &
srun --mem 6000 --time 500 split.bam.sh acp1005b_dad.sorted.markdup.bam ./ &
srun --mem 6000 --time 500 split.bam.sh acp7_child.sorted.markdup.bam ./ &

###  Call joint genotyping with freebayes.
for chrom in `seq 1 22` X; do sbatch slurm.call.freebayes.joint.by.chrom.sh chr$chrom ./; done

### filter as strict as you want for whatshap
for chrom in `seq 1 22` X; do srun --mem 4000 --time 30 filter.vcf.gt.high.pass.sh acp7_joint.fb30.chr$chrom.vcf ./ & done

## Call WhatsHap with filtered
for chrom in `seq 1 22` X; do sbatch slurm.call.whatshap.sh acp7_joint.fb30.chr$chrom.vcf.no.missing.vcf.gz $chrom ./ & done

