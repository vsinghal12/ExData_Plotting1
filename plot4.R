##Read Csv file and then subset the date portion necessary 
household_power_consumption <- read.csv("C:/Users/Vivek/Desktop/DataScience/ExploratoryData/household_power_consumption.txt", sep=";")
PortionedData<-subset(household_power_consumption,Date %in% c("1/2/2007","2/2/2007"))

##convert variables to number class
GlobalActivePower<-as.numeric(PortionedData$Global_active_power)
submeter1<-as.numeric(PortionedData$Sub_metering_1)
submeter2<-as.numeric(PortionedData$Sub_metering_2)
submeter3<-as.numeric(PortionedData$Sub_metering_3)
voltage<-as.numeric(PortionedData$Voltage)
GlobalReactivePower<-as.numeric(PortionedData$Global_reactive_power)

##Format Date and time by and combine them together in one variable
datetime <- strptime(paste(PortionedData$Date, PortionedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Set parameters so that 4 graphs can be fitted onto one output. Print by column
png("plot4.png",width=480,height = 480)
par(mfcol=c(2,2))

##Plot Date to Global Active Power
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##Plot Date to Submetering
plot(datetime, submeter1, type="l", xlab="", ylab="Energy Submetering", col="black")
lines(datetime,submeter2,type = "l",col="red")
lines(datetime,submeter3,type = "l",col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

##Plot Date to Voltage
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

##Plot Date to Global Reactive Power
plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

##Close png device
dev.off()