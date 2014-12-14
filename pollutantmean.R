## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)

pollutantmean <- function(directory, pollutant, id = 1:332) {
  setwd("C:/Coursera/R Programming/specdata")
  filenames <- sprintf("%03d.csv", id)
  filenames <- paste(directory, filenames, sep="/", header=TRUE)
  ldf <- lapply(filenames, read.csv)
  df=ldply(ldf)
  # df is list of data.frames
  mean(df[, pollutant], na.rm = TRUE)

}
