
##Read Csv file and then subset the date portion necessary 
household_power_consumption <- read.csv("C:/Users/Vivek/Desktop/DataScience/ExploratoryData/household_power_consumption.txt", sep=";")
PortionedData<-subset(household_power_consumption,Date %in% c("1/2/2007","2/2/2007"))

##convert global active power variable to number so that histogram can be created
GlobalActivePower<-as.numeric(PortionedData$Global_active_power)

##creat histogram in png file format with specified dimensions and labels
png("plot1.png",width = 480,height = 480)
hist(GlobalActivePower,col = "red",main = "Global Active Power", xlab = "Global Active Power (killowats)")

##Turn off device to create plot
dev.off()