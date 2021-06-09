plotHeatmap <- function(mat,filename_heatmap){
  
  my_color <- colorRampPalette(colors = c("red4","red","yellow","cyan","blue","blue4"))(100)
  
  pheatmap(mat, scale = "none",
           border_color = NA,
           clustering_distance_rows = "correlation",
           clustering_method = "complete",
           cluster_cols = F,
           cluster_rows = F,
           color = my_color,
           width = 15, height = 10,
           show_rownames = F,
           show_colnames = F,
           filename = filename_heatmap,
           fontsize = 5)
}