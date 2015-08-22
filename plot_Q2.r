plot_Q2 <- function(plotData) {
        
        plotData <- plotData[plotData$fips=="24510",]
        plotData <- plotData %>%
                group_by(year) %>%
                summarise_each(funs(sum(., na.rm=TRUE)), Emissions)
        
        par(mar = c(5, 5, 4, 2) + 0.1)
        plot(plotData$year, plotData$Emissions
             , xlim = c(1998, 2010)
             , ylab = expression("Total Emissions, PM"[2.5])
             , xlab = "Year"
             , main = "Baltimore (24510) Total Emissions"
             , type = "b")
        dev.copy(png, file="plot_Q2.png", width=640, height=480)
        dev.off()
}