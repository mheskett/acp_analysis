## revert bam to fq
for f in *bam; do srun --mem 12000 -c 1 --time 60 bam.to.fastq.sh $f & done

## combine the FQ replicates AND combine the paternal maternal 

####

cat LIB230502MT_e1_ACP6_c1_acp6_maternal_hg19.fq LIB230502MT_e1_ACP6_c1_acp6_paternal_hg19.fq LIB230502MT_e2_ACP6_c1_acp6_maternal_hg19.fq LIB230502MT_e2_ACP6_c1_acp6_paternal_hg19.fq > acp6_c1_early.fq
cat LIB230502MT_l1_ACP6_c1_acp6_maternal_hg19.fq LIB230502MT_l1_ACP6_c1_acp6_paternal_hg19.fq LIB230502MT_l2_ACP6_c1_acp6_maternal_hg19.fq LIB230502MT_l2_ACP6_c1_acp6_paternal_hg19.fq > acp6_c1_late.fq
cat LIB230502MT_e1_ACP6_c2_acp6_maternal_hg19.fq LIB230502MT_e1_ACP6_c2_acp6_paternal_hg19.fq LIB230502MT_e2_ACP6_c2_acp6_maternal_hg19.fq LIB230502MT_e2_ACP6_c2_acp6_paternal_hg19.fq > acp6_c2_early.fq
cat LIB230502MT_l1_ACP6_c2_acp6_maternal_hg19.fq LIB230502MT_l1_ACP6_c2_acp6_paternal_hg19.fq LIB230502MT_l2_ACP6_c2_acp6_maternal_hg19.fq LIB230502MT_l2_ACP6_c2_acp6_paternal_hg19.fq > acp6_c2_late.fq
cat LIB230502MT_e1_ACP6_c5_acp6_maternal_hg19.fq LIB230502MT_e1_ACP6_c5_acp6_paternal_hg19.fq LIB230502MT_e2_ACP6_c5_acp6_maternal_hg19.fq LIB230502MT_e2_ACP6_c5_acp6_paternal_hg19.fq > acp6_c5_early.fq
cat LIB230502MT_l1_ACP6_c5_acp6_maternal_hg19.fq LIB230502MT_l1_ACP6_c5_acp6_paternal_hg19.fq LIB230502MT_l2_ACP6_c5_acp6_maternal_hg19.fq LIB230502MT_l2_ACP6_c5_acp6_paternal_hg19.fq > acp6_c5_late.fq
cat LIB230502MT_e1_ACP6_c6_acp6_maternal_hg19.fq LIB230502MT_e1_ACP6_c6_acp6_paternal_hg19.fq LIB230502MT_e2_ACP6_c6_acp6_maternal_hg19.fq LIB230502MT_e2_ACP6_c6_acp6_paternal_hg19.fq > acp6_c6_early.fq
cat LIB230502MT_l1_ACP6_c6_acp6_maternal_hg19.fq LIB230502MT_l1_ACP6_c6_acp6_paternal_hg19.fq LIB230502MT_l2_ACP6_c6_acp6_maternal_hg19.fq LIB230502MT_l2_ACP6_c6_acp6_paternal_hg19.fq > acp6_c6_late.fq

sbatch slurm.call.bwa.hg19.sh acp6_c1_early.fq acp6_c1_early ./
sbatch slurm.call.bwa.hg19.sh acp6_c1_late.fq acp6_c1_late ./
sbatch slurm.call.bwa.hg19.sh acp6_c2_early.fq acp6_c2_early ./
sbatch slurm.call.bwa.hg19.sh acp6_c2_late.fq acp6_c2_late ./
sbatch slurm.call.bwa.hg19.sh acp6_c5_early.fq acp6_c5_early ./
sbatch slurm.call.bwa.hg19.sh acp6_c5_late.fq acp6_c5_late ./
sbatch slurm.call.bwa.hg19.sh acp6_c6_early.fq acp6_c6_early ./
sbatch slurm.call.bwa.hg19.sh acp6_c6_late.fq acp6_c6_late ./

sbatch slurm.call.samtools.process.sam.sh acp6_c1_early.sam ./
sbatch slurm.call.samtools.process.sam.sh acp6_c1_late.sam ./
sbatch slurm.call.samtools.process.sam.sh acp6_c2_early.sam ./
sbatch slurm.call.samtools.process.sam.sh acp6_c2_late.sam ./
sbatch slurm.call.samtools.process.sam.sh acp6_c5_early.sam ./
sbatch slurm.call.samtools.process.sam.sh acp6_c5_late.sam ./
sbatch slurm.call.samtools.process.sam.sh acp6_c6_early.sam ./
sbatch slurm.call.samtools.process.sam.sh acp6_c6_late.sam ./

python ../align.haplotypes.py --bed acp6_c1_early.sorted.markdup.allele.counts.bed --out_directory ./
python ../align.haplotypes.py --bed acp6_c1_early.sorted.markdup.allele.counts.bed --out_directory ./
python ../align.haplotypes.py --bed acp6_c1_late.sorted.markdup.allele.counts.bed --out_directory ./
python ../align.haplotypes.py --bed acp6_c2_early.sorted.markdup.allele.counts.bed --out_directory ./
python ../align.haplotypes.py --bed acp6_c2_late.sorted.markdup.allele.counts.bed --out_directory ./
python ../align.haplotypes.py --bed acp6_c5_early.sorted.markdup.allele.counts.bed --out_directory ./
python ../align.haplotypes.py --bed acp6_c5_late.sorted.markdup.allele.counts.bed --out_directory ./
python ../align.haplotypes.py --bed acp6_c6_early.sorted.markdup.allele.counts.bed --out_directory ./
python ../align.haplotypes.py --bed acp6_c6_late.sorted.markdup.allele.counts.bed --out_directory ./
