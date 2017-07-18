## Quiz 3

# 1

## Don't need dyplr for this question - just base R

fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv" # store file URL

download.file(fileURL, destfile = "./Q3data.csv") # download file

datedownloaded3<-date()  # store date downloaded

x<-read.csv("Q3data.csv") # read into data frame

answer<-which(agriculturLogical<-x$ACR == 3 & x$AGS == 6) # vector of record numbers where both conditions are true

answer[1:3]  # display the first 3 records


#2

fileURL2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"

download.file(fileURL2, destfile="./jeff.jpg", mode="wb") # need mode = wb for this to work 

library(jpeg)

x2<-readJPEG("./jeff.jpg", native = TRUE) # read in jpeg file with native = TRUE 

answer2<-quantile(x2, probs = c(.3,.8), na.rm=TRUE) # use quantile function to get 30 and 80

answer2 # print answer

#3






