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
png(filename = "plot4.png",
    width = 480, 
    height = 480, 
    units = "px")

#sets parameter to row oriented, 2 rows and 2 cols
par(mfrow = c(2,2))

#plots graphic 1 - recycled from plot2.R
plot(data$datetime, data$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

#plots graphic 2
plot(data$datetime, data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

#plots graphic 3 - recycled from plot3.R
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
       lty = 1,
       bty = "n")

#plots graphi 4
plot(data$datetime, data$Global_reactive_power, 
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
