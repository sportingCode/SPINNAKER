getSource <- function(){
  
  # input
  source("src/script/input/config.R")
  source("src/script/input/inputFiles.R")
  
  # output
  source("src/script/output/outputDir.R")
  source("src/script/output/outputFiles.R")
  
  # lib
  
  # Data Collection & Processing
  source("src/script/lib/DataCollectionProcessing/DataCollectionProcessing.R")
  source("src/script/lib/DataCollectionProcessing/script/removeMissingValues.R")
  source("src/script/lib/DataCollectionProcessing/script/getBiotype.R")
  source("src/script/lib/DataCollectionProcessing/script/createDataCerna.R")
  source("src/script/lib/DataCollectionProcessing/script/getmiRNAtarget.R")
  source("src/script/lib/DataCollectionProcessing/script/queryTargetScan.R")
  source("src/script/lib/DataCollectionProcessing/script/querymiRWalk.R")

  # ceRNA network building
  source("src/script/lib/ceRNANetworkBuilding/ceRNANetworkBuilding.R")
  source("src/script/lib/ceRNANetworkBuilding/script/computeCorrelation.R")
  source("src/script/lib/ceRNANetworkBuilding/script/selectPairs.R")
  source("src/script/lib/ceRNANetworkBuilding/script/computeSensitivity.R")
  source("src/script/lib/ceRNANetworkBuilding/script/makeHeatmap.R")
  source("src/script/lib/ceRNANetworkBuilding/script/plotHeatmap.R")
  source("src/script/lib/ceRNANetworkBuilding/script/selectTriplets.R")
  source("src/script/lib/ceRNANetworkBuilding/script/searchSeedMatch.R")
  source("src/script/lib/ceRNANetworkBuilding/script/statisticalAnalysis.R")
  source("src/script/lib/ceRNANetworkBuilding/script/removeNoTarget.R")
  
  # save ceRNA network
  source("src/script/lib/saveNetwork.R")
  
  # save input parameters
  source("src/script/lib/saveParameters.R")
}
