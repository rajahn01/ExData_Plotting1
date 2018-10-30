getwd()
setwd("OneDrive/Coursera/Data")
data<-read.csv("household_power_consumption.txt", header=TRUE, sep=";")
library(dplyr)

# Create a new data frame which only includes the first two days of February 2007
graphData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(graphData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off() 

