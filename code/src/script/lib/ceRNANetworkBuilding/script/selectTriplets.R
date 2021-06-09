selectTriplets <- function(df,thr){
  
  s <- df$sensitivity
  
  ind <- which(s >= thr)
  
  if( length(ind) > 0 ){
    
    ceRNA <- df[ind,]
    
  }else{
    
    stop("No triplets with the selected sensitivity threshold")
    
  }
  
  return(ceRNA)
}
