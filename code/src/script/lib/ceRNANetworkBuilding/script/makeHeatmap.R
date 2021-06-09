makeHeatmap <- function(mir,pairs,filename_heatmap){
  
  size <- 5000
  
  n_pairs <- length(pairs)
  
  n_group <- floor(n_pairs/size)
  
  for(i in 1:n_group){
    
    start <- 1 + size * (i-1)
    end <- size * i
    
    mat <- sapply(pairs[start:end], function(x){ x$sensitivity })
    
    mat[mat<0] <- 0
    mat <- t(mat)
    colnames(mat) <- mir
    mat <-mat[,sort(colnames(mat))]
    
    filename_heatmap_i <- paste0(filename_heatmap,"_",i,".pdf")
    
    plotHeatmap(mat,filename_heatmap_i)
    
  }
}