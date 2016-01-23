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

## Make the plot and save it to a .png file

png('plot1.png')

hist(powerData$Global_active_power, 
     col = 'red', 
     main = 'Global active power', 
     xlab = 'Global active power (kilowatts)')

dev.off()