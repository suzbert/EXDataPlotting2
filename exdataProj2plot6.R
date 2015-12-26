
#Question 6. 
#Compare emissions from motor vehicle sources 
#in Baltimore City 
#with emissions from motor vehicle sources 
#in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

#OK to Use the ggplot2 plotting system to make a plot answer this question.


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

#Pull together 1999,2002,2005,2008 for US
aggTotals <- aggregate(Emissions ~ year,NEI, sum)

#Subset NEI data related to motor vehicles and location

vehiclesBaltimoreNEI <- vehiclesNEI[vehiclesNEI$fips == 24510,]
vehiclesBaltimoreNEI$city <- "Baltimore City"
vehiclesLANEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vehiclesLANEI$city <- "Los Angeles County"
bothNEI <- rbind(vehiclesBaltimoreNEI,vehiclesLANEI)


#use ggplot2 to plot data

ggp <- ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  theme_economist_white() +  
  guides(fill=FALSE) + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

print(ggp)



