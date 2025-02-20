#!/bin/bash

#SBATCH --partition=batch
#SBATCH --mem 30000
#SBATCH -c 1
#SBATCH --time=8:0:0
#SBATCH -A thayerlab
#!/bin/bash

input_genotype=$1
prephased_scaffold=$2
b=$(basename $input_genotype) ## removes /path/to/file
filename=${b%.*}
chrom=$3
out_dir=$4

source activate for_shapeit4

shapeit_map_dir="/home/exacloud/gscratch/ThayerLab/heskett/condaEnvTrioPhaser/shapeit4-4.2.2/maps"
## old ones
reference_haps="/home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/hg38_shapeit2"
## new ones
reference_haps="/home/exacloud/gscratch/ThayerLab/heskett/acp_analysis/hg38_1kg"

shapeit4 --input $input_genotype \
         --map $shapeit_map_dir/chr_prefix/chr$chrom.b38.gmap.gz \
         --region chr$chrom \
         --output $out_dir$filename.si.phased.vcf.gz \
         --reference $reference_haps/1kGP_high_coverage_Illumina.chr$chrom.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
         --sequencing \
         --scaffold $prephased_scaffold \
         --seed 123456789
