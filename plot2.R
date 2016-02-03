##Read Csv file and then subset the date portion necessary 
household_power_consumption <- read.csv("C:/Users/Vivek/Desktop/DataScience/ExploratoryData/household_power_consumption.txt", sep=";")
PortionedData<-subset(household_power_consumption,Date %in% c("1/2/2007","2/2/2007"))

##convert global active power variable to number class
GlobalActivePower<-as.numeric(PortionedData$Global_active_power)

##Format Date and time by and combine them together in one variable
datetime <- strptime(paste(PortionedData$Date, PortionedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Draw plot and use datetime variable as x and power as y. use type = 1 to make a line
png("plot2.png",width=480,height = 480)
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()