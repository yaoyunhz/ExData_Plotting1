#plot4
library(lubridate)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

data$Date <- dmy(data$Date)
data <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"), ]
data$datetime <- paste(data$Date, data$Time)
data$datetime <- ymd_hms(data$datetime)

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))

#four plots
dev.new(width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(5, 5, 2, 1))

##plot1
with(data, 
     plot(datetime, Global_active_power, 
          type = "l", ylab = "Global Active Power"))

##plot2
with(data, 
     plot(datetime, Voltage,
          type = "l", ylab = "Voltage"))

##plot3
with(data, plot(datetime, Sub_metering_1, type = "n", 
                ylab = "Engergy sub metering", xlab = ""))
with(data, lines(datetime, Sub_metering_1, col = "black"))
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, cex = 0.8, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##plot4
with(data,
     plot(datetime, Global_reactive_power, 
          type = "l", ylim = c(0, 0.5)))

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
