rm(list = ls())
df <- read.table("C:\\Users\\vadisheshan\\Desktop\\Data Scientist\\Course 4\\data\\household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") ##na.strings
df$date2<- as.Date(df$Date,format = "%d/%m/%Y")
dff <- subset(df,date2>="2007-02-01" & date2<="2007-02-02")
dff$datetime <- as.POSIXct(paste(dff$date2, dff$Time))
dff$Global_active_power <- as.numeric(dff$Global_active_power)

par(mfrow = c(1,1))
hist(as.numeric(dff$Global_active_power),xlab = "Global Active Power (kilowatts)", col = "red",main = "Global Active Power")
dev.copy(png,"C:\\Users\\vadisheshan\\Desktop\\Data Scientist\\Course 4\\ExData_Plotting1\\plot1.png", height=480, width = 480)
dev.off()
