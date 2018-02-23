NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
png(file = "Plot1.png")
allmeans<-aggregate(NEI$Emissions,by = list(NEI$year),sum)
plot(allmeans,xlab="Years",ylab="Total emissions",type="b",lty=2,col="red")
dev.off()

