## this part of the code is the same for each plot as it creates the data to be read
## preparing the names 
names<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=1)
## now reading only the needed lines from the file
hpc<-read.table("household_power_consumption.txt", header=FALSE, sep=";", na.strings="?", skip=66637, nrows=2880)
colnames(hpc)<-colnames(names) ## reading out the names and setting them for the data
hpc[,1]<-as.Date(hpc[,1], format="%d/%m/%Y") ## setting dates
hpc[,2]<-as.POSIXct(strptime(hpc[,2], format="%H:%M:%S")) ## setting time
## here the code for each plot should be put
## creating graph
gap <- hpc[,3] ## reading the data for the graph
## creating graph
par(bg="transparent") ## setting transparent background
hist(gap, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file="plot1.png") ## creating png
dev.off() ## closing device