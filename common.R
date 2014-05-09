## this part of the code is the same for each plot as it creates the data to be read
lines <- grep("^[1-2]/2/2007", readLines("hpc.txt")) ## reading the needed line's number and total nrows
## preparing the names 
names<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=1)
## now reading only the needed lines from the file
hpc<-read.table("household_power_consumption.txt", header=FALSE, sep=";", na.strings="?", skip=66637, nrows=2880)
colnames(hpc)<-colnames(names) ## reading out the names and setting them for the data
hpc[,1]<-as.Date(hpc[,1], format="%d/%m/%Y") ## setting dates
hpc[,2]<-as.POSIXct(strptime(hpc[,2], format="%H:%M:%S")) ## setting time
## here the code for each plot should be put