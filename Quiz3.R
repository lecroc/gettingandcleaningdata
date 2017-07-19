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

library(dplyr)

fileURL31<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileURL32<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

download.file(fileURL31, destfile = "./FGDP.csv") # download file 1
download.file(fileURL32, destfile = "./Country.csv") # download file 2

GDP<-read.csv("FGDP.csv", skip = 4, nrow=190) # read in data file 1, only 1st 190 rows
GDP<-select(GDP, X, X.1, X.3, X.4) # selec columns with data
CTR<-read.csv("Country.csv") # read in data file 2

names(GDP)<-c("CountryCode", "GDPRank", "CountryName", "GDP$") # provide new column names for GDP

mrg<-merge(GDP, CTR, by="CountryCode") # merges on CountryCode as only similar column in both tables

mrg$GDPRank<-as.numeric(mrg$GDPRank)

mrg<-arrange(mrg, desc(GDPRank)) # sort descending by GDP rank - USA should be last

matches<-nrow(mrg) # calculate number of matches

lucky13<-mrg$CountryName[13] # find 13th Country

matches 

lucky13

#4

grpmrg<-mrg %>%                       
        group_by(Income.Group) %>%   # group mrg data table by Income.Group
        summarize(mean=mean(GDPRank)) # summarize income Group by mean of GDPRank

grpmrg  # display means


#5

mrg1<-mrg %>% mutate(quantile = ntile(GDPRank, 5)) # add column quantile with 5 buckets

grp2mrg<-mrg1 %>%
         group_by(quantile)  # group data by quantile

answer<-table(grp2mrg$quantile, grp2mrg$Income.Group) # create a table of counts of income groups by quantile

answer # display table




