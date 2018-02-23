NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037")
png(file="Plot6.png")
findata<- NEI %>%
  filter(fips == "24510" | fips == "06037") %>%
  filter(type == "ON-ROAD")%>%
  select(fips,year,Emissions) %>%
  group_by(fips,year)%>%
  summarise(Total.emission = sum(Emissions))
ggplot(findata, aes(year,Total.emission,col=fips,shape=fips))+geom_point(size=4)+geom_line()+ggtitle("Comparison b/w emissions in Baltimore city & Los Angeles")
dev.off()