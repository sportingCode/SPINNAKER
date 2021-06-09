statisticalAnalysis <- function(pairs,triplets,ceRNA,miRNAtarget){
  
  ceRNA <- removeNoTarget(ceRNA,miRNAtarget)
  
  # universe: highly correlated pairs (rho > thr)
  u <- nrow(pairs)
  
  mir_common <- intersect(unique(ceRNA$miRNA),names(miRNAtarget))

  list <- lapply(mir_common, function(m){
    
    ind <- which(triplets$miRNA == m)
    triplets_mir <- triplets[ind,]
    
    found_yes <- which(triplets_mir$seed_match == "yes")
    
    df <- NULL
    
    if( length(found_yes) > 0 ){
      
      # property: highly correlated pairs with the binding site for that mir
      pairs_property <- triplets_mir[found_yes,c("ceRNA1","ceRNA2","miRNA")]
      k <- nrow(pairs_property)
      
      # selection: highly correlated pairs with sensitivity > thr for that mir
      pairs_selection <- ceRNA[ceRNA$miRNA == m,c("ceRNA1","ceRNA2","miRNA")]
      s <- nrow(pairs_selection)
      
      pairs_intersection <- merge(pairs_property, pairs_selection, 
                                  by = c("ceRNA1","ceRNA2","miRNA"), all = F)
      x <- nrow(pairs_intersection)
      
      n <- u - k
      
      p_value <- sum(dhyper(x:s,k,n,s))
      
      if (nrow(pairs_intersection) > 0){
        df <- data.frame(pairs_intersection, p_value = p_value, 
                         check.names = F, row.names = NULL)
      }else{
        df <- NULL
      }
    }
    
    return(df)
  })
  
  df <- rbindlist(list)
  
  if(nrow(df) > 0){
    
    ceRNA_pval <- merge(ceRNA, df, by = c("ceRNA1","ceRNA2","miRNA"), all = F)
    
  }else{
    
    ceRNA_pval <- NULL

  }
  
  return(ceRNA_pval)
}