## combine the FQ replicates AND combine the paternal maternal 
cat LIB230502MT_e1_ACP7_c2_acp7_maternal_hg19.fq LIB230502MT_e1_ACP7_c2_acp7_paternal_hg19.fq LIB230502MT_e2_ACP7_c2_acp7_maternal_hg19.fq LIB230502MT_e2_ACP7_c2_acp7_paternal_hg19.fq > acp7_c2_early.fq
cat LIB230502MT_l1_ACP7_c2_acp7_maternal_hg19.fq LIB230502MT_l1_ACP7_c2_acp7_paternal_hg19.fq LIB230502MT_l2_ACP7_c2_acp7_maternal_hg19.fq LIB230502MT_l2_ACP7_c2_acp7_paternal_hg19.fq > acp7_c2_late.fq
cat LIB230502MT_e1_ACP7_c4_acp7_maternal_hg19.fq LIB230502MT_e1_ACP7_c4_acp7_paternal_hg19.fq LIB230502MT_e2_ACP7_c4_acp7_maternal_hg19.fq LIB230502MT_e2_ACP7_c4_acp7_paternal_hg19.fq > acp7_c4_early.fq
cat LIB230502MT_l1_ACP7_c4_acp7_maternal_hg19.fq LIB230502MT_l1_ACP7_c4_acp7_paternal_hg19.fq LIB230502MT_l2_ACP7_c4_acp7_maternal_hg19.fq LIB230502MT_l2_ACP7_c4_acp7_paternal_hg19.fq > acp7_c4_late.fq
cat LIB230502MT_e1_ACP7_c5_acp7_maternal_hg19.fq LIB230502MT_e1_ACP7_c5_acp7_paternal_hg19.fq LIB230502MT_e2_ACP7_c5_acp7_maternal_hg19.fq LIB230502MT_e2_ACP7_c5_acp7_paternal_hg19.fq > acp7_c5_early.fq
cat LIB230502MT_l1_ACP7_c5_acp7_maternal_hg19.fq LIB230502MT_l1_ACP7_c5_acp7_paternal_hg19.fq LIB230502MT_l2_ACP7_c5_acp7_maternal_hg19.fq LIB230502MT_l2_ACP7_c5_acp7_paternal_hg19.fq > acp7_c5_late.fq

## Align to hg38
sbatch slurm.call.bwa.hg38.sh acp7_c2_early.fq acp7_c2_early ./
sbatch slurm.call.bwa.hg38.sh acp7_c2_late.fq acp7_c2_late ./
sbatch slurm.call.bwa.hg38.sh acp7_c4_early.fq acp7_c4_early ./
sbatch slurm.call.bwa.hg38.sh acp7_c4_late.fq acp7_c4_late ./
sbatch slurm.call.bwa.hg38.sh acp7_c5_early.fq acp7_c5_early ./
sbatch slurm.call.bwa.hg38.sh acp7_c5_late.fq acp7_c5_late ./

## Process SAM files
sbatch slurm.samtools.process.sam.sh acp7_c2_early.hg38.sam ./
sbatch slurm.samtools.process.sam.sh acp7_c2_late.hg38.sam ./
sbatch slurm.samtools.process.sam.sh acp7_c4_early.hg38.sam ./
sbatch slurm.samtools.process.sam.sh acp7_c4_late.hg38.sam ./
sbatch slurm.samtools.process.sam.sh acp7_c5_early.hg38.sam ./
sbatch slurm.samtools.process.sam.sh acp7_c5_late.hg38.sam ./
