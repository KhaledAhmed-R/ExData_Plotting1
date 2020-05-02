###loading the dataset
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","dataset.zip")
unzip("dataset.zip")
dataset<-read.table("household_power_consumption.txt",sep=";",header = TRUE)
data<-subset(dataset,Date=="1/2/2007"|Date=="2/2/2007")
data$Date<-as.Date(data$Date)
data$Time<-strptime(data$Time,"%H:%M:%S")
###plotting
hist(as.numeric(as.character(data$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency")
png(filename = "plot1.png",width = 480, height = 480, units = "px")
dev.off()