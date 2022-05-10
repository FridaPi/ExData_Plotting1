#set directory
setwd("C:/Users/tracy.lemieux/OneDrive - Government of Alberta/Documents/R/Coursera/Coursera Courses/Exploratory Data Analysis/")

library(dplyr)
library(data.table)

## Load Data
power<- read.delim("household_power_consumption.txt", skip = 1, sep = ";")
names(power)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                "Voltage", "Global_intensity", "Sub_metering_1", 
                "Sub_metering_2", "Sub_metering_3")
subpower<- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")


subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# Plot2
# print to screen
plot(subpower$Time,as.numeric(as.character(subpower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time")

#save to file
png(file = "plot2.png", width=480, height=480)
plot(subpower$Time,as.numeric(as.character(subpower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time")
dev.off()