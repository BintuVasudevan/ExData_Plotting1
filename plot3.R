# plot3.R multiple line plots of Energy sub metering versus "Sub_metering_1","Sub_metering_2","Sub_metering_3"  over the date
# Read data filter based on the required data 

rm(list=ls(all=TRUE))

dataAll <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
dataFeb <- dataAll[min(which(dataAll$Date == "1/2/2007")):max(which(dataAll$Date == "2/2/2007")),]

dataFeb2 = cbind(paste(dataFeb$Date, dataFeb$Time, sep=" "),dataFeb)
names(dataFeb2)[1]<-c("Date.Time")
dataFeb2$Date.Time <- as.POSIXct(dataFeb2$Date.Time, format = '%d/%m/%Y %H:%M:%S')

png("plot3.png", height = 480, width = 480)

par(mfcol=c(1,1),mar=c(4,4,1,1))

with(dataFeb2, plot(Date.Time,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
with(subset(dataFeb2), points(Date.Time,Sub_metering_1,type="l"))
with(subset(dataFeb2), points(Date.Time,Sub_metering_2,type="l",col="red"))
with(subset(dataFeb2), points(Date.Time,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=1.0)

dev.off()
