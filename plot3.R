#Read in the data
data<-read.csv("household_power_consumption.txt", header=TRUE, sep=";")

#Select the data needed for the assignment
graphData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]




#Convert my data into useful formats

globalActivePower <- as.numeric(graphData$Global_active_power)
graphData$Date <- as.Date(graphData$Date, format="%d/%m/%Y")
graphData$Time <- format(graphData$Time, format="%H:%M:%S")
graphData$Global_active_power <- as.numeric(graphData$Global_active_power)
graphData$Global_reactive_power <- as.numeric(graphData$Global_reactive_power)
graphData$Voltage <- as.numeric(graphData$Voltage)
graphData$Global_intensity <- as.numeric(graphData$Global_intensity)
graphData$Sub_metering_1 <- as.numeric(graphData$Sub_metering_1)
graphData$Sub_metering_2 <- as.numeric(graphData$Sub_metering_2)
graphData$Sub_metering_3 <- as.numeric(graphData$Sub_metering_3)


## Create column in table with date and time merged together
TimeDatevar <- strptime(paste(graphData$Date, graphData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
graphData <- cbind(graphData, TimeDatevar)

##Plot the charts
png("plot3.png", width=480, height=480)
with(graphData, plot(TimeDatevar, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
lines(graphData$TimeDatevar, graphData$Sub_metering_2,type="l", col= "red")
lines(graphData$TimeDatevar, graphData$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()





library ("lubridate")
