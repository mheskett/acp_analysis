## revert bam to fq
for f in *bam; do srun --mem 12000 -c 1 --time 60 bam.to.fastq.sh $f & done

## combine the FQ replicates AND combine the paternal maternal 

cat LIB230502MT_e1_ACP7_c2_acp7_maternal_hg19.fq LIB230502MT_e1_ACP7_c2_acp7_paternal_hg19.fq LIB230502MT_e2_ACP7_c2_acp7_maternal_hg19.fq LIB230502MT_e2_ACP7_c2_acp7_paternal_hg19.fq > acp7_c2_early.fq
cat LIB230502MT_l1_ACP7_c2_acp7_maternal_hg19.fq LIB230502MT_l1_ACP7_c2_acp7_paternal_hg19.fq LIB230502MT_l2_ACP7_c2_acp7_maternal_hg19.fq LIB230502MT_l2_ACP7_c2_acp7_paternal_hg19.fq > acp7_c2_late.fq
cat LIB230502MT_e1_ACP7_c4_acp7_maternal_hg19.fq LIB230502MT_e1_ACP7_c4_acp7_paternal_hg19.fq LIB230502MT_e2_ACP7_c4_acp7_maternal_hg19.fq LIB230502MT_e2_ACP7_c4_acp7_paternal_hg19.fq > acp7_c4_early.fq
cat LIB230502MT_l1_ACP7_c4_acp7_maternal_hg19.fq LIB230502MT_l1_ACP7_c4_acp7_paternal_hg19.fq LIB230502MT_l2_ACP7_c4_acp7_maternal_hg19.fq LIB230502MT_l2_ACP7_c4_acp7_paternal_hg19.fq > acp7_c4_late.fq
cat LIB230502MT_e1_ACP7_c5_acp7_maternal_hg19.fq LIB230502MT_e1_ACP7_c5_acp7_paternal_hg19.fq LIB230502MT_e2_ACP7_c5_acp7_maternal_hg19.fq LIB230502MT_e2_ACP7_c5_acp7_paternal_hg19.fq > acp7_c5_early.fq
cat LIB230502MT_l1_ACP7_c5_acp7_maternal_hg19.fq LIB230502MT_l1_ACP7_c5_acp7_paternal_hg19.fq LIB230502MT_l2_ACP7_c5_acp7_maternal_hg19.fq LIB230502MT_l2_ACP7_c5_acp7_paternal_hg19.fq > acp7_c5_late.fq

sbatch slurm.call.bwa.hg19.sh acp7_c2_early.fq acp7_c2_early ./
sbatch slurm.call.bwa.hg19.sh acp7_c2_late.fq acp7_c2_late ./
sbatch slurm.call.bwa.hg19.sh acp7_c4_early.fq acp7_c4_early ./
sbatch slurm.call.bwa.hg19.sh acp7_c4_late.fq acp7_c4_late ./
sbatch slurm.call.bwa.hg19.sh acp7_c5_early.fq acp7_c5_early ./
sbatch slurm.call.bwa.hg19.sh acp7_c5_late.fq acp7_c5_late ./

for f in *sam; do srun --mem 16000 --time 60 -c 1 ./samtools.process.sam.sh $f & done

for f in *bam; do srun --mem 8000 --time 100 -c 1 ./acp7.allele.count.from.bam.sh $f & done
python ../align.haplotypes.py --bed acp7_c2_early.sorted.markdup.allele.counts.bed --out_directory ./
python ../align.haplotypes.py --bed acp7_c2_late.sorted.markdup.allele.counts.bed --out_directory ./
python ../align.haplotypes.py --bed acp7_c4_early.sorted.markdup.allele.counts.bed --out_directory ./ 
python ../align.haplotypes.py --bed acp7_c4_late.sorted.markdup.allele.counts.bed  --out_directory ./
python ../align.haplotypes.py --bed acp7_c5_early.sorted.markdup.allele.counts.bed --out_directory ./
python ../align.haplotypes.py --bed acp7_c5_late.sorted.markdup.allele.counts.bed --out_directory ./
