plot1 <- function(filename='~/Downloads/household_power_consumption.txt'){
  a <- read.csv(filename, na.strings='?', sep = ';')
  a$Date <- as.Date(a$Date, format='%d/%m/%Y')
  a <- a[a$Date == as.Date('2007-02-01') | a$Date == as.Date('2007-02-02'),]
  png("plot1.png", bg="transparent")
  hist(a$Global_active_power, xlim=c(0,6), col = 'red', xlab = 'Global Active Power (kilowatts)', main='Global Active Power')
  dev.off()
}