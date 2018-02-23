NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Across the United States,emissions from coal combustion-related sources changed from 1999-2008
png(file = "Plot4.png")
temp <- SCC[grepl("Coal" , SCC$Short.Name), ]
NEI.sub <- NEI[NEI$SCC %in% temp$SCC, ]

findata<- NEI.sub  %>%
          select(year,Emissions) %>%
          group_by(year)%>%
          summarise(Total.emission = sum(Emissions))
ggplot(findata, aes(year,Total.emission))+geom_point(size=4,lwd=2)+geom_line()+ggtitle("change in Emissions for coal combustin sources")
dev.off()