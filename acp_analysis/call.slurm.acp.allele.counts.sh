## acp6 total
sbatch slurm.allele.counts.from.bam.sh RNA210216MT_1_tACP6c1_hg19Aligned.out.samtool.rmdup.bam ./
sbatch slurm.allele.counts.from.bam.sh RNA210216MT_2_tACP6c2_hg19Aligned.out.samtool.rmdup.bam ./
sbatch slurm.allele.counts.from.bam.sh RNA210216MT_3_tACP6c5_hg19Aligned.out.samtool.rmdup.bam ./
sbatch slurm.allele.counts.from.bam.sh RNA210216MT_4_tACP6c6_hg19Aligned.out.samtool.rmdup.bam ./

## acp6 strand specific
sbatch slurm.allele.counts.from.bam.sh RNA210216MT_1_tACP6c1_hg19Aligned.out.samtool.rmdup.plus.bam ./
sbatch slurm.allele.counts.from.bam.sh RNA210216MT_2_tACP6c2_hg19Aligned.out.samtool.rmdup.plus.bam ./
sbatch slurm.allele.counts.from.bam.sh RNA210216MT_3_tACP6c5_hg19Aligned.out.samtool.rmdup.plus.bam ./
sbatch slurm.allele.counts.from.bam.sh RNA210216MT_4_tACP6c6_hg19Aligned.out.samtool.rmdup.plus.bam ./
sbatch slurm.allele.counts.from.bam.sh RNA210216MT_1_tACP6c1_hg19Aligned.out.samtool.rmdup.minus.bam ./
sbatch slurm.allele.counts.from.bam.sh RNA210216MT_2_tACP6c2_hg19Aligned.out.samtool.rmdup.minus.bam ./
sbatch slurm.allele.counts.from.bam.sh RNA210216MT_3_tACP6c5_hg19Aligned.out.samtool.rmdup.minus.bam ./
sbatch slurm.allele.counts.from.bam.sh RNA210216MT_4_tACP6c6_hg19Aligned.out.samtool.rmdup.minus.bam ./

## acp7 total
sbatch slurm.allele.counts.from.bam.acp7.sh RNA210216MT_1_tACP7c1Aligned.out.samtool.rmdup.bam ./
sbatch slurm.allele.counts.from.bam.acp7.sh RNA210216MT_6_tACP7c2Aligned.out.samtool.rmdup.bam ./
sbatch slurm.allele.counts.from.bam.acp7.sh RNA210216MT_7_tACP7c4Aligned.out.samtool.rmdup.bam ./

## acp7 strand specific
sbatch slurm.allele.counts.from.bam.acp7.sh RNA210216MT_1_tACP7c1Aligned.out.samtool.rmdup.plus.bam ./
sbatch slurm.allele.counts.from.bam.acp7.sh RNA210216MT_6_tACP7c2Aligned.out.samtool.rmdup.plus.bam ./
sbatch slurm.allele.counts.from.bam.acp7.sh RNA210216MT_7_tACP7c4Aligned.out.samtool.rmdup.plus.bam ./
sbatch slurm.allele.counts.from.bam.acp7.sh RNA210216MT_1_tACP7c1Aligned.out.samtool.rmdup.minus.bam ./
sbatch slurm.allele.counts.from.bam.acp7.sh RNA210216MT_6_tACP7c2Aligned.out.samtool.rmdup.minus.bam ./
sbatch slurm.allele.counts.from.bam.acp7.sh RNA210216MT_7_tACP7c4Aligned.out.samtool.rmdup.minus.bam ./
####

python align.haplotypes.py --bed RNA210216MT_1_tACP6c1_hg19Aligned.out.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed RNA210216MT_1_tACP7c1Aligned.out.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed RNA210216MT_2_tACP6c2_hg19Aligned.out.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed RNA210216MT_3_tACP6c5_hg19Aligned.out.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed RNA210216MT_4_tACP6c6_hg19Aligned.out.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed RNA210216MT_6_tACP7c2Aligned.out.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed RNA210216MT_7_tACP7c4Aligned.out.samtool.rmdup.allele.counts.bed --out_directory ./
## 
python align.haplotypes.py --bed RNA210216MT_1_tACP6c1_hg19Aligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed RNA210216MT_1_tACP7c1Aligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed RNA210216MT_2_tACP6c2_hg19Aligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed RNA210216MT_3_tACP6c5_hg19Aligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed RNA210216MT_4_tACP6c6_hg19Aligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed RNA210216MT_6_tACP7c2Aligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed RNA210216MT_7_tACP7c4Aligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed RNA210216MT_1_tACP6c1_hg19Aligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed RNA210216MT_1_tACP7c1Aligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed RNA210216MT_2_tACP6c2_hg19Aligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed RNA210216MT_3_tACP6c5_hg19Aligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed RNA210216MT_4_tACP6c6_hg19Aligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed RNA210216MT_6_tACP7c2Aligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed RNA210216MT_7_tACP7c4Aligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory ./
## get gene counts strand specific

## getting gene and then ASAR allele specific counts
sbatch slurm.get.gene.counts.sh RNA210216MT_1_tACP6c1_hg19Aligned.out.samtool.rmdup.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.gene.counts.sh RNA210216MT_1_tACP6c1_hg19Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.gene.counts.sh RNA210216MT_1_tACP6c1_hg19Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.gene.counts.sh RNA210216MT_1_tACP7c1Aligned.out.samtool.rmdup.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.gene.counts.sh RNA210216MT_1_tACP7c1Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.gene.counts.sh RNA210216MT_1_tACP7c1Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.gene.counts.sh RNA210216MT_2_tACP6c2_hg19Aligned.out.samtool.rmdup.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.gene.counts.sh RNA210216MT_2_tACP6c2_hg19Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.gene.counts.sh RNA210216MT_2_tACP6c2_hg19Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.gene.counts.sh RNA210216MT_3_tACP6c5_hg19Aligned.out.samtool.rmdup.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.gene.counts.sh RNA210216MT_3_tACP6c5_hg19Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.gene.counts.sh RNA210216MT_3_tACP6c5_hg19Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.gene.counts.sh RNA210216MT_4_tACP6c6_hg19Aligned.out.samtool.rmdup.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.gene.counts.sh RNA210216MT_4_tACP6c6_hg19Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.gene.counts.sh RNA210216MT_4_tACP6c6_hg19Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.gene.counts.sh RNA210216MT_6_tACP7c2Aligned.out.samtool.rmdup.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.gene.counts.sh RNA210216MT_6_tACP7c2Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.gene.counts.sh RNA210216MT_6_tACP7c2Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.gene.counts.sh RNA210216MT_7_tACP7c4Aligned.out.samtool.rmdup.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.gene.counts.sh RNA210216MT_7_tACP7c4Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.gene.counts.sh RNA210216MT_7_tACP7c4Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.faisorted.bed

## trying comprehensive gene counts

./get.comprehensive.gene.counts.sh RNA210216MT_1_tACP6c1_hg19Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.faisorted.bed \
		RNA210216MT_1_tACP6c1_hg19Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.faisorted.bed \
		RNA210216MT_1_tACP6c1_hg19Aligned.out.samtool.rmdup.allele.counts.haplotype.resolved.counts.faisorted.bed




## get ASAR allele specific counts
sbatch slurm.get.vlinc.counts.sh RNA210216MT_1_tACP6c1_hg19Aligned.out.samtool.rmdup.intergenic.minus.500.10000.50000.vlinc.discovery.bed RNA210216MT_1_tACP6c1_hg19Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.vlinc.counts.sh RNA210216MT_1_tACP6c1_hg19Aligned.out.samtool.rmdup.intergenic.plus.500.10000.50000.vlinc.discovery.bed RNA210216MT_1_tACP6c1_hg19Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.vlinc.counts.sh RNA210216MT_1_tACP7c1Aligned.out.samtool.rmdup.intergenic.minus.500.10000.50000.vlinc.discovery.bed RNA210216MT_1_tACP7c1Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.vlinc.counts.sh RNA210216MT_1_tACP7c1Aligned.out.samtool.rmdup.intergenic.plus.500.10000.50000.vlinc.discovery.bed RNA210216MT_1_tACP7c1Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.vlinc.counts.sh RNA210216MT_2_tACP6c2_hg19Aligned.out.samtool.rmdup.intergenic.minus.500.10000.50000.vlinc.discovery.bed RNA210216MT_2_tACP6c2_hg19Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.vlinc.counts.sh RNA210216MT_2_tACP6c2_hg19Aligned.out.samtool.rmdup.intergenic.plus.500.10000.50000.vlinc.discovery.bed RNA210216MT_2_tACP6c2_hg19Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.vlinc.counts.sh RNA210216MT_3_tACP6c5_hg19Aligned.out.samtool.rmdup.intergenic.minus.500.10000.50000.vlinc.discovery.bed RNA210216MT_3_tACP6c5_hg19Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.vlinc.counts.sh RNA210216MT_3_tACP6c5_hg19Aligned.out.samtool.rmdup.intergenic.plus.500.10000.50000.vlinc.discovery.bed RNA210216MT_3_tACP6c5_hg19Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.vlinc.counts.sh RNA210216MT_4_tACP6c6_hg19Aligned.out.samtool.rmdup.intergenic.minus.500.10000.50000.vlinc.discovery.bed RNA210216MT_4_tACP6c6_hg19Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.vlinc.counts.sh RNA210216MT_4_tACP6c6_hg19Aligned.out.samtool.rmdup.intergenic.plus.500.10000.50000.vlinc.discovery.bed RNA210216MT_4_tACP6c6_hg19Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.vlinc.counts.sh RNA210216MT_6_tACP7c2Aligned.out.samtool.rmdup.intergenic.minus.500.10000.50000.vlinc.discovery.bed RNA210216MT_6_tACP7c2Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.vlinc.counts.sh RNA210216MT_6_tACP7c2Aligned.out.samtool.rmdup.intergenic.plus.500.10000.50000.vlinc.discovery.bed RNA210216MT_6_tACP7c2Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.vlinc.counts.sh RNA210216MT_7_tACP7c4Aligned.out.samtool.rmdup.intergenic.minus.500.10000.50000.vlinc.discovery.bed RNA210216MT_7_tACP7c4Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.faisorted.bed
sbatch slurm.get.vlinc.counts.sh RNA210216MT_7_tACP7c4Aligned.out.samtool.rmdup.intergenic.plus.500.10000.50000.vlinc.discovery.bed RNA210216MT_7_tACP7c4Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.faisorted.bed

#####
###repliseq getting coverage files
sbatch slurm.repliseq.analysis.acps.sh acp6_c1_m_e.samtool.rmdup.bam acp6_c1_m_l.samtool.rmdup.bam
sbatch slurm.repliseq.analysis.acps.sh acp6_c1_p_e.samtool.rmdup.bam acp6_c1_p_l.samtool.rmdup.bam
sbatch slurm.repliseq.analysis.acps.sh acp6_c2_m_e.samtool.rmdup.bam acp6_c2_m_l.samtool.rmdup.bam
sbatch slurm.repliseq.analysis.acps.sh acp6_c2_p_e.samtool.rmdup.bam acp6_c2_p_l.samtool.rmdup.bam
sbatch slurm.repliseq.analysis.acps.sh acp6_c5_m_e.samtool.rmdup.bam acp6_c5_m_l.samtool.rmdup.bam
sbatch slurm.repliseq.analysis.acps.sh acp6_c5_p_e.samtool.rmdup.bam acp6_c5_p_l.samtool.rmdup.bam
sbatch slurm.repliseq.analysis.acps.sh acp6_c6_m_e.samtool.rmdup.bam acp6_c6_m_l.samtool.rmdup.bam
sbatch slurm.repliseq.analysis.acps.sh acp6_c6_p_e.samtool.rmdup.bam acp6_c6_p_l.samtool.rmdup.bam
sbatch slurm.repliseq.analysis.acps.sh acp7_c2_m_e.samtool.rmdup.bam acp7_c2_m_l.samtool.rmdup.bam
sbatch slurm.repliseq.analysis.acps.sh acp7_c2_p_e.samtool.rmdup.bam acp7_c2_p_l.samtool.rmdup.bam
sbatch slurm.repliseq.analysis.acps.sh acp7_c4_m_e.samtool.rmdup.bam acp7_c4_m_l.samtool.rmdup.bam
sbatch slurm.repliseq.analysis.acps.sh acp7_c4_p_e.samtool.rmdup.bam acp7_c4_p_l.samtool.rmdup.bam
sbatch slurm.repliseq.analysis.acps.sh acp7_c5_m_e.samtool.rmdup.bam acp7_c5_m_l.samtool.rmdup.bam
sbatch slurm.repliseq.analysis.acps.sh acp7_c5_p_e.samtool.rmdup.bam acp7_c5_p_l.samtool.rmdup.bam


#### getting allele counts from repliseq
sbatch slurm.allele.counts.from.bam.sh acp6_c1_m_e.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.sh acp6_c1_m_l.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.sh acp6_c1_p_e.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.sh acp6_c1_p_l.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.sh acp6_c2_m_e.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.sh acp6_c2_m_l.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.sh acp6_c2_p_e.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.sh acp6_c2_p_l.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.sh acp6_c5_m_e.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.sh acp6_c5_m_l.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.sh acp6_c5_p_e.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.sh acp6_c5_p_l.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.sh acp6_c6_m_e.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.sh acp6_c6_m_l.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.sh acp6_c6_p_e.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.sh acp6_c6_p_l.samtool.rmdup.bam
#
sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c2_m_e.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c2_m_l.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c2_p_e.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c2_p_l.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c4_m_e.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c4_m_l.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c4_p_e.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c4_p_l.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c5_m_e.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c5_m_l.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c5_p_e.samtool.rmdup.bam
sbatch slurm.allele.counts.from.bam.acp7.sh acp7_c5_p_l.samtool.rmdup.bam
######


python align.haplotypes.py --bed acp6_c1_m_e.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp6_c1_m_l.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp6_c1_p_e.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp6_c1_p_l.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp6_c2_m_e.samtool.rmdup.allele.counts.bed --out_directory ./ 
python align.haplotypes.py --bed acp6_c2_m_l.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp6_c2_p_e.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp6_c2_p_l.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp6_c5_m_e.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp6_c5_m_l.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp6_c5_p_e.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp6_c5_p_l.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp6_c6_m_e.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp6_c6_m_l.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp6_c6_p_e.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp6_c6_p_l.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp7_c2_m_e.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp7_c2_m_l.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp7_c2_p_e.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp7_c2_p_l.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp7_c4_m_e.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp7_c4_m_l.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp7_c4_p_e.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp7_c4_p_l.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp7_c5_m_e.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp7_c5_m_l.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp7_c5_p_e.samtool.rmdup.allele.counts.bed --out_directory ./
python align.haplotypes.py --bed acp7_c5_p_l.samtool.rmdup.allele.counts.bed --out_directory ./


./get.as.repliseq.counts.sh acp6_c1_m_e.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp6_c1_m_l.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp6_c1_p_e.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp6_c1_p_l.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp6_c2_m_e.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp6_c2_m_l.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp6_c2_p_e.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp6_c2_p_l.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp6_c5_m_e.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp6_c5_m_l.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp6_c5_p_e.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp6_c5_p_l.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp6_c6_m_e.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp6_c6_m_l.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp6_c6_p_e.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp6_c6_p_l.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed


./get.as.repliseq.counts.sh acp7_c2_m_e.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp7_c2_m_l.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp7_c2_p_e.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp7_c2_p_l.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp7_c4_m_e.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp7_c4_m_l.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp7_c4_p_e.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp7_c4_p_l.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp7_c5_m_e.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp7_c5_m_l.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp7_c5_p_e.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
./get.as.repliseq.counts.sh acp7_c5_p_l.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed
