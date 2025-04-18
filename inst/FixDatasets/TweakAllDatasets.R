library(RJafroc)
rm(list = ls())

fileNames <- c("dataset01", "dataset02", "dataset03", "dataset04", "dataset05", "dataset06",
               "dataset07", "dataset08", "dataset09", "dataset10", "dataset11", "dataset12",
               "dataset13", "dataset14", 
               "datasetBinned123", "datasetBinned124", "datasetBinned125",
               "datasetCadLroc", "datasetCadSimuFroc", 
               "datasetX",
               "datasetDegenerate", "TBD", "datasetROI")

dataTypes <- c("FROC", "ROC", "ROC", "FROC", "FROC", "FROC",
               "FROC", "ROC", "ROC", "ROC", "FROC", "ROC",
               "FROC", "ROC", "ROC", "ROC", "ROC", "LROC", 
               "FROC", "FROC", "ROC", "FROC", "ROI")

design <- rep("FCTRL", length(fileNames))
design[20] <- "FCTRL-X-MOD"
design[22] <- "TBD"

dataNames <- c("TONY", "VAN-DYKE", "FRANKEN", "FEDERICA", "THOMPSON", "MAGNUS",
               "LUCY-WARREN", "PENEDO", "NICO-CAD-ROC", "RUSCHIN", "DOBBINS-1", "DOBBINS-2",
               "DOBBINS-3", "FEDERICA-REAL-ROC", 
               "SIM-CORCBM-SEED-123", 
               "SIM-CORCBM-SEED-124", 
               "SIM-CORCBM-SEED-125",
               "NICO-CAD-LROC", 
               "SIM-CAD-FROC", 
               "THOMPSON-X-MOD",
               "SIM-DEGENERATE", 
               "SIM-FROC-TBD", 
               "SIM-ROI")

df <- data.frame(fileNames = fileNames,
                 dataTypes = dataTypes,
                 design = design,
                 dataNames = dataNames,
                 stringsAsFactors = FALSE)

writeFile <- T

for (i in 1:length(df[,1])) {
  if (i != 22) next 
  cat(sprintf("fixing  %s\n", df[i,1]))
  x <- get(df[i,1])
  df[i,1] <- paste0(df[i,1],"C")
  
  ratings <- x$ratings
  lesions <- x$lesions
  descriptions <- x$descriptions
  descriptions$name <- "SIM-FROC-TBD"
  descriptions$design <- "TBD"
  descriptions$fileName <- "TBD"

  x <- list(ratings = ratings,
            lesions = lesions,
            descriptions = descriptions)
  
  assign(df[i,1],x)
  
  rm(x)
  
  fn <- paste0("~/GitHub/RJafroc/data/", df[i,1], ".RData")
  if (writeFile) save(list = df[i,1], file = fn)
  
}

# clean up for good display in Environment Panel
rm(list = c("lesions", "ratings", "descriptions", "dataNames",
            "dataTypes", "design", "fileNames", "fn",
            "i", "writeFile", "df"))



