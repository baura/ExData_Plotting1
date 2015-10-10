library("lubridate")
cons<-read.table("household_power_consumption.txt", header=T, sep=";")
cons$Date<-dmy(cons$Date)
rightyear<-subset(cons, year(Date)==2007)
rightmonth<-subset(rightyear, month(Date)==2)
rightdays<-subset(rightmonth, day(Date)==1 | day(Date)==2)
rightdays$Time<-hms(rightdays$Time)
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,
    type = "quartz")
with(rightdays,plot(1:2880, Global_active_power, type="l", xaxt='n', yaxt='n', ylab="Global active Power (kilowatts)", xlab=''))
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
axis(2, at= c(0,1000,2000,3000), labels=c(0,2,4,6))
dev.off()
