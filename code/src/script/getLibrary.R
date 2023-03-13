getLibrary <- function(){
  
  packages_installed <- installed.packages()
  
  ######################################
  # Installing packages from CRAN
  
  if(!"devtools" %in% packages_installed){install.packages('devtools')}
  
  packages_CRAN <- c("data.table","readxl","R.utils","plyr","propagate","stringi","pheatmap")
  
  packages_to_install_CRAN <- setdiff(packages_CRAN,packages_installed)
  
  if( length(packages_to_install_CRAN) > 0 ){
    devtools::install_cran(packages_to_install_CRAN, upgrade = 'never')
  }
  
  # Loading installed packages
  
  invisible(sapply(packages_CRAN,require,character.only = TRUE))
  
  ######################################
  # Installing packages from Bioconductor
  
  if(!"BiocManager" %in% packages_installed){install.packages('BiocManager')}
  
  packages_Bioc <- c("Biostrings")
  
  packages_to_install_Bioc <- setdiff(packages_Bioc,packages_installed)
  
  if( length(packages_to_install_Bioc) > 0 ){
    BiocManager::install(packages_to_install_Bioc, update = F)
  }
  
  # Loading installed packages
  
  invisible(sapply(packages_Bioc,require,character.only = TRUE))
  ######################################
}