## This code is for creating plots using the household power consumption
## data as part of the exploratory data analysis class week 1 assignment

## Read in data
## This data is being read locally from a absolute location
## and you will need to update this if you wish to use this
#file_loc <- "C:/Users/Prasun Ltop/Documents/My R/ExData_Plotting1/household_power_consumption/household_power_consumption.txt"
#plot_data <- read.csv2(file_loc, na.strings = "?")

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
png("plot4.png")

## Set up the plot to have 2 columns and 2 rows
## filling rows first
par(mfcol=c(2,2))

## First plot (row = 1, col = 1)
plot(date_time,
     as.numeric(as.character(plot_data_sub$Global_active_power)),
     type = "l",
     xlab = "",
     ylab="Global Active Power(kilowatts)"
)

## Second plot (row = 2, col = 1)
plot(date_time,
     as.numeric(as.character(plot_data_sub$Sub_metering_1)),
     type = "l",
     xlab = "",
     ylab="Global Active Power(kilowatts)"
)
lines(date_time,
      as.numeric(as.character(plot_data_sub$Sub_metering_2)),
      type = "l",
      col="red"
)
lines(date_time,
      as.numeric(as.character(plot_data_sub$Sub_metering_3)),
      type = "l",
      col="blue"
)
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty=c(1,1,1), cex = 0.5, ncol=1
)

## Third plot (row = 1, col = 2)
plot(date_time,
     as.numeric(as.character(plot_data_sub$Voltage)),
     type = "l",
     xlab = "datetime",
     ylab="Voltage"
)

## Fourth plot (row = 2, col = 2)
plot(date_time,
     as.numeric(as.character(plot_data_sub$Global_reactive_power)),
     type = "l",
     xlab = "datetime",
     ylab="Global_reactive_power"
)

dev.off(dev.cur())