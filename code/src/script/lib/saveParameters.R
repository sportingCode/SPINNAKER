saveParameters <- function(){
  
  ########################################
  # input parameters
  
  searchSeedMatch <- input_parameter$searchSeedMatch
  ########################################
  
  print("save parameters")
  
  parameters = c(input_parameter$dataset,
                 input_parameter$ceRNA1,
                 input_parameter$ceRNA2,
                 input_parameter$threshold_perc_missing_values,
                 input_parameter$threshold_prc_corr,
                 input_parameter$threshold_prc_sensitivity,
                 ceRNA_network$threshold_corr,
                 ceRNA_network$threshold_sensitivity)
  
  names <- c("dataset","ceRNA1","ceRNA2","threshold_perc_missing_values",
             "threshold_prc_corr","threshold_prc_sensitivity",
             "threshold_correlation","threshold_sensitivity")
  
  N <- length(parameters)
  
  init_config <- matrix(parameters,N,1)
  rownames(init_config) <- names
  
  save(init_config,file = output_file$filename_parameters)
}

