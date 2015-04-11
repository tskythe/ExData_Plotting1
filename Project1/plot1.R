# RETRIEVE DATA
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# SET DATE
rawdata$Date <- as.Date(rawdata$Date, format="%d/%m/%Y")

# SUBSET DATA
subsetdata <- subset(rawdata, rawdata$Date >= "2007-02-01" & rawdata$Date <= "2007-02-02")

# FREE MEMORY
rm(rawdata)

# PLOT 1
hist(subsetdata$Global_active_power, main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)", col="Red")

# SAVE FILE
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

# FREE MEMORY
rm(subsetdata)
