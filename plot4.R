# plot4.R multiple plots 
# Read data filter based on the required data 
dataAll <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
dataFeb <- dataAll[min(which(dataAll$Date == "1/2/2007")):max(which(dataAll$Date == "2/2/2007")),]

dataFeb2 = cbind(paste(dataFeb$Date, dataFeb$Time, sep=" "),dataFeb)
names(dataFeb2)[1]<-c("Date.Time")
dataFeb2$Date.Time <- as.POSIXct(dataFeb2$Date.Time, format = '%d/%m/%Y %H:%M:%S')
 

par(mfcol=c(2,2),mar=c(4,4,1,1))

plot(dataFeb2$Date.Time,dataFeb2$Global_active_power,type="l",ylab="Global Active Power",xlab="")

with(dataFeb2, plot(Date.Time,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
with(subset(dataFeb2), points(Date.Time,Sub_metering_1,type="l"))
with(subset(dataFeb2), points(Date.Time,Sub_metering_2,type="l",col="red"))
with(subset(dataFeb2), points(Date.Time,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1, bty="n", col=c("black","red","blue"),legend=c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  "),cex=0.8)

plot(dataFeb2$Date.Time,dataFeb2$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(dataFeb2$Date.Time,dataFeb2$Global_reactive_powe,type="l",ylab="Global_reactive_powe",xlab="datetime")


dev.copy(png,file="plot4.png")
dev.off()

