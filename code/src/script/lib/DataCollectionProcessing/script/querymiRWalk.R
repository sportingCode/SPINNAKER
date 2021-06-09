querymiRWalk <- function(){
  
  ########################################
  # Query miRWalk
  
  fileURL <- "http://zmf.umm.uni-heidelberg.de/apps/zmf/mirwalk2/downloads/lncrna/shsalncRNAgr.zip"
  destfile <- "shsalncRNAgr.zip"
  download.file(fileURL, destfile, method="auto")
  unzip(destfile)
  fileRdata <- "hsaLncRNA-gene.rdata"
  
  load(fileRdata) # load "hsa" large list
  
  file.remove(fileRdata)
  file.remove(destfile)
  ########################################
  
  return(hsa)
}