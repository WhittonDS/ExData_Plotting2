plot_Q5 <- function(NEI, SCC) {
        
        library(ggplot2)
        library(colorspace)
        library(stringr)
        
        #filter NEI to show only items in Baltimore
        NEI24510 <- NEI[NEI$fips=="24510",]
        
        #filter SCC to show only item with Vehicle in the Short.Name
        SCCmv <- SCC %>% filter(str_detect(Short.Name, "Vehicle"))
        
        #Combine NEI (plotData) and SCC coal data using dplyr merge syntax
        plotData <- merge(NEI24510, SCCmv, by="SCC")
        
        plotData <- plotData %>% group_by(year) %>%
                summarise_each(funs(sum(., na.rm=TRUE)), Emissions)
        
        
        g <- ggplot(plotData,aes(year,Emissions)) +
                geom_line() +
                xlab("Year") +
                ylab(expression("Total Emissions, PM"[2.5])) +
                ggtitle("Motor Vehicle related Total Emissions")
        
        #Used during testing
        #print(g)
        
        ggsave(g, file="plot_Q5.png", width=12, height=8)
}