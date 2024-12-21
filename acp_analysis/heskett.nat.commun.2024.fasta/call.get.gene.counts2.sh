srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed gm12878_clone4Aligned.out.samtool.rmdup.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed gm12878_clone4Aligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed gm12878_clone4Aligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed gm12878_clone5Aligned.out.samtool.rmdup.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed gm12878_clone5Aligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed gm12878_clone5Aligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed eb3_2_clone10Aligned.out.samtool.rmdup.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed eb3_2_clone10Aligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed eb3_2_clone10Aligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed eb3_2_clone13Aligned.out.samtool.rmdup.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed eb3_2_clone13Aligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed eb3_2_clone13Aligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed eb3_2_clone15Aligned.out.samtool.rmdup.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed eb3_2_clone15Aligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed eb3_2_clone15Aligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed eb3_2_clone2Aligned.out.samtool.rmdup.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed eb3_2_clone2Aligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed eb3_2_clone2Aligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed eb3_2_clone3Aligned.out.samtool.rmdup.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed eb3_2_clone3Aligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed eb3_2_clone3Aligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed eb3_2_clone4Aligned.out.samtool.rmdup.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed eb3_2_clone4Aligned.out.samtool.rmdup.minus.allele.counts.bed --out_directory ./ &
srun --mem 6000 --time 30 -c 1 python align.haplotypes.py --bed eb3_2_clone4Aligned.out.samtool.rmdup.plus.allele.counts.bed --out_directory ./ &


### get.comprehensive.gene.counts.sh plus minus total order

srun --mem 8000 --time 60 -c 1 ./get.comprehensive.gene.counts.sh eb3_2_clone10Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.bed eb3_2_clone10Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.bed eb3_2_clone10Aligned.out.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed &
srun --mem 8000 --time 60 -c 1 ./get.comprehensive.gene.counts.sh eb3_2_clone13Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.bed eb3_2_clone13Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.bed eb3_2_clone13Aligned.out.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed &
srun --mem 8000 --time 60 -c 1 ./get.comprehensive.gene.counts.sh eb3_2_clone15Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.bed eb3_2_clone15Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.bed eb3_2_clone15Aligned.out.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed &
srun --mem 8000 --time 60 -c 1 ./get.comprehensive.gene.counts.sh eb3_2_clone2Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.bed eb3_2_clone2Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.bed eb3_2_clone2Aligned.out.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed &
srun --mem 8000 --time 60 -c 1 ./get.comprehensive.gene.counts.sh eb3_2_clone3Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.bed eb3_2_clone3Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.bed eb3_2_clone3Aligned.out.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed &
srun --mem 8000 --time 60 -c 1 ./get.comprehensive.gene.counts.sh eb3_2_clone4Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.bed eb3_2_clone4Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.bed eb3_2_clone4Aligned.out.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed &
srun --mem 8000 --time 60 -c 1 ./get.comprehensive.gene.counts.sh gm12878_clone4Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.bed gm12878_clone4Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.bed gm12878_clone4Aligned.out.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed &
srun --mem 8000 --time 60 -c 1 ./get.comprehensive.gene.counts.sh gm12878_clone5Aligned.out.samtool.rmdup.plus.allele.counts.haplotype.resolved.counts.bed gm12878_clone5Aligned.out.samtool.rmdup.minus.allele.counts.haplotype.resolved.counts.bed gm12878_clone5Aligned.out.samtool.rmdup.allele.counts.haplotype.resolved.counts.bed &
