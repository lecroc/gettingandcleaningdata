## Getting and Cleaning Data

# Quiz 2

#1. 2013-11-07T13:25:07Z






#2


library(sqldf)

fileURL22<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"  # set fileURL22 to file URL

download.file(fileURL2, destfile = "./Q22data.csv") # download file and store on wd at Q22data.csv

datedl22<-date()  # record date downloaded

acs<-read.csv("Q22data.csv") # read csv file into data frame

ans2<-sqldf("select pwgtp1 from acs where AGEP < 50")  # this command seems like the correct one....

head(ans2)  # yep, it is.


#3

rver<-unique(acs$AGEP) # store unique values for AGEP using r command on acs data frame

rver  # display what that returns

sqlver<-sqldf("select distinct AGEP from acs") # store same values from sql command

sqlver # this is the same as above - this is the correct command



#4

con<-url("http://biostat.jhsph.edu/~jleek/contact.html") # store url as con

lines<-readLines(con) # read lines from url

close(con) # close connection to url

an41<-nchar(lines[10]) # count characters for requested lines.....
an42<-nchar(lines[20])
an43<-nchar(lines[30])
an44<-nchar(lines[100])

answer<-c(an41,an42,an43,an44) # store counts in a list
answer # display counts for answer


#5

fileURL25<-"https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for" # store URL in flleURL25

download.file(fileURL25, destfile = "./Q25data.for", mode = "wb") # download file as binary to Q25data.for in wd

datedl25<-date()  # record date downloaded

widths<-c(15,4,1,8,4,1,8,4,1,8,4,1,8) # store widths of columns I want

f<-read.fwf("Q25data.for", skip=4, widths=widths) # read in data to data fram f skipping headers using widths

cols<-c(1:2,4,5,7,8,10,11,13) # select the columns with numbers

f<-f[,cols] # change f to only include the columns in cols

f # look at f to make sure it is what I want

names(f)<-c("C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9") # add names to the columns

class(f) # check to make sure I have a data frame

answer<-sum(f$C4) # sum the values in column 4 and store in anser

answer  # print the answer
