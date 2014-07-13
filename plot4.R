# read data into nice table with correct rownames.
data <- read.table("./household_power_consumption.txt", sep = ";",  skip = 66637, 
                   nrows = 2880)
variables <-  read.table("./household_power_consumption.txt", sep = ";", 
                         nrows = 1, stringsAsFactors = FALSE)
names(data)<-variables[1,]

# construct x-axis for the figure by converting date and time to POSIXlt
rawdate <-paste(data[,1],data[,2])
datetime <- strptime(rawdate,format="%d/%m/%Y %H:%M:%S")

# make plot and save it to file

png(file = "plot4.png")

# set up 2x2 table of figures
par(mfrow = c(2,2))

# plot I
plot(datetime,data[,3], ylab="Global Activate Power", type = "l", xlab = "")

# plot II
plot(datetime, data[,5], type = "l", ylab="Voltage")

# plot III
plot(datetime,data[,7], type ="l", ylab ="Energy submetering", 
     xlab = "")
lines(datetime, data[,8], col="red")
lines(datetime, data[,9], type = "l", col="blue")
legend("topright", lty = 1, col = c("black","blue","red"),
       legend=names(data)[7:9])

# plot IV
plot(datetime, data[,4], type = "l", ylab = "Global_reactive_power")

dev.off()