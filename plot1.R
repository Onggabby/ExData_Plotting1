house <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(house) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
houseset <- subset(house,house$Date=="1/2/2007" | house$Date =="2/2/2007")

hist(as.numeric(as.character(houseset$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
title(main="Global Active Power")

dev.copy(png, file = "plot1.png")