NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City
png(file="Plot5.png")
findata<- NEI %>%
         filter(fips == "24510" & type == "ON-ROAD") %>%
         select(year,Emissions) %>%
         group_by(year)%>%
         summarise(Total.emission = sum(Emissions))
ggplot(findata, aes(year,Total.emission))+geom_point(size=4,col="green")+geom_line(col="green")+ggtitle("Emissions by motor vehicle sources in Baltimore")
dev.off()