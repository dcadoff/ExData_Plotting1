## This script creates a line graph of Energy sub metering for 2007-02-01 and 2007-02-01 

        ## Read 2007-02-01 and 2007-02-02 data into a table and set column names
        dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
        colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

        ## Add datetime to data frame
        dat$datetime <- strptime(paste(dat$Date,dat$Time), format="%d/%m/%Y %H:%M:%S")

        ## Open png graphic device
        png(filename = "plot3.png", width = 480, height = 480)

        ## Create line graphs
        plot(dat$datetime, dat$Sub_metering_1, type = "l", xlab ="", ylab ="Energy sub metering")
        lines(dat$datetime, dat$Sub_metering_2, type = "l", col = "red", xlab ="", ylab ="Energy sub metering")
        lines(dat$datetime, dat$Sub_metering_3, type = "l", col = "blue", xlab ="", ylab ="Energy sub metering")

        ## Add legend
        legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

        ## Close png graphic device
        dev.off()