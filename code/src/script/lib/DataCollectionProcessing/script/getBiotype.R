getBiotype <- function(gene_symbol){
  
  ########################################
  # Query NCBI
  
  fileURL <- "https://ftp.ncbi.nlm.nih.gov/gene/DATA/GENE_INFO/Mammalia/Homo_sapiens.gene_info.gz"
  destfile <- "Homo_sapiens_gene_info.txt.gz"
  download.file(fileURL, destfile, method="auto")
  gunzip(destfile)
  filename <- gsub(".gz", "", destfile)
  
  NCBI_gene_info <- read.table(filename, sep ="\t", quote = "", header = T, 
                               stringsAsFactors = F, comment.char = "", check.names = F)
  
  file.remove(filename)
  ########################################
  
  df_gene_symbol <- data.frame(Symbol = gene_symbol)
  
  df <- merge(df_gene_symbol, NCBI_gene_info, by = "Symbol", all.x = TRUE, sort = F)

  # class <- data.frame(table(df$type_of_gene))
  
  res <- df[,c("Symbol","type_of_gene")]
  
  return(res)
}