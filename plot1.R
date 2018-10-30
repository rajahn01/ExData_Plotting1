#Read in the data
data<-read.csv("household_power_consumption.txt", header=TRUE, sep=";")

# Create a new data frame which only includes the first two days of February 2007
graphData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert the variable to be plotted to a numerical value and plot it
globalActivePower <- as.numeric(graphData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off() 

