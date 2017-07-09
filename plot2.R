## This code is for creating plots using the household power consumption
## data as part of the exploratory data analysis class week 1 assignment

## Read in data
## This data is being read locally from a absolute location
## and you will need to update this if you wish to use this
file_loc <- "C:/Users/Prasun Ltop/Documents/My R/ExData_Plotting1/household_power_consumption/household_power_consumption.txt"
plot_data <- read.csv2(file_loc, na.strings = "?")

## Subset data based on dates. We are only using data from the dates 
## 2007-02-01 and 2007-02-02
plot_data_sub <- subset(plot_data, (
  (as.Date(Date, format='%d/%m/%Y') >= "2007-02-01") &
    (as.Date(Date, format='%d/%m/%Y') <= "2007-02-02") )
)

## convert date and time from char class to be of POSIXct class
date_time<-strptime(paste(plot_data_sub$Date,plot_data_sub$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
## Plot histogram of global active power
## save as png. Defaults are already 480x480px
png("plot2.png")
plot(date_time,
     as.numeric(as.character(plot_data_sub$Global_active_power)),
     type = "l",
     xlab = "",
     ylab="Global Active Power(kilowatts)"
     )
dev.off(dev.cur())
