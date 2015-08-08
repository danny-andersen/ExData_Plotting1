
#This R file downloads the data and selects the data and loads the data frame to allow it to be analysed
# Note: Only data from 2007-02-01 and 2007-02-02 is selected
# It should be by all R scripts that require to analyse the data

#If source data not present, download and unzip
if (!file.exists("power_consumption.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                destfile = "power_consumption.zip",
                method = "wget")
  unzip(zipfile = "power_consumption.zip")
}

#Pre-filter data to just be for the dates required
#First try and grep out the required dates
file.remove("power_consumption_selected.txt")
system2("egrep", args= c("'^[12]/2/2007|^Date'", "household_power_consumption.txt"), stdout="power_consumption_selected.txt")
#Check to see if the grep works - if it did then use that data, if not filter it manually
if (file.exists("power_consumption_selected.txt")) {
  # Read in pre-filtered data if grep worked (may not have it on system)
  df <- read.csv(file="power_consumption_selected.txt", 
                 sep=";", 
                 header = TRUE, 
                 na.strings = c("?"), 
                 colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric")
  )
  subsel = FALSE
} else {
  # Grep didn't work  
  # Read in all data
  df <- read.csv(file="household_power_consumption.txt", 
                 sep=";", 
                 header = TRUE, 
                 na.strings = c("?"), 
                 colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric")
  )
  subsel = TRUE
}

#Convert date and time into Posix date
dateTime <- strptime(paste(df[,1], df[,2], sep=" "), format="%d/%m/%Y %H:%M:%S")
df <- cbind(dateTime,df)

if (subsel) {
  #Pre-filter didnt work so have all dates
  #Select only dates of interest
  startDate <- strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S")
  endDate <- strptime("2007-02-03 00:00:00", "%Y-%m-%d %H:%M:%S")
  sdf <- df[df$dateTime >= startDate & df$dateTime < endDate, ]
} else {
  sdf <- df
}

#Finished with full data set - free up some memory
df <- NULL

