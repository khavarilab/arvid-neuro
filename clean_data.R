# Clean MPRA results file

init_df = read.csv('./psychmpra_browser_data.tsv', sep = '\t')

colnames(init_df)

summary_df = init_df[ , c(45, 49, 50, 52, 54:72, 46, 47, 51, 53)]

detailed_df = init_df[ , c(3:44)]

library(stringr)

summary_df$drug_target_pertname = str_to_title(summary_df$drug_target_pertname)
summary_df$drug_cmap_pertname_up = str_to_title(summary_df$drug_cmap_pertname_up)
summary_df$drug_cmap_pertname_dn = str_to_title(summary_df$drug_cmap_pertname_dn)

for (i in 1:nrow(summary_df)) {
  summary_df$ukbb_phenotype[i] = paste0(str_to_sentence(str_split(summary_df$ukbb_phenotype[i], '\\|', simplify = T)), collapse = '|')
}
  
colnames(summary_df)

write.table(summary_df, './mpra_summary_data.tsv', sep = '\t', row.names = F, quote = F)

tmp = read.table('./mpra_summary_data.tsv', sep = '\t', header = T)
write.table(tmp, './mpra_summary_data.csv', sep = ',', row.names = F, quote = F)

tmp = read.csv('./data/study_summary_data.csv', check.names = T)

final_df = cbind(tmp, detailed_df)

write.csv(final_df, './data/complete_data.csv', row.names = F, quote = F)
tmp = read.csv('./data/complete_data.csv')

