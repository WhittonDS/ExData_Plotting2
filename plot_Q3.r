plot_Q3 <- function(plotData) {
        
        library(ggplot2)
        library(colorspace)
        
        plotData <- plotData[plotData$fips=="24510",]
        plotData <- plotData %>%
                group_by(year, type) %>%
                summarise_each(funs(sum(., na.rm=TRUE)), Emissions)
        
    
        g <- ggplot(plotData,aes(year,Emissions, color=type)) +
                geom_bar(stat="identity") +
                facet_grid(.~type) +
                xlab("Year") +
                ylab(expression("Total Emissions, PM"[2.5])) +
                labs(title=expression("Baltimore (24510) Total Emissions by Type"))
        
        print(g)
                    
        dev.copy(png, file="plot_Q3.png", width=1001, height=575)
        dev.off()
}