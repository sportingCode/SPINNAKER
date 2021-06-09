computeSensitivity <- function(pairs_xy,rho_xz,rho_yz,filename_heatmap){
  
  z <- colnames(rho_xz)
  
  list <- apply(pairs_xy,1,function(pair){
    
    x <- pair[1]
    y <- pair[2]
    rxy <- as.numeric(pair[3])
    
    rxz <- rho_xz[x,]
    ryz <- rho_yz[y,]
    
    pc <- ( rxy - (rxz * ryz) ) / ( sqrt(1 - rxz^2) * sqrt(1 - ryz^2) )
    
    s <- rxy - pc
    
    df <- data.frame(ceRNA1 = x, ceRNA2 = y, miRNA = z, 
                     correlation = rxy, partial_correlation = pc, 
                     sensitivity = s, row.names = NULL)
    
  })
  
  triplets <- rbindlist(list)
  
  makeHeatmap(z,list,filename_heatmap)
  
  return(triplets)
}