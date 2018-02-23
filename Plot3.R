NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008
png(file = "Plot3.png")
findata<- NEI %>%
  filter(fips == "24510") %>%
  select(type,year,Emissions) %>%
  group_by(type,year)%>%
  summarise(Total.emission = sum(Emissions))
ggplot(findata, aes(year,Total.emission,col=type,shape=type))+geom_point(size=4,lwd=2)+geom_line()
dev.off()
