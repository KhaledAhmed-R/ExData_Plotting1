###loading the dataset
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","dataset.zip")
unzip("dataset.zip")
dataset<-read.table("household_power_consumption.txt",sep=";",header = TRUE)
data<-subset(dataset,Date=="1/2/2007"|Date=="2/2/2007")
data$Time<-strptime(paste(as.character(data$Date),as.character(data$Time)),"%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date)
###plotting
plot(data$Time,as.numeric(as.character(data$Sub_metering_1)),type="l",xlab="",ylab = "Energy sub metering")
lines(data$Time,as.numeric(as.character(data$Sub_metering_2)),col="red")
lines(data$Time,as.numeric(as.character(data$Sub_metering_3)),col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = 5, col=c("black","red","blue"),lty=1)
png(filename = "plot3.png",width = 480, height = 480, units = "px")
dev.off()