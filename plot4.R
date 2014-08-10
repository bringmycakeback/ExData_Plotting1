############
# plot4.R
#
# This file creates the fourth plot for Exploratory Data Analysis - Course Project 1
############


# Read in the dataset

main_df <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?", stringsAsFactors=FALSE)

# Subset two days of data, format date

main_df <- main_df[grepl("^[12]/2/2007", main_df$Date),]
main_df$date_time <- strptime(paste(main_df$Date, main_df$Time), format = "%d/%m/%Y %H:%M:%S")

# Create plot, with 4 subplots

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# Subplot 1

plot(main_df$date_time, main_df$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     main = "")

# Subplot 2

plot(main_df$date_time, main_df$Voltage, 
     type="l", 
     xlab="datetime", 
     ylab="Voltage", 
     main = "")

# Subplot 3

plot(main_df$date_time, main_df$Sub_metering_1, type="l", 
     xlab = "", ylab = "Energy sub metering")

lines(main_df$date_time, main_df$Sub_metering_2, col="red")
lines(main_df$date_time, main_df$Sub_metering_3, col="blue")

legend("topright", lty=1, bty="n",
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Subplot 4

plot(main_df$date_time, main_df$Global_reactive_power, 
     type="l", 
     xlab="datetime", 
     ylab="Global_reactive_power", 
     main = "")

dev.off()
