png(file="plot3.png",width=480,height=480)

df <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
df$Voltage <- as.numeric(as.character(df$Voltage))
df$Time <- paste(df$Date, df$Time)
df$Time <- strptime(x = df$Time, format = "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

sdf <- subset(df, Date>="2007-02-01" & Date<="2007-02-02")

with(sdf, plot(Time, Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab=""))
with(sdf, points(Time, Sub_metering_2, type="l", col="red"))
with(sdf, points(Time, Sub_metering_3, type="l", col="blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

dev.off()
