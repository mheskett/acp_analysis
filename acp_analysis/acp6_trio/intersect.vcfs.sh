#!/bin/bash


bcftools isec acp6_joint.fb30.chr1.filtered30.no.missing.vcf.gz \
   /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/hg38_1kg/1kGP_high_coverage_Illumina.chr1.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
  -p ./tmp -o test.vcf

srun --mem 8000 --time 200 bcftools isec acp6_joint.fb30.chr1.filtered30.no.missing.child.hets.only.vcf.gz \
   /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/hg38_1kg/1kGP_high_coverage_Illumina.chr1.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
  -p ./tmp2 -o test2.vcf


srun --mem 8000 --time 200 bcftools isec acp6_joint.fb30.chr1.filtered30.no.missing.child.hets.only.vcf.gz \
   /home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/hg38_shapeit2/ALL.chr1.shapeit2_integrated_snvindels_v2a_27022019.GRCh38.phased.chr.prefix.vcf.gz \
  -p ./tmp3 -o test3.vcf

