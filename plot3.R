library(data.table)
library(dplyr)
library(tidyr)
library(lubridate)
a<-tbl_df(fread("household_power_consumption.txt",colClass="character",na.strings="?") ) 
data<-filter(a,Date=="1/2/2007"|Date=="2/2/2007") %>%
        within(dt<-dmy_hms(paste(Date,Time))) %>%
        select(dt,Global_active_power:Sub_metering_3)
with(data,plot(dt,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(data,lines(dt,Sub_metering_2,col="red"))
with(data,lines(dt,Sub_metering_3,col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

t<-data$dt
axis.POSIXct(side=1,at=seq(t[1],t[length(data$dt)]+60,by="days"))

dev.copy(png,file="plot3.png")
dev.off()