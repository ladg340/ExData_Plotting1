## Plot 4
## R code file

Sys.setlocale("LC_TIME", "English")
all_data<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=2075259,check.names=F,stringsAsFactors=F,comment.char="",quote="\"")
all_data$Date<-as.Date(all_data$Date,format="%d/%m/%Y")
data<-subset(all_data,subset=(Date>="2007-02-01"&Date<="2007-02-02"))
head(data)
dateTime<-paste(as.Date(data$Date),data$Time)
data$DateTime<-strptime(dateTime,format="%Y-%m-%d %H:%M:%S")
par(mfrow=c(2,2))
with(data,{
        plot(data$DateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power",cex.lab=0.8,cex.axis=0.8)
        plot(data$DateTime,data$Voltage,type="l",xlab="datetime",ylab="Voltage",cex.lab=0.8,cex.axis=0.8)
        plot(data$DateTime,data$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering",cex.lab=0.8,cex.axis=0.8)
        lines(data$DateTime,data$Sub_metering_2,col="red")
        lines(data$DateTime,data$Sub_metering_3,col="blue")
        legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"),cex=0.7,bty="n")
        plot(data$DateTime,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_Reactive_Power",cex.lab=0.8,cex.axis=0.8)
})
dev.copy(png,height=480,width=480,units="px",file="plot4.png")
dev.off()
