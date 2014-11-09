##Plot 1
pr1 <- read.table("Graphics/household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")
prT <- subset(pr1, Date == '1/2/2007' | Date == '2/2/2007')
rm(pr1)
hist(as.numeric(prT$Global_active_power), col="red",xlab="Global Active Power (Kilowatts)",main="Global Active Power",ylim=c(0,1200))
dev.copy(png,file="Graphics/Plot1.png",width = 480, height = 480,
         units = "px", pointsize = 10)
dev.off()