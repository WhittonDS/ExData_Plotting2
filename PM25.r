PM25 <- function(){
        
        #install.packages("dplyr")
        library(dplyr)
        library(reshape2)
        
        directory = "C://Users//jwhitt01//Documents//jjW//Coursera//04 Exploratory Data Analysis"
        setwd(directory)
        
        # Set the Working Directory if it isn't set correctly already
        if (getwd() != directory){
                setwd(directory)
        }

        ## This first line will likely take a few seconds. Be patient!
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
        #head(NEI)
        #head(SCC)
        
        source('plot_Q1.r')
        plot_Q1(NEI)
        
        source('plot_Q2.r')
        plot_Q2(NEI)
        
        source('plot_Q3.r')
        plot_Q3(NEI)
        
        source('plot_Q4.r')
        plot_Q4(NEI, SCC)
        
        source('plot_Q5.r')
        plot_Q5(NEI, SCC)
        
        source('plot_Q6.r')
        plot_Q6(NEI, SCC)
}