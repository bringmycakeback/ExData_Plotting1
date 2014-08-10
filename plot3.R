############
# plot3.R
#
# This file creates the third plot for Exploratory Data Analysis - Course Project 1
############


# Read in the dataset

main_df <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?", stringsAsFactors=FALSE)

# Subset two days of data, format date

main_df <- main_df[grepl("^[12]/2/2007", main_df$Date),]
main_df$date_time <- strptime(paste(main_df$Date, main_df$Time), format = "%d/%m/%Y %H:%M:%S")

# Create plot

png(filename = "plot3.png", width = 480, height = 480)

plot(main_df$date_time, main_df$Sub_metering_1, type="l", 
     xlab = "", ylab = "Energy sub metering")

lines(main_df$date_time, main_df$Sub_metering_2, col="red")
lines(main_df$date_time, main_df$Sub_metering_3, col="blue")

legend("topright", lty=1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
