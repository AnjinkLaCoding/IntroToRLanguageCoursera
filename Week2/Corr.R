# To calculate the correlation between sulfate and nitrate for each id

corr <- function(directory, threshold = 0){
  dataframe <- complete(directory)
  correlation <- c()
  
  for(i in 1:nrow(dataframe)){
    if(dataframe[i,2] > threshold){
      filename <- sprintf("%03d.csv", dataframe[i,1])
      data <- read.csv(file.path(directory, filename))
      sul <- c(data[["sulfate"]])
      nit <- c(data[["nitrate"]])
      
      if(length(sul) > 0 && length(nit) > 0){
        correlation <- c(correlation, cor(sul, nit, use = "complete.obs"))
      }
    }
  }
  
  return(correlation)

}
