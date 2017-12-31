
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

hist(Data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")