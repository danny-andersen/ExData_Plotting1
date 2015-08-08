source("loadData.R")
#Draw line graph of global active power
png(filename="plot2.png", width=480, height = 480, units="px")
plot(sdf$dateTime, 
     sdf$Global_active_power, 
     type="l", 
     ylab="Global Active Power (kilowatts)", 
     xlab="")
dev.off()
