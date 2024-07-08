#!/bin/bash

grep -v "chr^GL" $1 | \
grep -v "chr^M" | \
grep -v "chr^fix" | \
grep -v "chr^alt" | \
grep -v "chr^hap" | \
grep -v "chr^random" | \
grep -v "chr^17_ctg" | \
grep -v "chr^4_ctg" | \
grep -v "chr^9_gl" | \
grep -v "chr^7_gl" | \
grep -v "_qbl_hap6" | \
grep -v "_mcf_hap5" | \
grep -v "_mann_hap4" | \
grep -v "_dbb_hap3" | \
grep -v "_cox_hap2" | \
grep -v "_apd_hap1" | \
grep -v "_gl" | \
grep -v "_gl" | \
grep -v "Un_" | \
grep -v "6_ssto" | \
grep -v "_gl" | \
grep -v "\-1" | \
bedtools sort -i stdin -g hg19.ethan.fa.fai > $1.filtered.bed
