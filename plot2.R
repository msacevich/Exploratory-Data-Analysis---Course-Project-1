#Exploratory Data Analysis - Course Project - Plot 2
#Melissa Sacevich 3/8/2020

#Load data
data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Format dates and subset data to dates 2007-02-01 and 2007-02-02
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

#formatting variables as numeric
Global_active_power <- as.numeric(data$Global_active_power)
Global_reactive_power <- as.numeric(data$Global_reactive_power)
Voltage <- as.numeric(data$Voltage)
Sub_metering_1 <- as.numeric(data$Sub_metering_1)
Sub_metering_2 <- as.numeric(data$Sub_metering_2)
Sub_metering_3 <- as.numeric(data$Sub_metering_3)

#Plot 2 - time series
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
plot(data$Global_active_power ~ data$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
