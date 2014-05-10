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

## Plot Global Active Power Line Graph
png(filename = "plot2.png")
plot(data$DateTime, data$Global_active_power,
     type="l",
     ylab="Global Active Power (killowats)",
     xlab="")
dev.off()
