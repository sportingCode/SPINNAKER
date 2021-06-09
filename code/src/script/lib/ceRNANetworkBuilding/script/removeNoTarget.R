removeNoTarget <- function(ceRNA,miRNAtarget){
  
  ceRNA1 <- unique(ceRNA$ceRNA1)
  ceRNA2 <- unique(ceRNA$ceRNA2)
  
  names(miRNAtarget) <- NULL
  target <- unique(unlist(miRNAtarget))
  
  ceRNA1_to_remove <- setdiff(ceRNA1,target)
  ceRNA2_to_remove <- setdiff(ceRNA2,target)
  
  ind1 <- which(ceRNA$ceRNA1 %in% ceRNA1_to_remove)
  if(length(ind1)>0) ceRNA <- ceRNA[-ind1,]
  
  ind2 <- which(ceRNA$ceRNA2 %in% ceRNA2_to_remove)
  if(length(ind2)>0) ceRNA <- ceRNA[-ind2,]
  
  return(ceRNA)
}