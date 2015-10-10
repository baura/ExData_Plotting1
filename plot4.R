library("lubridate")
par(mfcol=c(2,2))
cons<-read.table("household_power_consumption.txt", header=T, sep=";")
cons$Date<-dmy(cons$Date)
rightyear<-subset(cons, year(Date)==2007)
rightmonth<-subset(rightyear, month(Date)==2)
rightdays<-subset(rightmonth, day(Date)==1 | day(Date)==2)
rightdays$Time<-hms(rightdays$Time)

#first plot, as plot 2
with(rightdays,plot(1:2880, Global_active_power, type="l", xaxt='n', yaxt='n', ylab="Global active Power", xlab=''))
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
axis(2, at= c(0,1000,2000,3000), labels=c(0,2,4,6))

#second plot, as plot 3
rightdays$Sub_metering_1<-as.numeric(levels(rightdays$Sub_metering_1))[rightdays$Sub_metering_1]
rightdays$Sub_metering_2<-as.numeric(levels(rightdays$Sub_metering_2))[rightdays$Sub_metering_2]
rightdays$Sub_metering_3<-as.numeric(levels(rightdays$Sub_metering_3))[rightdays$Sub_metering_3]
with(rightdays,plot(1:2880, Sub_metering_1, type="l", xaxt='n', yaxt='n',  ylab="Energy sub metering", xlab=''))
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
axis(2, at= c(0,10,20,30), labels=c(0,10,20,30))
points(1:2880, rightdays$Sub_metering_2, type="l", col="red")
points(1:2880, rightdays$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c("solid","solid", "solid"), col= c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.4)


#third plot
rightdays$Voltage<-as.numeric(levels(rightdays$Voltage))[rightdays$Voltage]
with(rightdays,plot(1:2880, Voltage, type="l", xaxt='n', yaxt='n',  ylab="Voltage", xlab="datetime"))
axis(1,  at=c(0,1440,2880), labels= c("Thu","Fri", "Sat"))
axis(2, at=c(234, 236, 238, 240, 242, 244, 246), labels=c(234,'', 238, '', 242, '', 246))

#fourth plot
rightdays$Global_reactive_power<-as.numeric(levels(rightdays$Global_reactive_power))[rightdays$Global_reactive_power]
with(rightdays,plot(1:2880, Global_reactive_power, type="l", xaxt='n', yaxt='n',  ylab="Global_reactive_power", xlab="datetime"))
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
axis(2, at= c(0,0.1, 0.2, 0.3, 0.4, 0.5), labels=c(0,0.1, 0.2, 0.3, 0.4, 0.5))
dev.copy(png,'plot4.png',width = 480, height = 480)
dev.off()

