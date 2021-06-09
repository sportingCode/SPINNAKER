computeCorrelation <- function(data1,data2){
  
  dim_min <- min(nrow(data1),nrow(data2),2000)
  
  size <- round_any(dim_min, 100, f = floor)
  
  rho <- bigcor(t(data1), t(data2), size = size, fun = "cor", 
                verbose = F, use = "pairwise.complete.obs")
  
  rho <- rho[1:nrow(data1), 1:nrow(data2)]
  rownames(rho) <- rownames(data1)
  colnames(rho) <- rownames(data2)
  
  return(rho)
}

