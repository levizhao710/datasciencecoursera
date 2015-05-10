plot1 <- function(x= household_power_consumption){
  
#read from txt file
household_power_consumption <- read.csv("C:/Users/admin/Desktop/coursera/household_power_consumption.txt", sep=";")
#extract data of the 2 days
mydata <- subset(household_power_consumption,household_power_consumption$Date=="1/2/2007"|household_power_consumption$Date=="2/2/2007")
#combine Date and Time
mydata <- cbind(mydata,exacttime=paste(mydata$Date, mydata$Time, sep=" "))
# change the datetime variable into Date variable
mydata$exacttime <-  strptime(mydata$exacttime, format="%d/%m/%Y %H:%M:%S")
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
#plot and output as png
png(filename="plot1.png", width=480,height=480)
hist(as.numeric(as.character(mydata$Global_active_power)), xlab="Global Active Power (kilowatts)", col="red",main="Global Active Power")
dev.off()
}

