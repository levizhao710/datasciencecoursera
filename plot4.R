plot4 <-function(x= household_power_consumption){
  # this part is the some as plot1.R, should be omitted in the same enviroment
household_power_consumption <- read.csv("C:/Users/admin/Desktop/coursera/household_power_consumption.txt", sep=";")
mydata <- subset(household_power_consumption,household_power_consumption$Date=="1/2/2007"|household_power_consumption$Date=="2/2/2007")
mydata <- cbind(mydata,exacttime=paste(mydata$Date, mydata$Time, sep=" "))
mydata$exacttime <-  strptime(mydata$exacttime, format="%d/%m/%Y %H:%M:%S")

png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2,2))
with(mydata,{
  plot(x=mydata$exacttime, y=as.numeric(as.character(mydata$Global_active_power)),xlab="",ylab="Global Active Power(kilowatts)",type="l")
  plot(mydata$exacttime,as.numeric(as.character(mydata$Voltage)),xlab="datetime",ylab="Voltage",type="l")
  plot(mydata$exacttime,as.numeric(as.character(mydata$Sub_metering_1)),type="l",xlab="",ylab="Energy Sub metering")
  lines(mydata$exacttime,as.numeric(as.character(mydata$Sub_metering_2)),col="red")
  lines(mydata$exacttime,as.numeric(as.character(mydata$Sub_metering_3)),col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), cex=.75, xjust=0.3,yjust=.5,x.intersp=.5,y.intersp=.5,bty="n")
  plot(mydata$exacttime,as.numeric(as.character(mydata$Global_reactive_power)),xlab="datetime",ylab="Global_reactive_power",type="l")
})


dev.off()
}
