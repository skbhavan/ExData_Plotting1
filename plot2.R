##Reading data##
unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
time <- strptime(paste(data1$Date,data1$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
finaldata <- cbind(time,data1)

##Plot-2##
plot(finaldata$time,finaldata$Global_active_power,type="l",col="black",xlab="",ylab="Global Active Power (killowatts)")

##Saving as PNG ##
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
