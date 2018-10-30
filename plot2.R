getwd()
setwd("OneDrive/Coursera/Data")
data<-read.csv("household_power_consumption.txt", header=TRUE, sep=";")
library(dplyr)
data$x<as.character(data$Date)
graphData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(graphData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off() 


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


## Create column in table with date and time merged together
TimeDatevar <- strptime(paste(graphData$Date, graphData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
graphData <- cbind(graphData, TimeDatevar)


png("plot2.png", width=480, height=480)
with(subsetdata, plot(FullTimeDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()





library ("lubridate")