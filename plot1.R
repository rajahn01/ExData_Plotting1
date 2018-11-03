#For the file to work the working directory where "household_power_consumption.txt" is saved should be specified using setwd()

##Read in the data
data<-read.csv("household_power_consumption.txt", stringsAsFactors=FALSE, header=TRUE, sep=";")

# Create a new data frame which only includes the first two days of February 2007
graphData<-subset(data, Date=="1/2/2007"|Date=="2/2/2007")

#Convert the variable to be plotted to a numerical value
globalActivePower <- as.numeric(graphData$Global_active_power)

#Plot the chart
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off() 

