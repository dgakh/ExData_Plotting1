# coursera, Exploratory Data Analysis, Project 1
# plot1.R
# written by Dmitriy Gakh

# Load data to variable data_set ( simple way )
data_set <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Transform Date column to Date type
data_set$Date <- as.Date(data_set$Date, "%d/%m/%Y")

# Extract data for 2 days
ds_2days <- subset(data_set, Date >= as.Date('01/02/2007', format='%d/%m/%Y') & Date <= as.Date('02/02/2007', format='%d/%m/%Y') )

# Transform to numeric ( need transforming through as.character )
ds_2days$Global_active_power <- as.numeric(as.character(ds_2days$Global_active_power))

# Add a title
v_main <- "Global Active Power"

# Set X axis label
v_xlab <- "Global Active Power (kilowatts)"

# Set limit for Y axis
v_ylim <- c(0,1200)

# Set fill color to red
v_col = "red"

# Prepare png file
png("plot1.png", width = 480, height = 480)

# Plot
hist(ds_2days$Global_active_power, col = v_col, xlab = v_xlab, main = v_main, ylim = v_ylim)

# Close png file
dev.off()

# Work done
"Done"
