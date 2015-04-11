# RETRIEVE DATA
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# SET DATE
rawdata$Date <- as.Date(rawdata$Date, format="%d/%m/%Y")

# SUBSET DATA
subsetdata <- subset(rawdata, rawdata$Date >= "2007-02-01" & rawdata$Date <= "2007-02-02")

# FREE MEMORY
rm(rawdata)

# COMBINE DATE & TIME
datetime = as.POSIXct(paste(subsetdata$Date, subsetdata$Time), format="%Y-%m-%d %H:%M:%S")

# SET MARGIN
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

# PLOT 4A
plot(subsetdata$Global_active_power~datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# PLOT 4B
plot(subsetdata$Voltage~datetime, type="l", ylab="Voltage")

# PLOT 4C
plot(subsetdata$Sub_metering_1~datetime, type="l", ylab="Energy sub metering", xlab="")
lines(subsetdata$Sub_metering_2~datetime, col="Red")
lines(subsetdata$Sub_metering_3~datetime, col="Blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# PLOT 4D
plot(subsetdata$Global_reactive_power~datetime, type="l", ylab="Global_reactive_power")

# SAVE FILE
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

# FREE MEMORY
rm(subsetdata)
