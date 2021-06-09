createDataCerna <- function(data_RNA,biotype,ceRNA){
  
  if( length(ceRNA) == 1 ){
    
    ind <- which(biotype[,"type_of_gene"] == ceRNA)
    symbol <- biotype[ind,"Symbol"]
    
  }else{
    
    list <- lapply(ceRNA, function(x){
      
      ind <- which(biotype[,"type_of_gene"] == x)
      symbol <- biotype[ind,"Symbol"]
      
    })
    
    symbol <- unlist(list)
    
  }
  
  data_ceRNA <- data_RNA[symbol,]
  
  return(data_ceRNA)
}
