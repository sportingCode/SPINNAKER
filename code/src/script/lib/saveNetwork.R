saveNetwork <- function(){
  
  ########################################
  # input parameters
  
  searchSeedMatch <- input_parameter$searchSeedMatch
  
  filename_ceRNA_network_R <- output_file$filename_ceRNA_network_R
  filename_ceRNA_network_txt <- output_file$filename_ceRNA_network_txt
  
  if(searchSeedMatch == "YES"){
    filename_ceRNA_network_pval_txt <- output_file$filename_ceRNA_network_pval_txt
  }
  ########################################
  
  print("save ceRNA network")
  
  save(ceRNA_network, file = filename_ceRNA_network_R)
  
  write.table(ceRNA_network$ceRNA, filename_ceRNA_network_txt, 
              sep = "\t", row.names = F, col.names = T, quote = F)
  
  if(searchSeedMatch == "YES"){
    
    write.table(ceRNA_network$ceRNA_pval, filename_ceRNA_network_pval_txt, 
                sep = "\t", row.names = F, col.names = T, quote = F)
    
  }
}