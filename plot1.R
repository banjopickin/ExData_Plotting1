library(data.table)
library(dplyr)
library(tidyr)
a<-tbl_df(fread("household_power_consumption.txt",colClass="character",na.strings="?") )     #read
data<-filter(a,Date=="1/2/2007"|Date=="2/2/2007")
hist(as.numeric(unlist(data[,3])),main="Global Active Power",col="red",
     xlab="Global Active Power(kilowatts)",ylab="Frequency")
dev.copy(png,file="plot1.png")
dev.off()
