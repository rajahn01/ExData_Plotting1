#For the file to work the working directory where "household_power_consumption.txt" is saved should be specified using setwd()

#Read in my data
data<-read.csv("household_power_consumption.txt", stringsAsFactors=FALSE,header=TRUE, sep=";")

#Select the two days required for the assignment
graphData<-subset(data, Date=="1/2/2007"|Date=="2/2/2007")

#Create a variable which is time and date combined
TimeDatevar <- strptime(paste(graphData$Date, graphData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Add the new variable to my existing data frame
graphData <- cbind(graphData, TimeDatevar)

#Convert my data into useful formats
graphData$Date <- as.Date(graphData$Date, format="%d/%m/%Y")
graphData$Time <- format(graphData$Time, format="%H:%M:%S")
graphData$Global_active_power <- as.numeric(graphData$Global_active_power)
graphData$Global_reactive_power <- as.numeric(graphData$Global_reactive_power)
graphData$Voltage <- as.numeric(graphData$Voltage)
graphData$Global_intensity <- as.numeric(graphData$Global_intensity)
graphData$Sub_metering_1 <- as.numeric(graphData$Sub_metering_1)
graphData$Sub_metering_2 <- as.numeric(graphData$Sub_metering_2)
graphData$Sub_metering_3 <- as.numeric(graphData$Sub_metering_3)

#Plot the charts
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(graphData, plot(TimeDatevar, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(graphData, plot(TimeDatevar, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
with(graphData, plot(TimeDatevar, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(graphData$TimeDatevar, graphData$Sub_metering_2,type="l", col= "red")
lines(graphData$TimeDatevar, graphData$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
with(graphData, plot(TimeDatevar, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()




