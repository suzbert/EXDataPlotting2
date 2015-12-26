
#Question 3. 
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
#which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
#Which have seen increases in emissions from 1999-2008? 

#Use the ggplot2 plotting system to make a plot answer this question.


#set working directory.

setwd("~/AAAAAA_SUZ FOLDERS/CAREER/suz_Data Science Coursera/Exploratory Data Analysis/ExData_Plotting2")
dir()
character(0)

#bring packages into session.

install.packages("plyr")      
install.packages("ggplot2")
install.packages("ggthemes", dependencies = TRUE)

library(ggplot2)
library(plyr)
library(data.table)
library(ggthemes)

#Read in the data.

## This first line will likely take a few seconds. Be patient!

NEI <- data.table(readRDS("summarySCC_PM25.rds"))
SCC <- readRDS("Source_Classification_Code.rds")

#pull together 1999,2002,2005,2008 for both US and Baltimore
#ensure one layer contains all variables used for facetting

aggTotals <- aggregate(Emissions ~ year,NEI, sum)
baltimoreNEI <- NEI[NEI$fips=="24510",]
aggTotalsBaltimore <- aggregate(Emissions~year, subset(NEI, fips == 24510), sum)

#use ggplot2 to plot data

ggp <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_few() + 
  guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggp)



