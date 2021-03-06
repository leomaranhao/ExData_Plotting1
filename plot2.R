library(dplyr)

# read and prepare the data
epc<-read.csv(file="household_power_consumption.txt", sep=";", na.strings="?", colClasses = c("character","character",rep("double",7)))
epc<-filter(epc, Date %in% c("1/2/2007","2/2/2007"))
epc<-mutate(epc, DateTime=as.POSIXct(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S")))

# open device png
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12)

# draw plot
plot(epc$DateTime,epc$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)")

#close device
dev.off()