rm(list = ls())
df <- read.table("C:\\Users\\vadisheshan\\Desktop\\Data Scientist\\Course 4\\data\\household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") ##na.strings
df$date2<- as.Date(df$Date,format = "%d/%m/%Y")
dff <- subset(df,date2>="2007-02-01" & date2<="2007-02-02")
dff$datetime <- as.POSIXct(paste(dff$date2, dff$Time))
dff$Global_active_power <- as.numeric(dff$Global_active_power)

par(mfrow = c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(as.numeric(dff$Global_active_power)~dff$datetime, type = "l", ylab = "Global Active Power", xlab = "")
plot(as.numeric(dff$Voltage)~dff$datetime, type = "l", ylab = "Voltage", xlab = "datetime")
with(dff,{
    plot(as.numeric(Sub_metering_1)~datetime, type = "l", ylab = "Energy sub metering", xlab = "")
    lines(as.numeric(Sub_metering_2)~datetime,  col = "red")
    lines(as.numeric(Sub_metering_3)~datetime,  col = "blue")
})
legend("topright", col = c("black","red","blue"),lwd=c(1,1,1),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(as.numeric(dff$Global_reactive_power)~dff$datetime, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.copy(png,"C:\\Users\\vadisheshan\\Desktop\\Data Scientist\\Course 4\\ExData_Plotting1\\plot4.png", height=480, width=480)
dev.off()
