#read in data
df <-read.csv('household_power_consumption.txt',sep =';',na.strings="?")
#subset on string dates
df1 <- df[df$Date == '1/2/2007' | df$Date == '2/2/2007',]
#create png file
png(file="plot1.png", width=480, height=480)
#plot hist
hist(df1$Global_active_power, main= 'Global Active Power', xlab= 'Global Active Power (kilowatts)', col="Red")
#close png file
dev.off()

