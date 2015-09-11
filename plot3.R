library(dplyr)

# read and prepare the data
epc<-read.csv(file="household_power_consumption.txt", sep=";", na.strings="?", colClasses = c("character","character",rep("double",7)))
epc<-filter(epc, Date %in% c("1/2/2007","2/2/2007"))
epc<-mutate(epc, DateTime=as.POSIXct(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S")))

# open device png
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12)

# draw plots 
plot(epc$DateTime,epc$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
par(new = TRUE)
plot(epc$DateTime,epc$Sub_metering_2, ylim=range(c(epc$Sub_metering_1,epc$Sub_metering_1)), axes = FALSE, xlab = "", ylab = "", type="l", col=2)
par(new = TRUE)
plot(epc$DateTime,epc$Sub_metering_3, ylim=range(c(epc$Sub_metering_1,epc$Sub_metering_1)), axes = FALSE, xlab = "", ylab = "", type="l", col="blue")

# draw legend
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

#close device
dev.off()