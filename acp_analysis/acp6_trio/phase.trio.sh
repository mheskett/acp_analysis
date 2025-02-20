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

### Call HaplotypeCaller to make initial gVCF files
sbatch slurm.call.haplotypecaller.hg38.sh acp1001a_mom.sorted.markdup.bam ./
sbatch slurm.call.haplotypecaller.hg38.sh acp1001b_dad.sorted.markdup.bam ./
sbatch slurm.call.haplotypecaller.hg38.sh acp6_child.sorted.markdup.bam ./

### call joint variants by chrom

for chrom in `seq 1 22` X; do sbatch slurm.call.freebayes.joint.by.chrom.sh chr$chrom ./; done
## filter
for chrom in `seq 1 22` X; do srun --mem 6000 --time 300 filter.vcfs.sh acp6_joint.fb30.chr$chrom.vcf ./ & done
## call whatshap
for chrom in `seq 1 22` X; do sbatch slurm.call.whatshap.sh acp6_joint.fb30.chr$chrom.filtered30.vcf $chrom ./; done
## combine VCFS
srun --mem 6000 --time 100 ./combine.vcfs.sh acp6.filtered30.phased.vcf.list acp6.fb.filtered30.phased.all.chrom ./ &
## remove sites that dont have genotypes at ALL samples
for chrom in `seq 1 22` X; do srun --mem 4000 --time 30 filter.vcf.remove.missing.sh acp6_joint.fb30.chr$chrom.filtered30.vcf.gz ./ & done
for chrom in `seq 1 22` X; do srun --mem 4000 --time 30 filter.vcf.remove.missing.sh acp6_joint.fb30.chr$chrom.filtered30.wh.phased.vcf.gz ./ & done

acp6_joint.fb30.chr1.filtered30.wh.phased.vcf.gz 
# variants to table
./variants.to.table.sh acp6.fb.filtered30.phased.all.chrom.vcf.gz ./
### finally shapeit
### do this to filter the whatshap output to make the proper scaffold file for shapeit. 
bcftools view -i 'GT[@acp6_child.txt] = "0|1" | GT[@acp6_child.txt] = "1|0"' acp6_joint.fb30.chr1.filtered30.wh.phased.no.missing.vcf.gz > acp6_joint.fb30.chr1.filtered30.wh.phased.no.missing.scaffold.vcf


for chrom in `seq 1 22` X; do sbatch slurm.call.shapeit.sh acp6_joint.fb30.chr$chrom.filtered30.no.missing.vcf.gz acp6_joint.fb30.chr$chrom.filtered30.wh.phased.no.missing.vcf.gz $chrom ./; done

# table to bed with child genotype
tail -n +2 acp6.fb.filtered30.phased.all.chrom.vcf.table | grep -v "\." \
     | awk 'OFS="\t"{print $1,$2-1,$2,$3,$4,$7}' | grep "|" \
     | awk 'OFS="\t"{split($6,a,"|");print $1,$2,$3,$4,$5,a[1],a[2]}' > acp6.fb.filtered30.phased.all.chrom.child.bed


### Call haplotype caller by chromosome
for chrom in `seq 1 22` X; do sbatch slurm.call.haplotypecaller.by.chrom.hg38.sh acp1001a_mom.sorted.markdup.chr$chrom.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch slurm.call.haplotypecaller.by.chrom.hg38.sh acp1001b_dad.sorted.markdup.chr$chrom.bam $chrom ./; done
for chrom in `seq 1 22` X; do sbatch slurm.call.haplotypecaller.by.chrom.hg38.sh acp6_child.sorted.markdup.chr$chrom.bam $chrom ./; done

## Combine all the split VCFs into one
srun --mem 12000 --time 500 ./combine.gvcfs.sh acp1001a_mom.list acp1001a_mom ./ &
srun --mem 12000 --time 500 ./combine.gvcfs.sh acp1001b_dad.list acp1001b_dad ./ &
srun --mem 12000 --time 500 ./combine.gvcfs.sh acp6_child.list acp6_child ./ &

# merge regular VCFs
srun --mem 12000 --time 500 ./combine.vcfs.sh acp1001a_mom_vcf.list acp1001a_mom2 ./ &
srun --mem 12000 --time 500 ./combine.vcfs.sh acp1001b_dad_vcf.list acp1001b_dad2 ./ &
srun --mem 12000 --time 500 ./combine.vcfs.sh acp6_child_vcf.list acp6_child2 ./ &

## make sure that the VCF header sample name is correct
echo acp6_child > acp6_child_samplename.txt
echo acp1001a_mom > acp6_mom_samplename.txt
echo acp1001b_dad > acp6_dad_samplename.txt

srun --mem 12000 --time 300 bcftools reheader -s acp6_child_samplename.txt acp6_child.g.vcf.gz > acp6_child_reheader.g.vcf.gz &
srun --mem 12000 --time 300 bcftools reheader -s acp6_mom_samplename.txt acp1001a_mom.g.vcf.gz > acp1001a_mom_reheader.g.vcf.gz &
srun --mem 12000 --time 300 bcftools reheader -s acp6_dad_samplename.txt acp1001b_dad.g.vcf.gz > acp1001b_dad_reheader.g.vcf.gz &
acp1001a_mom_vcf.list
acp1001b_dad_vcf.list
acp6_child_vcf.list
