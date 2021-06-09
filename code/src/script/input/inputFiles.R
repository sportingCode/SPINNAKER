inputFiles <- function(){
  
  ########################################
  # input parameters
  
  filename_data_RNA <- input_parameter$filename_data_RNA
  filename_data_miRNA <- input_parameter$filename_data_miRNA
  ########################################

  data_RNA <- data.frame(fread(filename_data_RNA, header = T, sep = '\t', 
                               quote = "", na.strings = c(NULL,"-","NA","NaN")), 
                         check.names = F, row.names = 1)

  data_miRNA <- data.frame(fread(filename_data_miRNA, header = T, sep = '\t', 
                                 quote = "", na.strings = c(NULL,"-","NA","NaN")), 
                           check.names = F, row.names = 1)
  ########################################
  
  input_file <- list(data_RNA = data_RNA,
                     data_miRNA = data_miRNA)
  
  return(input_file)
}
