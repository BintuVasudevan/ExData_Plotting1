# plot2.R line plot of Global Active Power(kilowatts) over the date
# Read data filter based on the required data 
dataAll <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
dataFeb <- dataAll[min(which(dataAll$Date == "1/2/2007")):max(which(dataAll$Date == "2/2/2007")),]

dataFeb2 = cbind(paste(dataFeb$Date, dataFeb$Time, sep=" "),dataFeb)
names(dataFeb2)[1]<-c("Date.Time")
dataFeb2$Date.Time <- as.POSIXct(dataFeb2$Date.Time, format = '%d/%m/%Y %H:%M:%S')

png("plot2.png", height = 480, width = 480)

par(mfcol=c(1,1),mar=c(4,4,1,1))

plot(dataFeb2$Date.Time,dataFeb2$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")

dev.off()
