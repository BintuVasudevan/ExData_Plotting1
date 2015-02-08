# Plot1.1 Histogram of the Global Active Power
# Read data filter based on the required data 
dataAll <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
dataFeb <- dataAll[min(which(dataAll$Date == "1/2/2007")):max(which(dataAll$Date == "2/2/2007")),]

png("plot1.png", height = 480, width = 480)
par(mfcol=c(1,1),mar=c(4,4,1,1))
with(dataFeb,hist(Global_active_power,main="Global Active Power",xlab="Global Active Power(kilowatts)",col="red"))
dev.off()








