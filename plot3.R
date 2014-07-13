# read data into nice table with correct rownames.
data <- read.table("./household_power_consumption.txt", sep = ";",  skip = 66637, 
                   nrows = 2880)
variables <-  read.table("./household_power_consumption.txt", sep = ";", 
                         nrows = 1, stringsAsFactors = FALSE)
names(data)<-variables[1,]

# construct x-axis for the figure by converting date and time to POSIXlt
rawdate <-paste(data[,1],data[,2])
properdate <- strptime(rawdate,format="%d/%m/%Y %H:%M:%S")

# make plot and save it to file
png(file = "plot3.png")
plot(properdate,data[,7], type ="l", ylab ="Energy submetering", 
     xlab = "")
lines(properdate, data[,8], col="red")
lines(properdate, data[,9], type = "l", col="blue")
legend("topright", lty = 1, col = c("black","blue","red"),
       legend=names(data)[7:9])
dev.off()