library(dplyr)

# read and prepare the data
epc<-read.csv(file="household_power_consumption.txt", sep=";", na.strings="?", colClasses = c("character","character",rep("double",7)))
epc<-filter(epc, Date %in% c("1/2/2007","2/2/2007"))

# open device png
png(filename = "graph1.png",
    width = 480, height = 480, units = "px", pointsize = 12)

# draw plot
hist(epc$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = 2, ylim=c(0,1200))

#close device
dev.off()

# go back to the initial locale
Sys.setlocale("LC_TIME", locale)