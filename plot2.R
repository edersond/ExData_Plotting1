#loads needed libraries
library(tidyverse)

#loads data
source("data_load.R")

#Sets locale to english, to ensure x axis day names are properly plotted
Sys.setlocale(category = "LC_ALL", locale = "English")

#creates datetive mariable to group day and time, and arrange it
data$datetime <- as.POSIXct(paste(data$Date, data$Time))
data <- arrange(data, datetime)

#sets device to png, using given sizes
png(filename = "plot2.png",
    width = 480, 
    height = 480, 
    units = "px")

#plots graphic
plot(data$datetime, data$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

#turns of device (save plot)
dev.off()
