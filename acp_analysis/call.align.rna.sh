#!/bin/bash

sbatch slurm_align_paired.sh RNA210216MT_1_tACP6c1_hg19Aligned.out.R1.fq RNA210216MT_1_tACP6c1_hg19Aligned.out.R2.fq acp6_c1_rna
sbatch slurm_align_paired.sh RNA210216MT_1_tACP7c1Aligned.out.R1.fq RNA210216MT_1_tACP7c1Aligned.out.R2.fq acp7_c1_rna
sbatch slurm_align_paired.sh RNA210216MT_2_tACP6c2_hg19Aligned.out.R1.fq RNA210216MT_2_tACP6c2_hg19Aligned.out.R2.fq acp6_c2_rna
sbatch slurm_align_paired.sh RNA210216MT_3_tACP6c5_hg19Aligned.out.R1.fq RNA210216MT_3_tACP6c5_hg19Aligned.out.R2.fq acp6_c5_rna
sbatch slurm_align_paired.sh RNA210216MT_4_tACP6c6_hg19Aligned.out.R1.fq RNA210216MT_4_tACP6c6_hg19Aligned.out.R2.fq acp6_c6_rna
sbatch slurm_align_paired.sh RNA210216MT_6_tACP7c2Aligned.out.R1.fq RNA210216MT_6_tACP7c2Aligned.out.R2.fq acp7_c2_rna
sbatch slurm_align_paired.sh RNA210216MT_7_tACP7c4Aligned.out.R1.fq RNA210216MT_7_tACP7c4Aligned.out.R2.fq acp7_c4_rna

##### samtools process bam done with for loop then

###
sbatch slurm.allele.counts.from.bam.sh acp6_c1_rnaAligned.out.samtool.rmdup.bam ./ &
sbatch slurm.allele.counts.from.bam.sh acp6_c1_rnaAligned.out.samtool.rmdup.minus.bam ./ &
sbatch slurm.allele.counts.from.bam.sh acp6_c1_rnaAligned.out.samtool.rmdup.plus.bam ./ &
sbatch slurm.allele.counts.from.bam.sh acp6_c2_rnaAligned.out.samtool.rmdup.bam ./ &
sbatch slurm.allele.counts.from.bam.sh acp6_c2_rnaAligned.out.samtool.rmdup.minus.bam ./ &
sbatch slurm.allele.counts.from.bam.sh acp6_c2_rnaAligned.out.samtool.rmdup.plus.bam ./ &
sbatch slurm.allele.counts.from.bam.sh acp6_c5_rnaAligned.out.samtool.rmdup.bam ./ &
sbatch slurm.allele.counts.from.bam.sh acp6_c5_rnaAligned.out.samtool.rmdup.minus.bam ./ &
sbatch slurm.allele.counts.from.bam.sh acp6_c5_rnaAligned.out.samtool.rmdup.plus.bam ./ &
sbatch slurm.allele.counts.from.bam.sh acp6_c6_rnaAligned.out.samtool.rmdup.bam ./ &
sbatch slurm.allele.counts.from.bam.sh acp6_c6_rnaAligned.out.samtool.rmdup.minus.bam ./ &
sbatch slurm.allele.counts.from.bam.sh acp6_c6_rnaAligned.out.samtool.rmdup.plus.bam ./ &


sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c1_rnaAligned.out.samtool.rmdup.bam ./ &
sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c1_rnaAligned.out.samtool.rmdup.minus.bam ./ &
sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c1_rnaAligned.out.samtool.rmdup.plus.bam ./ &
sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c2_rnaAligned.out.samtool.rmdup.bam ./ &
sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c2_rnaAligned.out.samtool.rmdup.minus.bam ./ &
sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c2_rnaAligned.out.samtool.rmdup.plus.bam ./ &
sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c4_rnaAligned.out.samtool.rmdup.bam ./ &
sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c4_rnaAligned.out.samtool.rmdup.minus.bam ./ &
sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c4_rnaAligned.out.samtool.rmdup.plus.bam ./ &

srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp6_c1_rnaAligned.out.samtool.rmdup.allele.counts.bed --out_directory ./ &
srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp6_c1_rnaAligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory ./ &
srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp6_c1_rnaAligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory	./ &
srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp6_c2_rnaAligned.out.samtool.rmdup.allele.counts.bed --out_directory	./ &
srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp6_c2_rnaAligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory	./ &
srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp6_c2_rnaAligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory	./ &
srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp6_c5_rnaAligned.out.samtool.rmdup.allele.counts.bed --out_directory	./ &
srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp6_c5_rnaAligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory	./ &
srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp6_c5_rnaAligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory	./ &
srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp6_c6_rnaAligned.out.samtool.rmdup.allele.counts.bed --out_directory	./ &
srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp6_c6_rnaAligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory	./ &
srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp6_c6_rnaAligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory	./ &
srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp7_c1_rnaAligned.out.samtool.rmdup.allele.counts.bed --out_directory	./ &
srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp7_c1_rnaAligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory	./ &
srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp7_c1_rnaAligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory	./ &
srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp7_c2_rnaAligned.out.samtool.rmdup.allele.counts.bed --out_directory	./ &
srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp7_c2_rnaAligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory	./ &
srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp7_c2_rnaAligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory	./ &
srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp7_c4_rnaAligned.out.samtool.rmdup.allele.counts.bed --out_directory	./ &
srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp7_c4_rnaAligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory	./ &
srun --mem 8000 --time 60 -c 1 python align.haplotypes.py --bed acp7_c4_rnaAligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory	./ &
