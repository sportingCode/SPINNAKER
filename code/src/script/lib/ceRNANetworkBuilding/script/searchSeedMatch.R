searchSeedMatch <- function(triplets,miRNAtarget){
  
  mir_common <- intersect(unique(triplets$miRNA),names(miRNAtarget))
  
  list <- lapply(mir_common,function(x){
    
    target <- miRNAtarget[[x]]
    
    ind <- which(triplets$miRNA == x)
    pairs <- triplets[ind,c("ceRNA1","ceRNA2")]
    
    seed_match <- apply(pairs,1,function(p){
      
      condition <- length(intersect(p,target)) == 2
      
      ifelse(condition,"yes","no")
      
    })
    
    df <- data.frame(pairs,miRNA=x,seed_match)   
    
  })
  
  df_tmp <- rbindlist(list)  
  
  triplets <- merge(triplets, df_tmp, by = c("ceRNA1","ceRNA2","miRNA"), all.x = T)
  
  return(triplets)
}