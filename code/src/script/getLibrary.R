getLibrary <- function(){
  
  ########################################
  
  print("Checking Dependency...")
  
  packages <- c("Biostrings","data.table","readxl","R.utils","plyr","propagate","stringi","pheatmap")
  dependency <- data.frame(package = packages, repository = c("Bioc",rep("CRAN",7)), row.names = packages)
  
  installed <- installed.packages()
  
  if(!"devtools" %in% installed){install.packages('devtools')}
  if(!"BiocManager" %in% installed){install.packages('BiocManager')}
  
  install <- dependency[!(dependency$package %in% installed),]
  
  if(nrow(install)>0){
    
    CRAN <- install$package[which(install$repository == 'CRAN')]
    Bioc <- install$package[which(install$repository == 'Bioc')]
    
    if(length(CRAN)>0){devtools::install_cran(CRAN,upgrade = 'never')}
    if(length(Bioc)>0){BiocManager::install(Bioc,update = F)}
  }
  
  print("Checking Dependency Finished!")
  ########################################
  
  print("Loading packages...")
  
  invisible(sapply(packages,require, character.only = TRUE))
  
  print("Loading packages Finished")

}



