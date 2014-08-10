############
# plot2.R
#
# This file creates the second plot for Exploratory Data Analysis - Course Project 1
############


# Read in the dataset

main_df <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?", stringsAsFactors=FALSE)

# Subset two days of data, format date

main_df <- main_df[grepl("^[12]/2/2007", main_df$Date),]
main_df$date_time <- strptime(paste(main_df$Date, main_df$Time), format = "%d/%m/%Y %H:%M:%S")

# Create plot

png(filename = "plot2.png", width = 480, height = 480)

plot(main_df$date_time, main_df$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     main = "")

dev.off()
