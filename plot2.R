##Plot 2
##R code file

Sys.setlocale("LC_TIME", "English")
all_data<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=2075259,check.names=F,stringsAsFactors=F,comment.char="",quote="\"")
all_data$Date<-as.Date(all_data$Date,format="%d/%m/%Y")
data<-subset(all_data,subset=(Date>="2007-02-01"&Date<="2007-02-02"))
head(data)
dateTime<-paste(as.Date(data$Date),data$Time)
data$DateTime<-strptime(dateTime,format="%Y-%m-%d %H:%M:%S")
with(data,plot(data$DateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",cex.lab=0.8,cex.axis=0.8))
dev.copy(png,width=480,height=480,units="px",file="plot2.png")
dev.off()
