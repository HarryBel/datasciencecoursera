plot3 <- function(filename='~/Downloads/household_power_consumption.txt'){
  a <- read.csv(filename, na.strings='?', sep = ';')
  a$Date <- as.Date(a$Date, format='%d/%m/%Y')
  a <- a[a$Date == as.Date('2007-02-01') | a$Date == as.Date('2007-02-02'),]
  a$Date <- strptime( paste(a$Date, a$Time), format = '%Y-%m-%d %H:%M:%S')
  png("plot3.png", bg="transparent")
  plot(a$Date, a$Global_active_power ,xlab=NA, ylab = 'Energy sub metering', type='n', ylim = c(0, 40))
  points(a$Date,a$Sub_metering_1, type='l')
  points(a$Date,a$Sub_metering_2, type='l', col='red')
  points(a$Date,a$Sub_metering_3, type='l', col='blue')
  legend("topright", col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=c(1,1))
  dev.off()
}