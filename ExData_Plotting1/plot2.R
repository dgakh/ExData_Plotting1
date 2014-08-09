# coursera, Exploratory Data Analysis, Project 1
# plot2.R
# written by Dmitriy Gakh

# Load data to variable data_set ( simple way )
data_set <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Transform Date column to Date type
data_set$Date <- as.Date(data_set$Date, "%d/%m/%Y")

# Extract data for 2 days
ds_2days <- subset(data_set, Date >= as.Date('01/02/2007', format='%d/%m/%Y') & Date <= as.Date('02/02/2007', format='%d/%m/%Y') )

# Transform to numeric ( need transforming through as.character )
ds_2days$Global_active_power <- as.numeric(as.character(ds_2days$Global_active_power))

# Prepare Date + Time in Time column
ds_2days$Time <- strptime(paste(ds_2days$Date, ds_2days$Time), format = "%Y-%m-%d %H:%M:%S")

# Set X axis label
v_xlab <- ""

# Set Y axis label
v_ylab <- "Global Active Power (kilowatts)"

# Prepare png file
png("plot2.png", width = 480, height = 480)

# Plot
plot(ds_2days$Time, ds_2days$Global_active_power, type="l", xlab = v_xlab, ylab = v_ylab)

# Close png file
dev.off()

# Work done
"Done"
