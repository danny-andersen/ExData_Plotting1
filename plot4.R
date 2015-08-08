source("loadData.R")

#Plot 2x2 multi-graph
png(filename="plot4.png", width=480, height = 480, units="px")
par(mfrow = c(2,2))
with(sdf, {
  plot(dateTime, 
       Global_active_power, 
       type="l", 
       ylab="Global Active Power (kilowatts)", 
       xlab="")
  plot(dateTime, 
       Voltage, 
       type="l", 
       ylab="Voltage", 
       xlab="datetime")
  plot(dateTime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
  points(dateTime, Sub_metering_1, type="l")
  points(dateTime, Sub_metering_2, type="l", col="red")
  points(dateTime, Sub_metering_3, type="l", col="blue")
  legend("topright", 
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         col=c("black", "red", "blue"), 
         lty=c(1,1,1))
  plot(dateTime, 
       Global_reactive_power, 
       type="l", 
       xlab="datetime")
})
dev.off()
