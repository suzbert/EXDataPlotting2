
#Question 1. 
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission 
#from all sources for each of the years 1999, 2002, 2005, and 2008.


#set working directory.

setwd("~/AAAAAA_SUZ FOLDERS/CAREER/suz_Data Science Coursera/Exploratory Data Analysis/ExData_Plotting2")
dir()
character(0)

#bring packages into session.

install.packages("data.table")      
library(data.table)  


#Read in the data.

## This first line will likely take a few seconds. Be patient!

NEI <- data.table(readRDS("summarySCC_PM25.rds"))
SCC <- readRDS("Source_Classification_Code.rds")

#pull together 1999,2002,2005,2008

aggTotals <- aggregate(Emissions~year, subset(NEI), sum)

#use BASE system to plot total PM2.5 emission from all sources
#vertical plot

barplot(
  (aggTotals$Emissions)/10^6,
  names.arg=aggTotals$year,
  main="Total PM2.5 Emissions From All US Sources", 
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)"
)





