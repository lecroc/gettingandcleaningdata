## Quiz 3

# 1

## Don't need dyplr for this question - just base R

fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv" # store file URL

download.file(fileURL, destfile = "./Q3data.csv") # download file

datedownloaded3<-date()  # store date downloaded

x<-read.csv("Q3data.csv") # read into data frame

answer<-which(agriculturLogical<-x$ACR == 3 & x$AGS == 6) # vector of record numbers where both conditions are true








