house <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(house) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
houseset <- subset(house,house$Date=="1/2/2007" | house$Date =="2/2/2007")


houseset$Date <- as.Date(houseset$Date, format="%d/%m/%Y")
houseset$Time <- strptime(houseset$Time, format="%H:%M:%S")
houseset[1:1440,"Time"] <- format(houseset[1:1440,"Time"],"2007-02-01 %H:%M:%S")
houseset[1441:2880,"Time"] <- format(houseset[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(houseset$Time,as.numeric(as.character(houseset$Global_active_power)),type="l",ylab="Global Active Power (kilowatts)", xlab = "", main = "Global Active Power Vs Time") 


dev.copy(png, file = "plot2.png")

dev.off()