###Exploratory Data Analysis - Peer Assessment 1

### Read data set and get a feel for the data
file <- read.table ("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)
str (file)


### Subset dataset for the 2 dates (Feb 1, 2007 & Feb 2, 2007)
file_a <- subset (file, Date == "1/2/2007")
file_b <- subset (file, Date == "2/2/2007")
work <- rbind (file_a, file_b)
str (work)


### Change the class for each variable, in order to make them "plottable". 
### Example: change class of "Voltage" variable to numeric.
work_1 <- strptime (paste (work$Date, work$Time), format = "%d/%m/%Y %H:%M:%S")
work_2 <- data.frame (cbind (GAP = as.numeric (work$Global_active_power),
				GRP = as.numeric (work$Global_reactive_power),
				Voltage = as.numeric (work$Voltage), 
				Global_Intensity = as.numeric (work$Global_intensity), 
				Sub_metering_1 = as.numeric (work$Sub_metering_1), 
				Sub_metering_2 = as.numeric (work$Sub_metering_2), 
				Sub_metering_3 = work$Sub_metering_3))
final <- cbind (Date_Time = work_1, work_2)
str (final)


### Create Plot 2
png (filename = "plot2.png", width = 480, height = 480)
plot (final$Date_Time, final$GAP, xlab = NA, ylab = "Global Active Power (kilowatts)", type = "n")
ranks <- order (final$Date_Time)
lines (final$Date_Time [ranks], final$GAP [ranks])
dev.off()
