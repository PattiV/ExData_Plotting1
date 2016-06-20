# Data Science Course 4: Exploratory Data Analysis
# Course Project 1: Electronic Power Consumption
# 6/19/16
# Plot 1 Histogram Global Active Power

#Set Working Directory and Unzip Data
setwd("C:/Users/patti/Documents/Exploratory HW1")
list.files()
unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")
list.files()

#Read in Data for the dates 2007-02-01 and 2007-02-02
# From Website: Measurements of electric power consumption in one household 
# with a one-minute sampling rate over a period of almost 4 years.
# There will still be a row even if data is missing for that date / time
# Thus can, use skip and nrows options to read in date subset
# 24 hours * 60 minutes = 1440 samples per day 
# 1440 samples per day * 2 = 2880 rows total

epc_data <- read.table("./household_power_consumption.txt",header=FALSE, sep=";", 
                       skip=(grep("1/2/2007",readLines("./household_power_consumption.txt"))-1),
                       nrows=2880,na.strings = "?", 
                       col.names=c("Date","Time","Global_active_power",
                       "Global_reactive_power","Voltage","Global_intensity",
                       "Sub_metering_1","Sub_metering_2","Sub_metering_3"))
head(epc_data)

#Create Histogram of Global Active Power, save as PNG file

hist(epc_data$Global_active_power,xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.print(png, file = "plot1.png", width = 480, height = 480)
dev.off()

