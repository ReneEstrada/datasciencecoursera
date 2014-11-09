##Plot 4
pr1 <- read.table("Graphics/household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")
prT <- subset(pr1, Date == '1/2/2007' | Date == '2/2/2007')
rm(pr1)
prTime <- paste(prT$Date,prT$Time)
prTime <- strptime(prTime, format = '%d/%m/%Y %H:%M:%S')
prT <- cbind(prT,prTime)
prT <- prT[,-c(1,2)]
par(mar=c(2.1,3.3,3,2))
png("Graphics/Plot4.png")
par(mfrow=c(2,2))
plot(prT$prTime,prT$Global_active_power,xlab="",ylab="Global Active Power (Kilowatts)",main="",type="l")
plot(prT$prTime,prT$Voltage,xlab="datetime",ylab="Voltage",main="",type="l")
matplot(prT$prTime,prT[,c(5,6,7)],col=c("black","red","blue"),type="l",ylab="Energy sub metering",xlab="")
legend("topright", pch="-",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(prT$prTime,prT$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",main="",type="l")
##dev.copy(png,file="Graphics/Plot4.png",width = 480, height = 480,
##         units = "px", pointsize = 10)
dev.off()
    