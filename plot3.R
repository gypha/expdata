if(!file.exists("hcp")){
  dir.create("hcp")
}
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "hcp/power_consump.zip")
unzip("hcp/power_consump.zip", exdir="hcp", overwrite = T)
data<-read.table("hcp/household_power_consumption.txt",header=T, na.strings="?", sep = ";")
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
FTime <-strptime(paste(data1$Date, data1$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
Data <- cbind(FTime, data1)

with(Data, {
  plot(Sub_metering_1~FTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~FTime,col='Red')
  lines(Sub_metering_3~FTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))