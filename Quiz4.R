## Quiz 4

#1

library(stringr)

# Get data

fileURL1<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

download.file(fileURL1, destfile = "./Q41data.csv")

Q1dat<-read.csv("Q41data.csv")  # read csv into data frame

vector<-names(Q1dat) # create a vector that is the names of the variables

list<-strsplit(vector, "wgtp") # apply strsplit() to generate a list

answer<-list[123] # select the 123rd item on the list

answer  # display the ansser


#2

# load data

library(dplyr)

fileURL42<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

download.file(fileURL42, destfile = "./FGDP.csv") # download file 1

GDP<-read.csv("FGDP.csv", skip = 4, nrow=190) # read in data file only 1st 190 rows
GDP<-select(GDP, X, X.1, X.3, X.4) # selec columns with data
names(GDP)<-c("CountryCode", "GDPRank", "CountryName", "GDP$") # provide new column names for GDP

vector2<-GDP$`GDP$`  # create a vector of the GDP dollars

vector21<-gsub(",", "", vector2) # substitute "" for each ","

vector21<-as.numeric(vector21) # convert vector21 to numbers

answer<-mean(vector21) # calculate the mean

answer # diplay the answer


