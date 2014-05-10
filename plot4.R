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

png(filename = "plot4.png")

# Setup for 2 x 2 graphs
par(mfcol = c(2,2))

## Plot Global Active Power in upper left
plot(data$DateTime, data$Global_active_power,
     type="l",
     ylab="Global Active Power",
     xlab="")

## Plot Sub Metering in lower left
plot(data$DateTime, data$Sub_metering_1,
     type="l",
     ylab="Energy Sub Metering",
     xlab="")
lines(data$DateTime, data$Sub_metering_2,
      col="red")
lines(data$DateTime, data$Sub_metering_3,
      col="blue")

## Plot Voltage in lower right
plot(data$DateTime, data$Voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime")

## Plot Global Reactive Power in lower right
plot(data$DateTime, data$Global_reactive_power,
     type="l",
     ylab="Global Reactive Power",
     xlab="datetime")

dev.off()
