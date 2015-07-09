#assign a library and read the data
library(lubridate)
data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=';', na.strings='?', colClasses=c(rep('character', 2), rep('numeric', 7)))

# Convert dates and times
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

# data manipulation
start <- ymd('2007-02-01')
end <- ymd('2007-02-02')
data_sub <- subset(data, year(Date) == 2007 & month(Date) == 2 & (day(Date) == 1 | day(Date) == 2))
data_sub$date.time <- data_sub$Date + data_sub$Time
#plots
png(filename='plots/plot2.png')
plot(data_sub$date.time, data_sub$Global_active_power, ylab='Global Active Power (kilowatts)', xlab='', type='l')

#close the png
dev.off()
