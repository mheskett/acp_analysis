#!/bin/bash

### cat lanes from fastq files
srun --mem 6000 --time 150 cat DNA200609MT_ACP1001A_Mom_S3_R1_001.fastq-011.gz DNA200609MT_ACP1001A_Mom_S4_L004_R1_001.fastq-010.gz > acp1001a_mom_r1.fastq.gz &
srun --mem 6000 --time 150 cat DNA200609MT_ACP1001A_Mom_S3_R2_001.fastq-002.gz DNA200609MT_ACP1001A_Mom_S4_L004_R2_001.fastq-003.gz > acp1001a_mom_r2.fastq.gz &
srun --mem 6000 --time 150 cat DNA200609MT_ACP1001B_Dad_S4_R1_001.fastq-007.gz DNA200609MT_ACP1001B_Dad_S5_L004_R1_001.fastq-008.gz > acp1001b_dad_r1.fastq.gz &
srun --mem 6000 --time 150 cat DNA200609MT_ACP1001B_Dad_S4_R2_001.fastq.gz DNA200609MT_ACP1001B_Dad_S5_L004_R2_001.fastq-004.gz > acp1001b_dad_r2.fastq.gz &
srun --mem 6000 --time 150 cat DNA200609MT_tHACp6_resubmitted_2_S5_R1_001.fastq-001.gz DNA200609MT_tHACp6_resubmitted_2_S6_L004_R1_001.fastq-006.gz > acp6_r1.fastq.gz &
srun --mem 6000 --time 150 cat DNA200609MT_tHACp6_resubmitted_2_S5_R2_001.fastq-009.gz DNA200609MT_tHACp6_resubmitted_2_S6_L004_R2_001.fastq-012.gz > acp6_r2.fastq.gz &

### align with bwa and hg38
sbatch slurm.call.bwa.hg38.sh acp1001a_mom_r1.fastq.gz acp1001a_mom_r2.fastq.gz acp1001a_mom ./
sbatch slurm.call.bwa.hg38.sh acp1001b_dad_r1.fastq.gz acp1001b_dad_r2.fastq.gz acp1001b_dad ./
sbatch slurm.call.bwa.hg38.sh acp6_r1.fastq.gz acp6_r2.fastq.gz acp6_child ./

### Process SAM Files
sbatch slurm.samtools.process.sam.sh acp1001a_mom.sam ./
sbatch slurm.samtools.process.sam.sh acp1001b_dad.sam ./
sbatch slurm.samtools.process.sam.sh acp6_child.sam ./

### split bams
srun --mem 6000 --time 500 split.bam.sh acp1001a_mom.sorted.markdup.bam ./ &
srun --mem 6000 --time 500 split.bam.sh acp1001b_dad.sorted.markdup.bam ./ &
srun --mem 6000 --time 500 split.bam.sh acp6_child.sorted.markdup.bam ./ &

###  Call joint genotyping with freebayes.
for chrom in `seq 1 22` X; do sbatch slurm.call.freebayes.joint.by.chrom.sh chr$chrom ./; done

### filter as strict as you want for whatshap
for chrom in `seq 1 22` X; do srun --mem 4000 --time 30 filter.vcf.gt.high.pass.sh acp6_joint.fb30.chr$chrom.vcf ./ & done

## Call WhatsHap with filtered
for chrom in `seq 1 22` X; do sbatch slurm.call.whatshap.sh acp6_joint.fb30.chr$chrom.vcf.no.missing.vcf.gz $chrom ./ & done





###  Call joint genotyping with freebayes. strict filtering here for whatshap
#for chrom in `seq 1 22` X; do sbatch slurm.call.freebayes.joint.by.chrom.strict.sh chr$chrom ./; done



### call mpileup for loimpute
#### need to change the regions files to actually use the SNPs that are from the 1kg patients themselves
#### not use dbsnp
for chrom in `seq 1 22` X; do sbatch slurm.call.mpileup.sh acp1001a_mom.sorted.markdup.chr$chrom.bam chr$chrom ./; done
for chrom in `seq 1 22` X; do sbatch slurm.call.mpileup.sh acp1001b_dad.sorted.markdup.chr$chrom.bam chr$chrom ./; done
for chrom in `seq 1 22` X; do sbatch slurm.call.mpileup.sh acp6_child.sorted.markdup.chr$chrom.bam chr$chrom ./; done

## Filter GQ quality to 20 or 30
for chrom in `seq 1 22` X; do srun --mem 6000 --time 300 filter.vcfs.sh acp6_joint.fb30.chr$chrom.vcf ./ & done

## Call WhatsHap with filtered
for chrom in `seq 1 22` X; do sbatch slurm.call.whatshap.sh acp6_joint.fb30.chr$chrom.filtered30.vcf $chrom ./; done

## Remove sites that dont have genotypes at ALL samples
for chrom in `seq 1 22` X; do srun --mem 4000 --time 100 filter.vcf.remove.missing.sh acp6_joint.fb30.chr$chrom.filtered30.vcf.gz ./ & done
for chrom in `seq 1 22` X; do srun --mem 4000 --time 100 filter.vcf.remove.missing.sh acp6_joint.fb30.chr$chrom.filtered30.wh.phased.vcf.gz ./ & done

## Get all the phased hets of child genotype from the Whatshap phased file
for chrom in `seq 1 22` X; do do srun --mem 4000 --time 100  get.phased.hets.sh acp6_joint.fb30.chr$chrom.filtered30.wh.phased.no.missing.vcf.gz ./ & done

## Call Shapeit
for chrom in `seq 1 22` X; do sbatch slurm.call.shapeit.sh acp6_joint.fb30.chr$chrom.filtered30.no.missing.vcf.gz acp6_joint.fb30.chr$chrom.filtered30.wh.phased.no.missing.het.scaffold.vcf.gz $chrom ./; done

