##Read Csv file and then subset the date portion necessary 
household_power_consumption <- read.csv("C:/Users/Vivek/Desktop/DataScience/ExploratoryData/household_power_consumption.txt", sep=";")
PortionedData<-subset(household_power_consumption,Date %in% c("1/2/2007","2/2/2007"))

##convert variables to number class
GlobalActivePower<-as.numeric(PortionedData$Global_active_power)
submeter1<-as.numeric(PortionedData$Sub_metering_1)
submeter2<-as.numeric(PortionedData$Sub_metering_2)
submeter3<-as.numeric(PortionedData$Sub_metering_3)

##Format Date and time by and combine them together in one variable
datetime <- strptime(paste(PortionedData$Date, PortionedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##plot first line with axis and then add the next two lines via lines() function. legend added to topright with linetype=1
png("plot3.png",width=480,height = 480)
plot(datetime, submeter1, type="l", xlab="", ylab="Energy Submetering", col="black")
lines(datetime,submeter2,type = "l",col="red")
lines(datetime,submeter3,type = "l",col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()