#plot3
library(lubridate)

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- dmy(data$Date)
data <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"), ]
data$day <- paste(data$Date, data$Time)
data$day <- ymd_hms(data$day)

dev.new(width = 480, height = 480)
with(data, plot(day, Sub_metering_1, type = "n", 
                ylab = "Engergy sub metering", xlab = ""))
with(data, lines(day, Sub_metering_1, col = "black"))
with(data, lines(day, Sub_metering_2, col = "red"))
with(data, lines(day, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), cex = 0.7,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
