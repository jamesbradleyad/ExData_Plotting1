#read in data
df <-read.csv('household_power_consumption.txt',sep =';',na.strings="?")
#subset on string dates
df1 <- df[df$Date == '1/2/2007' | df$Date == '2/2/2007',]
#create datatime object
df1$Datetime <-strptime(paste(df1$Date, df1$Time, sep = " "),format = '%d/%m/%Y %H:%M:%S')
#create png file
png(file="plot4.png", width=480, height=480)

par(mfrow=c(2,2))

#top left
plot(df1$Datetime,df1$Global_active_power, xlab="", ylab= 'Global Active Power (kilowatts)', type='l')

#top right
plot(df1$Datetime,df1$Voltage, xlab="datetime", ylab= 'Voltage', type='l')

#bottom left
plot(df1$Datetime,df1$Sub_metering_1, xlab="", ylab= 'Energy Sub Metering', type='l')
lines(df1$Datetime,df1$Sub_metering_2,col="red")
lines(df1$Datetime,df1$Sub_metering_3,col="blue")
legend('topright',
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'),
       lty='solid', bty='n')

#bottom right
plot(df1$Datetime,df1$Voltage, xlab="datetime", ylab= 'Global_reactive_power', type='l')

#close png file
dev.off()


