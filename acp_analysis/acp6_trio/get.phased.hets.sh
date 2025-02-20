#!/bin/bash

#!/bin/bash
input=$1
b=$(basename $input) ## removes /path/to/file
filename=${b%.vcf.gz}
out_dir=$2

source activate for_bcftools

bcftools view -i 'GT[@acp6_child.txt] = "0|1" | GT[@acp6_child.txt] = "1|0"' $input > $out_dir$filename.het.scaffold.vcf
bcftools index $out_dir$filename.het.scaffold.vcf
