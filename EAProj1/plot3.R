##Plot 3
pr1 <- read.table("Graphics/household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")
prT <- subset(pr1, Date == '1/2/2007' | Date == '2/2/2007')
rm(pr1)
prTime <- paste(prT$Date,prT$Time)
prTime <- strptime(prTime, format = '%d/%m/%Y %H:%M:%S')
prT <- cbind(prT,prTime)
prT <- prT[,-c(1,2)]
par(mar=c(3,4.5,4,1))
png("Graphics/Plot3.png")
matplot(prT$prTime,prT[,c(5,6,7)],col=c("black","red","blue"),type="l",ylab="Energy sub metering",xlab="")
legend("topright", pch="-",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pt.cex=1, cex=0.5)
##dev.copy(png,file="Graphics/Plot3.png",width = 480, height = 480,
##         units = "px", pointsize = 10)
dev.off()
