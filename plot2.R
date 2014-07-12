## This script creates a line graph of Global Active Power for 2007-02-01 and 2007-02-01 by date and time

        ## Read 2007-02-01 and 2007-02-02 data into a table and set column names
        dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
        colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

        ## Add datetime to data frame
        dat$datetime <- strptime(paste(dat$Date,dat$Time), format="%d/%m/%Y %H:%M:%S")

        ## Open png graphic device
        png(filename = "plot2.png", width = 480, height = 480)

        ## Create line graph
        plot(dat$datetime, dat$Global_active_power, type = "l", xlab ="", ylab ="Global Active Power (kilowatts)")

        ## Close png graphic device
        dev.off()