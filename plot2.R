###loading the dataset
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","dataset.zip")
unzip("dataset.zip")
dataset<-read.table("household_power_consumption.txt",sep=";",header = TRUE)
data<-subset(dataset,Date=="1/2/2007"|Date=="2/2/2007")
data$Time<-strptime(paste(as.character(data$Date),as.character(data$Time)),"%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date)
###plotting
with(data,plot(Time,Global_active_power,type="l",ylab = "Global Active Power (kilowatts)"))
png(filename = "plot2.png",width = 480, height = 480, units = "px")
dev.off()