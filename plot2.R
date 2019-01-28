#plot2
library(lubridate)

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- dmy(data$Date)
data <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"), ]
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

data$day <- paste(data$Date, data$Time)
data$day <- ymd_hms(data$day)

dev.new(width = 480, height = 480)
with(data, 
     plot(day, Global_active_power, 
          type = "l", ylab = "Global Active Power (kilowatts)"))

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()