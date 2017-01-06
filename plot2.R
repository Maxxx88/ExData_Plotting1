## -------------------------------------------
##
## Created by: Max
## Created date: 06/01/2016
## Description: Create graph2
## All library need to be loaded before (not included in this script)
##
##
## Modification date:
## Modify by: 
##
## -------------------------------------------

# Variables
  fileName <- "./household_power_consumption.txt"
  url       <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  zipFile  <- "./data.zip"
  targetFileName <- "plot2.png"
  pngXsize <- 480
  pngYsize <- 480

# Download the archive as data source and make it ready for use
# Comment this part if required
  download.file(url, destfile = zipFile)
  unzip(zipFile)
  file.remove(zipFile)  # Always clean the useless files


# Import the file
  mydata <- read.table(fileName, header = T, sep = ";", na.strings = "?", 
                     colClasses = c("character","character","double","double","double","double","double","double","numeric"))


# Filter the useable data
  mydata$DateTime = paste(mydata$Date, mydata$Time)
  mydata$DateTime = as.POSIXlt(mydata$DateTime, format = "%d/%m/%Y %H:%M:%S")
  mydata$Date = NULL
  mydata$Time = NULL
  
  useData <- subset(mydata , DateTime$year == 107 & DateTime$mon == 1 & 
                    (DateTime$mday == 1 | DateTime$mday == 2))

  remove(mydata) # Free memory when possible


# Create the png and graph then close
  png(file = targetFileName, width = pngXsize, height = pngYsize, units = "px") 
  
  plot(x = useData$DateTime, y = useData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  dev.off()


# Clean all variables before end  
  remove(fileName, pngXsize, pngYsize, targetFileName, url, zipFile, useData)

## End

