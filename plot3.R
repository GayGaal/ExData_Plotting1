## this part of the code is the same for each plot as it creates the data to be read
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
sm1 <- hpc[,7]; sm2 <- hpc[,8]; sm3 <- hpc[,9] ## reading submetering
par(bg="transparent") ## setting transparent background
## plotting the graph
plot(datetime, sm1, xlab="", ylab="Energy sub metering", type="n")
## adding needed data lines
lines(datetime, sm1, col="black")
lines(datetime, sm2, col="red")
lines(datetime, sm3, col="blue")
## drawing the legend
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="plot3.png") ## creating png
dev.off() ## closing device