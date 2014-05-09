## this part of the code is similar for each plot as it creates the data to be read
## preparing the names 
names<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=1)
## now reading only the needed lines from the file
hpc<-read.table("household_power_consumption.txt", header=FALSE, sep=";", na.strings="?", skip=66637, nrows=2880)
colnames(hpc)<-colnames(names) ## reading out the names and setting them for the data
hpc[,2] <- paste(hpc[,1],hpc[,2], sep=" ") ## setting right dates for time
hpc[,1]<-as.Date(hpc[,1], format="%d/%m/%Y") ## setting dates
hpc[,2]<-as.POSIXct(hpc[,2], format="%d/%m/%Y %H:%M:%S") ## setting time
## here the code for each plot should be put
datetime <- hpc[,2] ## reading dates and times for the graph
gap <- hpc[,3] ## reading the data for the graph
gar <- hpc[,4] ## reading the data for the graph
volt <- hpc[,5] ## reading the data for the graph
sm1 <- hpc[,7]; sm2 <- hpc[,8]; sm3 <- hpc[,9] ## reading submetering
png(file="plot4.png", height=480, width=480) ## setting output
par(bg="transparent", mfrow=c(2,2)) ## setting global parameters
## plotting the first graph
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power")
## plotting the second graph
plot(datetime, volt, type="l", ylab="Voltage")
## plotting the third graph
plot(datetime, sm1, xlab="", ylab="Energy sub metering", type="n")
lines(datetime, sm1, col="black")
lines(datetime, sm2, col="red")
lines(datetime, sm3, col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")
## plotting the fourth graph
plot(datetime, gar, type="l", ylab="Global_reactive_power")
## writing to png
dev.off() ## closing device