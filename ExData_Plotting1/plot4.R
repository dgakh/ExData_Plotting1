# coursera, Exploratory Data Analysis, Project 1
# plot4.R
# written by Dmitriy Gakh

# Set colClasses to have necessary classes
v_colclasses <- c(rep("character", 2), rep("numeric", 7))

# Load data to variable data_set ( with column class set )
data_set <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = v_colclasses)

# Transform Date column to Date type
data_set$Date <- as.Date(data_set$Date, "%d/%m/%Y")

# Extract data for 2 days
ds_2days <- subset(data_set, Date >= as.Date('01/02/2007', format='%d/%m/%Y') & Date <= as.Date('02/02/2007', format='%d/%m/%Y') )

# Prepare Date + Time in Time column
ds_2days$Time <- strptime(paste(ds_2days$Date, ds_2days$Time), format = "%Y-%m-%d %H:%M:%S")

# Prepare png file
png("plot4.png", width = 480, height = 480)

# Plot
par(mfrow = c(2, 2))
with(ds_2days, {

  # Top-Left
  plot(Time, Global_active_power, type="l", main = "", xlab = "", ylab = "Global Active Power")

  # Top-Right
  plot(Time, Voltage, type="l", main = "", xlab = "datetime")
  
  # Bottom-Left
  plot(Time, Sub_metering_1, type="l", main = "", xlab = "", ylab = "Energy sub metering")
  lines(Time, Sub_metering_2, type="l",  col="red")
  lines(Time, Sub_metering_3, type="l",  col="blue")
  
  # Add legend ( to Bottom-Left )
  l_names <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" )
  legend('topright', l_names, lty=1, col=c("black", "red", "blue"), bty="n")
  
  # Bottom-Right
  plot(Time, Global_reactive_power, type="l", main = "", xlab = "datetime")
  
})

# Close png file
dev.off()

# Work done
"Done"
