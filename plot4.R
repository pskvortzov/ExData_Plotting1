## Reading the data for two dates (2007-02-01 and 2007-02-02)

powerData <- read.table('household_power_consumption.txt', 
                        sep = ';', 
                        skip = 66637, 
                        nrows = 2880,
                        col.names = c("Date",
                                      "Time",
                                      "Global_active_power",
                                      "Global_reactive_power",
                                      "Voltage",
                                      "Global_intensity",
                                      "Sub_metering_1",
                                      "Sub_metering_2",
                                      "Sub_metering_3"
                        )
)

## Add datetime column to the dataset
powerData$datetime <- strptime(paste(powerData$Date, powerData$Time), '%d/%m/%Y %H:%M')


## Make the plot and save it to a .png file

png('plot4.png')

par(mfrow = c(2, 2))

plot(powerData$datetime, 
     powerData$Global_active_power, 
     type = 'l',
     main = '',
     col = 'black',
     xlab = '',
     ylab = 'Global Active Power')

plot(powerData$datetime, 
     powerData$Voltage, 
     type = 'l',
     main = '',
     col = 'black',
     xlab = 'datetime',
     ylab = 'Voltage')

plot(powerData$datetime, 
     powerData$Sub_metering_1, 
     type = 'l',
     main = '',
     col = 'black',
     xlab = '',
     ylab = 'Energy sub metering')

lines(powerData$datetime, 
      powerData$Sub_metering_2, 
      col = 'red')

lines(powerData$datetime, 
      powerData$Sub_metering_3, 
      col = 'blue')

legend("topright", 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col = c('black', 'red', 'blue'), 
       lwd = 1,
       bty = 'n')

plot(powerData$datetime, 
     powerData$Global_reactive_power, 
     type = 'l',
     main = '',
     col = 'black',
     xlab = 'datetime',
     ylab = 'Global_reactive_power')

dev.off()
