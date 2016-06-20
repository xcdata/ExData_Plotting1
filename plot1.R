df <- read.table('household_power_consumption.txt', sep = ';', head = T, na.string = '?')
df$Date <- as.Date(df$Date, format = '%d/%m/%Y')
df2 <- subset(df, Date >= '2007-02-01' & Date <= '2007-02-02')
df2$datetime = strptime(paste(df2$Date, df2$Time), format = '%Y-%m-%d %H:%M:%S')

png('plot1.png', w = 480, h = 480)
hist(df2$Global_active_power, col = 'red', xlab = 'Global_active_power (in kilowatts)', main = NA)
dev.off()

