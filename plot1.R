library("lubridate")
cons<-read.table("household_power_consumption.txt", header=T, sep=";")
cons$Date<-dmy(cons$Date)
rightyear<-subset(cons, year(Date)==2007)
rightmonth<-subset(rightyear, month(Date)==2)
rightdays<-subset(rightmonth, day(Date)==1 | day(Date)==2)
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,
    type = "quartz")
hist(x=as.numeric(rightdays$Global_active_power), xlab="Global active Power (kilowatts)", col="red", xaxt='n', main="Global Active Power")
axis(1,at=c(0,1000,2000,3000), labels= c(0,2,4,6))
dev.off()
