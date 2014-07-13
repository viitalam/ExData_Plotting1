# read data into nice table with correct rownames.
data <- read.table("./household_power_consumption.txt", sep = ";",  skip = 66637, 
                   nrows = 2881)
variables <-  read.table("./household_power_consumption.txt", sep = ";", 
                         nrows = 1, stringsAsFactors = FALSE)
names(data)<-variables[1,]

# make plot and save it to file
png(file = "plot1.png")
hist(data[,3],col = "red", main = "Global Activate Power", 
     xlab = "Global Activate Power (kilowatts)")
dev.off()