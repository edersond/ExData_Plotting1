library(zip)
library(tidyverse)

#downloads file from link given in exercise, unzips it in created folder, imports it to R then filter by exercise specified date.
data.load <- function() {
  #if project1_data folder does not existis, creates it under current working dir
  if(dir.exists("project1_data") == FALSE) {
    dir.create("project1_data")
  }
  
  #if file does not exists, download and unzip it
  if (file.exists("project1_data/power_consumption.zip") == FALSE) {
    file.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    file.destination <- "project1_data/power_consumption.zip"
    download.file(url = file.url, destfile = file.destination)
    unzip(zipfile = file.destination, overwrite = TRUE, exdir = "project1_data")
  }
  
  
  data <- read.table("project1_data/household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE)
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  data <- filter(data, Date %in% as.Date(c("2007-02-01", "2007-02-02")))
  return(data)
}
data <- data.load()