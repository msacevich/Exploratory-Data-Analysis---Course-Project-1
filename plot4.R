#Exploratory Data Analysis - Course Project - Plot 4
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

#Plot 4
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data, {
  plot(Global_active_power ~ data$Datetime, type = "l", 
       ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ data$Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ data$Datetime, type = "l", ylab = "Energy sub metering",
       xlab = "")
  lines(Sub_metering_2 ~ data$Datetime, col = 'Red')
  lines(Sub_metering_3 ~ data$Datetime, col = 'Blue')
  legend("topright", col=c("black","red","blue")
         , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
         , lty=c(1,1)
         , bty="n"
         , cex=.5) 
  
  plot(Global_reactive_power ~ data$Datetime, type = "l", 
       ylab = "Global_rective_power", xlab = "datetime")
})