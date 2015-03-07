#read in data
df <-read.csv('household_power_consumption.txt',sep =';',na.strings="?")
#subset on string dates
df1 <- df[df$Date == '1/2/2007' | df$Date == '2/2/2007',]
#create datatime object
df1$Datetime <-strptime(paste(df1$Date, df1$Time, sep = " "),format = '%d/%m/%Y %H:%M:%S')
#create png file
png(file="plot2.png", width=480, height=480)
#plot line chart
plot(df1$Datetime,df1$Global_active_power, xlab="", ylab= 'Global Active Power (kilowatts)', type='l')
#close png file
dev.off()

