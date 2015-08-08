source("loadData.R")

#Draw multi-line graph
png(filename="plot3.png", width=480, height = 480, units="px")
plot(sdf$dateTime, sdf$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
points(sdf$dateTime, sdf$Sub_metering_1, type="l")
points(sdf$dateTime, sdf$Sub_metering_2, type="l", col="red")
points(sdf$dateTime, sdf$Sub_metering_3, type="l", col="blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black", "red", "blue"), 
       lty=c(1,1,1))
dev.off()
