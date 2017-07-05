## Getting and Cleaning Data

## Quiz 1

#1

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "C:/Coursera/Getting and Cleaning Data/Q1data.csv")

q1data<-read.csv("C:/Coursera/Getting and Cleaning Data/Q1data.csv")

q1data1<-subset(q1data, q1data$VAL=="24")

nrow(q1data1)

#2

#Violates one variable per column

#3

library(openxlsx)

fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"

download.file(fileURL, destfile="./Q3data.xlsx", mode = "wb")
datedownloaded<-date()

dat<-read.xlsx("./Q3data.xlsx", sheet=1, rows = 18:23, cols = 7:15)

answer<-sum(dat$Zip*dat$Ext,na.rm=T)

answer

