#plot1
library(lubridate)

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- dmy(data$Date)
data <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"), ]
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

dev.new(width = 480, height = 480)
hist(data$Global_active_power,
     breaks = 12,
     ylim = c(0, 1200),
     col = "red", 
     main = "Global Active Power",
     xlab = "Glabal Active Power (kilowatts)")
axis(1, at = seq(0, 6, by = 2))

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
