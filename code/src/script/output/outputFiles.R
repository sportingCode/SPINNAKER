outputFiles <- function(){
  
  ########################################
  # input parameters
  
  path <- input_parameter$path
  searchSeedMatch <- input_parameter$searchSeedMatch
  
  output_dir <- outputDir(path)
  ########################################
  # output directories
  
  dirTxt<- output_dir$dirTxt
  dirFigure <- output_dir$dirFigure
  dirRdata <- output_dir$dirRdata
  ########################################
  # output Rdata file
  
  filename_data <- paste0(dirRdata,"/data.RData")
  filename_parameters <- paste0(dirRdata,"/parameter.RData")
  filename_ceRNA_network_R <- paste0(dirRdata,"/ceRNA_network.RData")
  ########################################
  # output txt file
  
  filename_ceRNA_network_txt <- paste0(dirTxt,"/ceRNA_network.txt")
  
  if(searchSeedMatch == "YES"){
    filename_ceRNA_network_pval_txt <- paste0(dirTxt,"ceRNA_network_pval.txt")
  }
  ########################################
  # output  figure
  
  filename_heatmap <- paste0(dirFigure,"heatmap")
  ########################################
  
  output_file <- list(filename_data = filename_data,
                      filename_parameters = filename_parameters,
                      filename_ceRNA_network_R = filename_ceRNA_network_R,
                      filename_ceRNA_network_txt = filename_ceRNA_network_txt,
                      filename_heatmap = filename_heatmap)
  
  if(searchSeedMatch == "YES"){
    
    output_file_seedmatch <- list(filename_ceRNA_network_pval_txt = filename_ceRNA_network_pval_txt)
    output_file <- c(output_file,output_file_seedmatch)
    
  }
  
  return(output_file)
}



