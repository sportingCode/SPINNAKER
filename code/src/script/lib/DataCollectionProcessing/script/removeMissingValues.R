removeMissingValues <- function(data,thr){
  
  perc_missing_values <- apply(data, 1, function(x){ 
    
    length( which(is.na(x)) ) / length(x)
    
    })
  
  ind <- which(perc_missing_values > thr)
  
  if(length(ind) > 0){
    
    data  <- data[-ind,]
    
  }
  
  data <- log2(data + 1)
  
  return(data)
}