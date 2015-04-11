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

# PLOT 3
plot(subsetdata$Sub_metering_1~datetime, type="l", ylab="Energy sub metering", xlab="")
lines(subsetdata$Sub_metering_2~datetime, col="Red")
lines(subsetdata$Sub_metering_3~datetime, col="Blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# SAVE FILE
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

# FREE MEMORY
rm(subsetdata)
