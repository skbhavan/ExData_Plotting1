##Reading data##
unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
time <- strptime(paste(data1$Date,data1$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
finaldata <- cbind(time,data1)

##Plot-3##
dev.copy(png, file="plot3.png", height=480, width=480)
plot(finaldata$time,finaldata$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(finaldata$time,finaldata$Sub_metering_2,type="l",col="red")
lines(finaldata$time,finaldata$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty="solid")
dev.off()
