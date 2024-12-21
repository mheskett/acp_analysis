paste acp7_c5_p_e.samtool.rmdup.allele.counts.haplotype.resolved.counts.as.repli.counts.bed \
      acp7_c5_p_l.samtool.rmdup.allele.counts.haplotype.resolved.counts.as.repli.counts.bed | \
      awk 'OFS="\t" {print $1,$2,$3,log( ($4+1)/($9+1) )/log(2),
                           log(($5+1)/($10+1) )/log(2) }' > tmp.txt
