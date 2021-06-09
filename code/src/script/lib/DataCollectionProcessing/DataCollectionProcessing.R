DataCollectionProcessing <- function(){
  
  ########################################
  # input parameters
  
  data_RNA <- input_file$data_RNA
  data_miRNA <- input_file$data_miRNA
  
  ceRNA1 <- input_parameter$ceRNA1
  ceRNA2 <- input_parameter$ceRNA2
  
  searchSeedMatch <- input_parameter$searchSeedMatch
  
  threshold_perc_missing_values <- input_parameter$threshold_perc_missing_values
  
  filename_data <- output_file$filename_data
  ########################################
  
  data_RNA <- removeMissingValues(data_RNA,threshold_perc_missing_values)
  data_miRNA <- removeMissingValues(data_miRNA,threshold_perc_missing_values)
  
  biotype <- getBiotype(rownames(data_RNA))
  
  data_ceRNA1 <- createDataCerna(data_RNA,biotype,ceRNA1)
  data_ceRNA2 <- createDataCerna(data_RNA,biotype,ceRNA2)
  
  res <- list(data_ceRNA1 = data_ceRNA1, 
              data_ceRNA2 = data_ceRNA2,
              data_miRNA = data_miRNA)
  
  if(searchSeedMatch == "YES"){
    
    miRNAtarget <- getmiRNAtarget(ceRNA1,ceRNA2)
    
    res_seedmatch <- list(miRNAtarget = miRNAtarget)
    res <- c(res,res_seedmatch)
    
  }
  
  save(res,file = filename_data)
  
  return(res)
}