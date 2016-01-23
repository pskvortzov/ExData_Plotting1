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

png('plot2.png')

plot(powerData$datetime, 
     powerData$Global_active_power, 
     type = 'l',
     main = '',
     xlab = '',
     ylab = 'Global Active Power (kilowatts)')

dev.off()
