##Plot 2
pr1 <- read.table("Graphics/household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")
prT <- subset(pr1, Date == '1/2/2007' | Date == '2/2/2007')
rm(pr1)
prTime <- paste(prT$Date,prT$Time)
prTime <- strptime(prTime, format = '%d/%m/%Y %H:%M:%S')
prT <- cbind(prT,prTime)
prT <- prT[,-c(1,2)]
plot(prT$prTime,prT$Global_active_power,xlab="",ylab="Global Active Power (Kilowatts)",main="",type="l")
dev.copy(png,file="Graphics/Plot2.png",width = 480, height = 480,
         units = "px", pointsize = 10)
dev.off()
