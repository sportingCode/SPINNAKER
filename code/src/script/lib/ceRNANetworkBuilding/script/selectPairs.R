selectPairs <- function(rho,thr){
  
  ind <- which(rho >= thr, arr.ind = T)
  
  if( nrow(ind) > 0 ){
    
    pairs <- data.frame(ceRNA1 = rownames(rho)[ind[,1]],
                        ceRNA2 = colnames(rho)[ind[,2]],
                        correlation = rho[ind])
    
  }else{
    
    stop("No pairs with the selected correlation threshold")
    
  }
  
  return(pairs)
}
