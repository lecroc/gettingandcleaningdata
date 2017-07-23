## Quiz 4

#1

library(stringr)

# Get data

fileURL1<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

download.file(fileURL1, destfile = "./Q41data.csv")

Q1dat<-read.csv("Q41data.csv")  # read csv into data frame

vector<-names(Q1dat) # create a vector that is the names of the variables

list<-strsplit(vector, "wgtp") # apply strsplit() to generate a list

answer1<-list[123] # select the 123rd item on the list

answer1  # display the ansser


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

answer2<-mean(vector21) # calculate the mean

answer2 # diplay the answer


#3

countryNames<-GDP$CountryName  # create a vector of the country names

answer3<-grep("^United", countryNames)  # this is the correct regex code for grep

answer3a<-length(answer3) # count how many countries match the regex

answer3a # display the number of countries

answer3 # display the position of the countries in data frame GDP

View(GDP) # look at GDP to make sure the referenced rows' country names start with "United"


#4

# Get new data

fileUrl44<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

download.file(fileUrl44, destfile = "./Country.csv")

EDU<-read.csv("Country.csv") # read in second table to EDU

mrg<-merge(GDP, EDU, by="CountryCode") # merges on CountryCode as only similar column in both tables

answer4<-length(grep("*Fiscal year end: June", mrg$Special.Notes)) # store length of vector of matching strings

answer4 # dispay answer


#5

library(quantmod)
library(lubridate)

amzn = getSymbols("AMZN",auto.assign=FALSE) # get data on Amazon stock prices

sampleTimes = index(amzn) # store times from amzn into a vector

st<-as.data.frame(sampleTimes) # convert vector to data frame

names(st)<-c("Date")  # give the column in st the name of "Date"

st1<-subset(st, year(st$Date)==2012)  # subset the data frame for year= 2012

answer5a<-nrow(st1)  # store the number of rows into answer5a

st2<-subset(st, year(st$Date)==2012 & wday(st$Date)==2) # subset st for year=2012 and weekday = Monday (2)

answer5b<-nrow(st2)  # store the number of rows into answer 5b

answer5a  # display number of values collected in 2012

answer5b  # display number of values collected in 2012 on a Monday




