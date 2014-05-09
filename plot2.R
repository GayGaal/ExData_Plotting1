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
gap <- hpc[,3] ## reading the data for the graph
datetime <- hpc[,2] ## reading dates and times for the graph
png(file="plot2.png", height=480, width=480) ## setting output
par(bg="transparent") ## setting transparent background
## plotting the graph
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power (kilowats)")
dev.off() ## closing device