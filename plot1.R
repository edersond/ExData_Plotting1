#loads data
source("data_load.R")

#sets device to png, using given sizes
png(filename = "plot1.png",
    width = 480, 
    height = 480, 
    units = "px")

#plots histogram
hist(as.numeric(data$Global_active_power),
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylim = c(0,1200))

#turns of device (save plot)
dev.off()

