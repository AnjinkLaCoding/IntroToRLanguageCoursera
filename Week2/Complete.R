#A function to count how many rows that both sulfate and nitrate value is not NaN

complete <- function(directory, id = 1:332){
  data_matrix <- matrix(nrow = length(id), ncol = 2)
  num_id <- c()
  num_nobs <- c()
  for(i in id){
    filename <- sprintf("%03d.csv", i)
    data <- read.csv(file.path(directory, filename))
    num_id <- c(num_id, i)
    num_nobs <- c(num_nobs, sum(!is.na(data[["nitrate"]]) & !is.na(data[["sulfate"]])))
  }
  dataframe <- data.frame(num_id, num_nobs)
  return(dataframe)

}
