df <- read.table('household_power_consumption.txt', sep = ';', head = T, na.string = '?')
df$Date <- as.Date(df$Date, format = '%d/%m/%Y')
df2 <- subset(df, Date >= '2007-02-01' & Date <= '2007-02-02')
df2$datetime = strptime(paste(df2$Date, df2$Time), format = '%Y-%m-%d %H:%M:%S')

png('plot3.png', w = 480, h = 480)
plot(df2$datetime, df2$Sub_metering_1, type = 'l', xlab = NA, ylab = 'Sub_metering')
lines(df2$datetime, df2$Sub_metering_2, col = 'red')
lines(df2$datetime, df2$Sub_metering_3, col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = 1)
dev.off()

