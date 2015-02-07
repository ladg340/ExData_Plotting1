##Plot 1
##R code file

all_data<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=2075259,check.names=F,stringsAsFactors=F,comment.char="",quote="\"")
all_data$Date<-as.Date(all_data$Date,format="%d/%m/%Y")
data<-subset(all_data,subset=(Date>="2007-02-01"&Date<="2007-02-02"))
head(data)
with(data,hist(Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",cex.main=0.8,col="red",cex.axis=0.8,cex.lab=0.8))
dev.copy(png,height=480,width=480,units="px",file="plot1.png")
dev.off()
