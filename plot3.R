#loads needed libraries
library(tidyverse)

#loads data
source("data_load.R")

#Sets locale to english, to ensure x axis day names are properly plotted
Sys.setlocale(category = "LC_ALL", locale = "English")

#creates datetime mariable to group day and time, and arrange it
data$datetime <- as.POSIXct(paste(data$Date, data$Time))
data <- arrange(data, datetime)

#sets device to png, using given sizes
png(filename = "plot2.png",
    width = 480, 
    height = 480, 
    units = "px")

#plots graphic
plot(data$datetime, data$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     col = "black")
lines(data$datetime, data$Sub_metering_2,
      col = "red",
      pch = 15)
lines(data$datetime, data$Sub_metering_3,
      col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),
       lty = 1 )

#turns of device (save plot)
dev.off()