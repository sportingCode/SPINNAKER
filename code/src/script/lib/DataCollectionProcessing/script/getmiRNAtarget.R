getmiRNAtarget <- function(ceRNA1,ceRNA2){
  
  condition1 <- all(ceRNA1 == "protein-coding" & ceRNA2 == "protein-coding")
  condition2 <- any(ceRNA1 != ceRNA2) & 
    any(ceRNA1 == "protein-coding" | ceRNA2 == "protein-coding")
  
  if(condition1){
    
    miRNAtarget <- queryTargetScan()
    
  }else if(condition2){
    
    mRNA <- queryTargetScan()
    lncRNA <- querymiRWalk()
    
    mir_common <- intersect(names(mRNA),names(lncRNA))
    
    miRNAtarget <- mapply(c, mRNA[mir_common], lncRNA[mir_common], SIMPLIFY = F)
    
  }else{
    
    miRNAtarget <- querymiRWalk()
    
  }
  
  return(miRNAtarget)
}
