## Getting and Cleaning Data

# Quiz 2

#1. 2013-11-07T13:25:07Z






#2


library(sqldf)

fileURL2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

download.file(fileURL2, destfile = "./Q22data.csv")

datedl22<-date()

acs<-read.csv("Q22data.csv")

ans2<-sqldf("select pwgtp1 from acs where AGEP < 50")

head(ans2)


#3

rver<-unique(acs$AGEP)

rver

sqlver<-sqldf("select distinct AGEP from acs")

sqlver



#4 45 31 7 25






