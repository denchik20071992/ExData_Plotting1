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
png(filename='plots/plot3.png')

# plots
plot(data_sub$date.time, data_sub$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(data_sub$date.time, data_sub$Sub_metering_2, col='red')
lines(data_sub$date.time, data_sub$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty='solid')

#close the png
dev.off()
