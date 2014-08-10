############
# plot1.R
#
# This file creates the first plot for Exploratory Data Analysis - Course Project 1
############


# Read in the dataset

main_df <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?", stringsAsFactors=FALSE)

# Subset two days of data

main_df <- main_df[grepl("^[12]/2/2007", main_df$Date),]

# Create plot

png(filename = "plot1.png", width = 480, height = 480)

hist(main_df$Global_active_power, 
     xlab="Global Active Power (kilowatts)", 
     ylim=c(0, 1200), 
     col="red", 
     main = "Global Active Power")

dev.off()
