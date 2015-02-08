plot2 <- function(filename='~/Downloads/household_power_consumption.txt'){
  a <- read.csv(filename, na.strings='?', sep = ';')
  a$Date <- as.Date(a$Date, format='%d/%m/%Y')
  a <- a[a$Date == as.Date('2007-02-01') | a$Date == as.Date('2007-02-02'),]
  a$Date <- strptime( paste(a$Date, a$Time), format = '%Y-%m-%d %H:%M:%S')
  png("plot2.png", bg="transparent")
  plot(a$Date, a$Global_active_power ,xlab=NA, ylab = 'Global Active Power (kilowatts)', type='l')
  dev.off()
}