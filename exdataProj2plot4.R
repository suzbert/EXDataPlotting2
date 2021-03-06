
#Question 4. 
#Across the United States, how have emissions from coal combustion-related sources 
#changed from 1999-2008?


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

#Subset NEI data related to coal combustion 
#Assume 'comb' ~ combustion

combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]


#use ggplot2 to plot data

ggp <- ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_economist_white() +  
  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" U.S. Coal Combustion Source Emissions from 1999-2008"))

print(ggp)



