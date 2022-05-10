#set directory
setwd("C:/Users/tracy.lemieux/OneDrive - Government of Alberta/Documents/R/Coursera/Coursera Courses/Exploratory Data Analysis/")


library(data.table)

## Load Data
power<- read.delim("household_power_consumption.txt", skip = 1, sep = ";")
names(power)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                "Voltage", "Global_intensity", "Sub_metering_1", 
                "Sub_metering_2", "Sub_metering_3")
subpower<- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

## Plot 1
# print on screen
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
title(main="Global Active Power")

# save to file
png(file = "plot1.png", width=480, height=480)
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
title(main="Global Active Power")
dev.off()