config <- function(){
  
  #################################
  project <- "TCGA"
  dataset <- "brca"
  
  path <- paste0("project/",project,"/dataset/",dataset)
  #################################
  # input files
  
  filename_data_RNA <- paste0(path,"/matrix/RNA_normal.txt")
  filename_data_miRNA <- paste0(path,"/matrix/miRNA_normal.txt")
  #################################
  # input parameters
  
  # NCBI biotype classes: "ncRNA","protein-coding","pseudo","rRNA","scRNA","snoRNA","snRNA","tRNA"
  
  ceRNA1 <- "protein-coding"
  ceRNA2 <- c("ncRNA","pseudo")
  
  threshold_perc_missing_values <- 0.1
  threshold_prc_corr <- 0.99
  threshold_prc_sensitivity <- 0.99
  
  searchSeedMatch <- "YES" # if you don't want to search for seed-match type "NO"
  #################################
  
  input_parameter <- list(path = path,
                          filename_data_RNA = filename_data_RNA,
                          filename_data_miRNA = filename_data_miRNA,
                          ceRNA1 = ceRNA1,
                          ceRNA2 = ceRNA2,
                          threshold_perc_missing_values = threshold_perc_missing_values,
                          threshold_prc_corr = threshold_prc_corr,
                          threshold_prc_sensitivity = threshold_prc_sensitivity,
                          searchSeedMatch = searchSeedMatch)
  
  return(input_parameter)
}