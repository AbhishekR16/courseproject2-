NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# total emissions from PM2.5 in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008
png(file = "Plot2.png")
findata<- NEI %>%
          filter(fips == "24510") %>%
          select(year,Emissions) %>%
          group_by(year)%>%
          summarise(Total.emission = sum(Emissions))
plot(findata,xlab="Years",ylab="Total emissions",main ="Total Emissions in Maryland", type="b",lty=2,col="blue")
dev.off()