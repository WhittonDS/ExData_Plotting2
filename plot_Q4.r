plot_Q4 <- function(NEI, SCC) {
        
        library(ggplot2)
        library(colorspace)
        library(stringr)
        
        #filter SCC to show only item with Coal in the Short.Name
        SCCcoal <- SCC %>% filter(str_detect(Short.Name, "Coal"))
        
        #Combine NEI (plotData) and SCC coal data using dplyr merge syntax
        plotData <- merge(NEI, SCCcoal, by="SCC")
        
        plotData <- plotData %>% group_by(year) %>%
                summarise_each(funs(sum(., na.rm=TRUE)), Emissions)
        
        
        g <- ggplot(plotData,aes(year,Emissions)) +
                geom_line() +
                xlab("Year") +
                ylab(expression("Total Emissions, PM"[2.5])) +
                ggtitle("Coal Combustion Total Emissions")
        
        #Used during testing
        #print(g)
        
        ggsave(g, file="plot_Q4.png", width=12, height=8)
}