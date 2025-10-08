#Calculate the mean of pollutant from all the id's

pollutantmean <- function(directory, pollutant, id = 1:332){
  count <- 0
  PolVal <- c()
  for(i in id){
    filename <- sprintf("%03d.csv", i)
    data <- read.csv(file.path(directory, filename))
    PolVal <- c(PolVal, data[[pollutant]])
  }
  means <- mean(PolVal, na.rm = TRUE)
  print(means)

}
