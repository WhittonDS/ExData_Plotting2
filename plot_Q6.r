plot_Q6 <- function(NEI, SCC) {
        
        library(ggplot2)
        library(colorspace)
        library(stringr)
        
        #filter NEI to show only items in Baltimore
        NEI2 <- NEI[NEI$fips=="24510" | NEI$fips=="06037",]
        
        #filter SCC to show only item with Vehicle in the Short.Name
        SCCmv <- SCC %>% filter(str_detect(Short.Name, "Vehicle"))
        
        #Combine NEI (plotData) and SCC coal data using dplyr merge syntax
        plotData <- merge(NEI2, SCCmv, by="SCC")
        
        #Change zipcode designations to city names
        plotData$fips[plotData$fips=="24510"] <- "Baltimore, MD 24510"
        plotData$fips[plotData$fips=="06037"] <- "Los Angeles, CA 06037"
        
        plotData <- plotData %>% group_by(year, fips) %>%
                summarise_each(funs(sum(., na.rm=TRUE)), Emissions)
        
        
        g <- ggplot(plotData,aes(year,Emissions, color=fips)) +
                geom_line() +
                xlab("Year") +
                ylab(expression("Total Emissions, PM"[2.5])) +
                ggtitle("Motor Vehicle related Total Emissions")
        
        #Used during testing
        #print(g)
        
        ggsave(g, file="plot_Q6.png", width=12, height=8)
}