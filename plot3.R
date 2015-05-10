plot3 <- function(x= household_power_consumption){
  # this part is the some as plot1.R, should be omitted in the same enviroment
  household_power_consumption <- read.csv("C:/Users/admin/Desktop/coursera/household_power_consumption.txt", sep=";")
  mydata <- subset(household_power_consumption,household_power_consumption$Date=="1/2/2007"|household_power_consumption$Date=="2/2/2007")
  mydata <- cbind(mydata,exacttime=paste(mydata$Date, mydata$Time, sep=" "))
  mydata$exacttime <-  strptime(mydata$exacttime, format="%d/%m/%Y %H:%M:%S")
 
  png(filename="plot3.png",width=480,height=480)
  
  
plot(mydata$exacttime,as.numeric(as.character(mydata$Sub_metering_1)),type="l",xlab="",ylab="Energy Sub metering")
lines(mydata$exacttime,as.numeric(as.character(mydata$Sub_metering_2)),col="red")
lines(mydata$exacttime,as.numeric(as.character(mydata$Sub_metering_3)),col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), cex=.75, xjust=1)

dev.off()
}
