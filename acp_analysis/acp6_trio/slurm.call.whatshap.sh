#!/bin/bash

#SBATCH --partition=batch
#SBATCH --mem 8000
#SBATCH -c 1
#SBATCH --time=24:0:0
#SBATCH -A thayerlab

input=$1
b=$(basename $input) ## removes /path/to/file
filename=${b%.*}
chrom=$2
out_dir=$3

source activate for_whatshap
whatshap phase \
  --ped /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/acp6_trio/acp6_pedigree.ped \
  --reference=/home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/hg38_fasta_ref/hg38.fa \
  -o $out_dir$filename.wh.phased.vcf \
  --genmap /home/exacloud/gscratch/ThayerLab/heskett/condaEnvTrioPhaser/shapeit4-4.2.2/maps/chr_prefix/maps_unzipped/chr$chrom.b38.gmap \
  --chromosome chr$chrom \
  $input \
  acp6_child.sorted.markdup.chr$chrom.bam \
  acp1001a_mom.sorted.markdup.chr$chrom.bam \
  acp1001b_dad.sorted.markdup.chr$chrom.bam

bcftools view -S acp6_child.txt $out_dir$filename.wh.phased.vcf | \
  bcftools view --phased | \
  bcftools query -f '%CHROM\t%POS0\t%END\t[%TGT]\n' | \
  awk 'OFS="\t"{split($4,a,"|");print $1,$2,$3,a[1],a[2]}' | sort -k1,1 -k2,2n > $out_dir$filename.wh.phased.final.hets.bed
