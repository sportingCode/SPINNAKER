ceRNANetworkBuilding <- function(){
  
  ########################################
  # input parameters
  
  ceRNA1 <- input_parameter$ceRNA1
  ceRNA2 <- input_parameter$ceRNA2
  
  data_ceRNA1 <- data$data_ceRNA1
  data_ceRNA2 <- data$data_ceRNA2
  data_miRNA <- data$data_miRNA
  
  threshold_prc_corr <- input_parameter$threshold_prc_corr
  threshold_prc_sensitivity <- input_parameter$threshold_prc_sensitivity
  
  searchSeedMatch <- input_parameter$searchSeedMatch
  
  if(searchSeedMatch == "YES") {
    miRNAtarget <- data$miRNAtarget
  }
  
  filename_heatmap <- output_file$filename_heatmap
  ########################################
  # STEP 1
  
  print("STEP 1: compute Pearson correlation")
  
  rho_ceRNA1_ceRNA2 <- computeCorrelation(data_ceRNA1,data_ceRNA2)
  
  if(all(ceRNA1 == ceRNA2)){
    rho_ceRNA1_ceRNA2[upper.tri(rho_ceRNA1_ceRNA2,diag = T)] <- NA
  }
  ########################################
  # STEP 2
  
  print("STEP 2: select highly correlated pairs")
  
  threshold_corr <- as.numeric(quantile(c(rho_ceRNA1_ceRNA2),threshold_prc_corr,na.rm = T))
  
  pairs <- selectPairs(rho_ceRNA1_ceRNA2,threshold_corr)
  
  data_ceRNA1 <- data_ceRNA1[unique(pairs$ceRNA1),]
  data_ceRNA2 <- data_ceRNA2[unique(pairs$ceRNA2),]
  ########################################
  # STEP 3
  
  print("STEP 3: compute Pearson correlation with miRNAs")
  
  rho_ceRNA1_miRNA <- computeCorrelation(data_ceRNA1,data_miRNA)
  rho_ceRNA2_miRNA <- computeCorrelation(data_ceRNA2,data_miRNA)
  ########################################
  # STEP 4
  
  print("STEP 4: compute sensitivity correlation")
  
  triplets <- computeSensitivity(pairs,rho_ceRNA1_miRNA,rho_ceRNA2_miRNA,filename_heatmap)
  ########################################
  # STEP 5
  
  print("STEP 5: compute ceRNA interaction network")
  
  threshold_sensitivity <- as.numeric(quantile(triplets$sensitivity,threshold_prc_sensitivity))
  
  ceRNA <- selectTriplets(triplets,threshold_sensitivity)
  
  res <- list(ceRNA = ceRNA,
              threshold_corr = threshold_corr,
              threshold_sensitivity = threshold_sensitivity)
  ########################################
  
  if(searchSeedMatch == "YES"){
    
    ########################################
    # STEP 6
    
    print("STEP 6: search seed-match for all triplets")
    
    triplets <- searchSeedMatch(triplets,miRNAtarget)
    ########################################
    # STEP 7
    
    print("STEP 7: compute statistical analysis")
    
    ceRNA_pval <- statisticalAnalysis(pairs,triplets,ceRNA,miRNAtarget)
    
    res_stat <- list(ceRNA_pval = ceRNA_pval)
    ########################################
    
    res <- c(res,res_stat)
    
  }
  
  return(res)
}