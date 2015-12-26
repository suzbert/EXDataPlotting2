
#Question 2. 
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
#(fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.


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

aggTotals <- aggregate(Emissions~year, subset(NEI, fips == 24510), sum)

#use BASE system to plot total PM2.5 emission from all sources within Baltimore City, Maryland
#vertical plot

barplot(
  aggTotals$Emissions,
  names.arg=aggTotals$year,
  main="Total PM2.5 Emissions From All Baltimore City Sources", 
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)"
)







