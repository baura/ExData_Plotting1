library("lubridate")
cons<-read.table("household_power_consumption.txt", header=T, sep=";")
cons$Date<-dmy(cons$Date)
rightyear<-subset(cons, year(Date)==2007)
rightmonth<-subset(rightyear, month(Date)==2)
rightdays<-subset(rightmonth, day(Date)==1 | day(Date)==2)
rightdays$Time<-hms(rightdays$Time)
rightdays$Sub_metering_1<-as.numeric(levels(rightdays$Sub_metering_1))[rightdays$Sub_metering_1]
rightdays$Sub_metering_2<-as.numeric(levels(rightdays$Sub_metering_2))[rightdays$Sub_metering_2]
rightdays$Sub_metering_3<-as.numeric(levels(rightdays$Sub_metering_3))[rightdays$Sub_metering_3]
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,
    type = "quartz")
with(rightdays,plot(1:2880, Sub_metering_1, type="l", xaxt='n', yaxt='n',  ylab="Energy sub metering", xlab=''))
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
axis(2, at= c(0,10,20,30), labels=c(0,10,20,30))
points(1:2880, rightdays$Sub_metering_2, type="l", col="red")
points(1:2880, rightdays$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c("solid","solid", "solid"), col= c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
