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

# PLOT 2
plot(subsetdata$Global_active_power~datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# SAVE FILE
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

# FREE MEMORY
rm(subsetdata)
rm(datetime)
