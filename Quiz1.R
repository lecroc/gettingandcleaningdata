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

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", destfile = "C:/Coursera/Getting and Cleaning Data/Q3data.xlsx")

library(xlsx)

file<-"C:/Coursera/Getting and Cleaning Data/Q3data.xlsx"

q3data<-read.xlsx("C:/Coursera/Getting and Cleaning Data/Q3data.xlsx", sheetIndex = 1)


