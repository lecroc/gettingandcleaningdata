## Getting and Cleaning Data

## Quiz 1

#1

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "C:/Coursera/Getting and Cleaning Data/Q1data.csv")

q1data<-read.csv("C:/Coursera/Getting and Cleaning Data/Q1data.csv")

q1data1<-subset(q1data, q1data$VAL=="24")

nrow(q1data1)

#2

