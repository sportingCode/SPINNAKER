querymiRWalk <- function(){
  
  ########################################
  # Query miRWalk
  
  # the link at line 8 is not longer available at Date 15th November, 2021
  # when the link will return available, please uncomment line 8-11, 16-17
  # fileURL <- "http://zmf.umm.uni-heidelberg.de/apps/zmf/mirwalk2/downloads/lncrna/shsalncRNAgr.zip"
  # destfile <- "shsalncRNAgr.zip"
  # download.file(fileURL, destfile, method="auto")
  # unzip(destfile)
  fileRdata <- "hsaLncRNA-gene.rdata"
  
  load(fileRdata) # load "hsa" large list
  
  # file.remove(fileRdata)
  # file.remove(destfile)
  ########################################
  
  return(hsa)
}