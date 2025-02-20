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

### option 1 call freebayes

for chrom in `seq 1 22` X; do sbatch slurm.call.freebayes.sh acp1005a_mom.sorted.markdup.chr$chrom.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch slurm.call.freebayes.sh acp1005b_dad.sorted.markdup.chr$chrom.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch slurm.call.freebayes.sh acp7_child.sorted.markdup.chr$chrom.bam $chrom ./; done



## try joint calling per chromosome to make joint VCFs

for chrom in `seq 1 22` X; do sbatch slurm.call.freebayes.joint.by.chrom.sh chr$chrom ./; done
####
## hap phasing after filtering
for chrom in `seq 1 22` X; do sbatch slurm.call.whatshap.sh acp7_joint.fb30.chr$chrom.filtered30.vcf $chrom ./; done

## print table
./variants.to.table.sh acp7.fb.filtered30.phased.all.chrom.vcf.gz ./
## do joint VCF filtering before phasing
for chrom in `seq 1 22` X; do srun --mem 6000 --time 300 filter.vcfs.sh acp7_joint.fb30.chr$chrom.vcf ./ & done
## indexing and bgzipping


for f in *vcf.gz; do srun --mem 4000 --time 30 bcftools index -t -f $f &  done

## filter by removing sites that dont have all genotpyes present
for chrom in `seq 1 22` X; do srun --mem 4000 --time 30 filter.vcf.remove.missing.sh acp7_joint.fb30.chr$chrom.filtered30.vcf ./ & done
for chrom in `seq 1 22` X; do srun --mem 4000 --time 30 filter.vcf.remove.missing.sh acp7_joint.fb30.chr$chrom.filtered30.wh.phased.vcf ./ & done

for chrom in `seq 1 22` X; do sbatch slurm.call.shapeit.sh acp7_joint.fb30.chr$chrom.filtered30.no.missing.vcf.gz acp7_joint.fb30.chr$chrom.filtered30.wh.phased.no.missing.vcf.gz $chrom ./; done
acp7_joint.fb30.chr3.filtered30.wh.phased.no.missing.vcf.gz
acp7_joint.fb30.chr3.filtered30.no.missing.vcf.gz
tail -n +2 acp7.fb.filtered30.phased.all.chrom.vcf.table | grep -v "\." \
     | awk 'OFS="\t"{print $1,$2-1,$2,$3,$4,$7}' | grep "|" \
     | awk 'OFS="\t"{split($6,a,"|");print $1,$2,$3,$4,$5,a[1],a[2]}' > acp7.fb.filtered30.phased.all.chrom.child.bed


srun --mem 12000 --time 500 ./combine.vcfs.sh acp1005a_mom.fb.list acp1005a_mom_fb ./ &
srun --mem 12000 --time 500 ./combine.vcfs.sh acp1005b_dad.fb.list acp1005b_dad_fb ./ &
srun --mem 12000 --time 500 ./combine.vcfs.sh acp7_child.fb.list acp7_child_fb ./ &

sbatch filter.vcfs.sh acp1005a_mom_fb.vcf.gz ./
sbatch filter.vcfs.sh acp1005b_dad_fb.vcf.gz ./
sbatch filter.vcfs.sh acp7_child_fb.vcf.gz ./

srun --mem 12000 --time 300 bcftools reheader -s acp7_mom_samplename.txt acp1005a_mom_fb.vcf.filtered30.vcf > acp1005a_mom_fb_reheader.vcf.gz
srun --mem 12000 --time 300 bcftools reheader -s acp7_dad_samplename.txt acp1005b_dad_fb.vcf.filtered30.vcf > acp1005b_dad_fb_reheader.vcf.gz
srun --mem 12000 --time 300 bcftools reheader -s acp7_child_samplename.txt acp7_child_fb.vcf.filtered30.vcf > acp7_child_fb_reheader.vcf.gz

#########

for chrom in `seq 1 22` X; do sbatch slurm.call.whatshap.sh acp7_joint.fb30.chr$chron.vcf $chrom ./; done


### Call HaplotypeCaller to make initial gVCF files
sbatch slurm.call.haplotypecaller.hg38.sh acp1005a_mom.sorted.markdup.bam ./
sbatch slurm.call.haplotypecaller.hg38.sh acp1005b_dad.sorted.markdup.bam ./
sbatch slurm.call.haplotypecaller.hg38.sh acp7_child.sorted.markdup.bam ./

## Call HaplotypeCaller to make initial gVCF files - by chromosome for faster
for chrom in `seq 1 22` X; do sbatch slurm.call.haplotypecaller.by.chrom.hg38.sh acp1005a_mom.sorted.markdup.chr$chrom.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch slurm.call.haplotypecaller.by.chrom.hg38.sh acp1005b_dad.sorted.markdup.chr$chrom.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch slurm.call.haplotypecaller.by.chrom.hg38.sh acp7_child.sorted.markdup.chr$chrom.bam $chrom ./; done

### combine VCFs from previous step
srun --mem 12000 --time 500 ./combine.gvcfs.sh acp1005a_mom.list acp1005a_mom ./ &
srun --mem 12000 --time 500 ./combine.gvcfs.sh acp1005b_dad.list acp1005b_dad ./ &
srun --mem 12000 --time 500 ./combine.gvcfs.sh acp7_child.list acp7_child ./ &

srun --mem 12000 --time 500 ./combine.vcfs.sh acp1005a_mom_vcf.list acp1005a_mom2 ./ &
srun --mem 12000 --time 500 ./combine.vcfs.sh acp1005b_dad_vcf.list acp1005b_dad2 ./ &
srun --mem 12000 --time 500 ./combine.vcfs.sh acp7_child_vcf.list acp7_child2 ./ &

# Reheader VCFs
echo acp7_child > acp7_child_samplename.txt
echo acp1005a_mom > acp7_mom_samplename.txt
echo acp1005b_dad > acp7_dad_samplename.txt

srun --mem 12000 --time 300 bcftools reheader -s acp7_child_samplename.txt acp7_child.g.vcf.gz > acp7_child_reheader.g.vcf.gz &
srun --mem 12000 --time 300 bcftools reheader -s acp7_mom_samplename.txt acp1005a_mom.g.vcf.gz > acp1005a_mom_reheader.g.vcf.gz &
srun --mem 12000 --time 300 bcftools reheader -s acp7_dad_samplename.txt acp1005b_dad.g.vcf.gz > acp1005b_dad_reheader.g.vcf.gz &
