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
png(file = "plot2.png")
plot(properdate,data[,3], type ="l", ylab ="Global Activate Power (kilowats)", 
     xlab = "")
dev.off()