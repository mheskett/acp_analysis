## align to hg38
sbatch slurm.call.bwa.paired.hg38.sh eb3_2_clone10_early_rt_1.fastq.gz eb3_2_clone10_early_rt_2.fastq.gz eb3_2_clone10_early eb3_2_clone10_early ./
sbatch slurm.call.bwa.paired.hg38.sh eb3_2_clone10_late_rt_1.fastq.gz eb3_2_clone10_late_rt_2.fastq.gz eb3_2_clone10_late eb3_2_clone10_late ./
sbatch slurm.call.bwa.paired.hg38.sh eb3_2_clone13_early_rt_1.fastq.gz eb3_2_clone13_early_rt_2.fastq.gz eb3_2_clone13_early eb3_2_clone13_early ./
sbatch slurm.call.bwa.paired.hg38.sh eb3_2_clone13_late_rt_1.fastq.gz eb3_2_clone13_late_rt_2.fastq.gz eb3_2_clone13_late eb3_2_clone13_late ./
sbatch slurm.call.bwa.paired.hg38.sh eb3_2_clone15_early_rt_1.fastq.gz eb3_2_clone15_early_rt_2.fastq.gz eb3_2_clone15_early eb3_2_clone15_early ./
sbatch slurm.call.bwa.paired.hg38.sh eb3_2_clone15_late_rt_1.fastq.gz eb3_2_clone15_late_rt_2.fastq.gz eb3_2_clone15_late eb3_2_clone15_late ./
sbatch slurm.call.bwa.paired.hg38.sh eb3_2_clone2_early_rt_1.fastq.gz eb3_2_clone2_early_rt_2.fastq.gz eb3_2_clone2_early eb3_2_clone2_early ./
sbatch slurm.call.bwa.paired.hg38.sh eb3_2_clone2_late_rt_1.fastq.gz eb3_2_clone2_late_rt_2.fastq.gz eb3_2_clone2_late eb3_2_clone2_late ./
sbatch slurm.call.bwa.paired.hg38.sh eb3_2_clone3_early_rt_1.fastq.gz eb3_2_clone3_early_rt_2.fastq.gz eb3_2_clone3_early eb3_2_clone3_early ./
sbatch slurm.call.bwa.paired.hg38.sh eb3_2_clone3_late_rt_1.fastq.gz eb3_2_clone3_late_rt_2.fastq.gz eb3_2_clone3_late eb3_2_clone3_late ./
sbatch slurm.call.bwa.paired.hg38.sh eb3_2_clone4_early_rt_1.fastq.gz eb3_2_clone4_early_rt_2.fastq.gz eb3_2_clone4_early eb3_2_clone4_early ./
sbatch slurm.call.bwa.paired.hg38.sh eb3_2_clone4_late_rt_1.fastq.gz eb3_2_clone4_late_rt_2.fastq.gz  eb3_2_clone4_late  eb3_2_clone4_late ./

## process SAM files
sbatch slurm.samtools.process.sam.sh
