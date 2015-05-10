plot2 <- function(x= household_power_consumption){
# this part is the some as plot1.R, should be omitted in the same enviroment
household_power_consumption <- read.csv("C:/Users/admin/Desktop/coursera/household_power_consumption.txt", sep=";")
mydata <- subset(household_power_consumption,household_power_consumption$Date=="1/2/2007"|household_power_consumption$Date=="2/2/2007")
mydata <- cbind(mydata,exacttime=paste(mydata$Date, mydata$Time, sep=" "))
mydata$exacttime <-  strptime(mydata$exacttime, format="%d/%m/%Y %H:%M:%S")           


png(filename="plot2.png", width=480, height=480)

plot(x=mydata$exacttime, y=as.numeric(as.character(mydata$Global_active_power)),xlab="",ylab="Global Active Power(kilowatts)",type="l")

dev.off()
}

