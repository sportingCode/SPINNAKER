outputDir <- function(path){
  
  ########################################
  dirRes <- paste0(path,"/ceRNAnetwork/")
  if(!file.exists(dirRes)){
    dir.create(dirRes, showWarnings = F)
  }
  ########################################
  # output
  
  dirTxt <- paste0(dirRes,"txtFile/")
  if(!file.exists(dirTxt)){
    dir.create(dirTxt, showWarnings = F)
  }
  
  dirFigure <- paste0(dirRes,"figure/")
  if(!file.exists(dirFigure)){
    dir.create(dirFigure, showWarnings = F)
  }
  
  dirRdata <- paste0(dirRes,"Rdata/")
  if(!file.exists(dirRdata)){
    dir.create(dirRdata, showWarnings = F)
  }
  ########################################
  
  output_directory <- list(dirTxt = dirTxt,
                           dirFigure = dirFigure,
                           dirRdata = dirRdata)
  
  return(output_directory)
}
