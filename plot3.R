## Exploratory Data Analysis
## Class Project 1
## May 2014
## Mark Grebe

## Read the data from the table
data <- read.table("household_power_consumption.txt",
                   header=FALSE, sep=";",
                   na.strings = "?",
                   colClasses = c("character","character","numeric"),
                   skip = 66637, nrows = 2880,
                   col.names = colnames(read.table(
                       "household_power_consumption.txt",
                       nrow = 1, header = TRUE, sep=";")))
## Create the date time object
data$DateTime <- paste(data$Date, data$Time)
data[[10]] <- strptime(data[[10]], 
                       "%d/%m/%Y %H:%M:%S")

# Setup for 1 x 1 graphs
par(mfcol = c(1,1))

## Plot Energy Sub Meeting
png(filename = "plot3.png")
## Plot sub metering 1
plot(data$DateTime, data$Sub_metering_1,
     type="l",
     ylab="Energy Sub Metering",
     xlab="")
## Plot sub metering 2 color red
lines(data$DateTime, data$Sub_metering_2,
      col="red")
## Plot sub metering 3 color blue
lines(data$DateTime, data$Sub_metering_3,
      col="blue")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       lwd=c(2.5,2.5,2.5),
       col=c("black","red","blue")) 

dev.off()
