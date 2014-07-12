## This script creates a histogram of Global Active Power for 2007-02-01 and 2007-02-01

        ## Read 2007-02-01 and 2007-02-02 data into a table and set column names
        dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
        colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

        ## Open png graphic device
        png(filename = "plot1.png", width = 480, height = 480)
        
        ## Create histogram
        hist(dat$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

        ## Close png graphic device
        dev.off()