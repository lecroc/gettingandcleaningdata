## Getting and Cleaning Data

## Quiz 1

#1

fileURL1<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

download.file(fileURL1, destfile = "./Q1data.csv")

datedownloaded1<-date()

q1data<-read.csv("Q1data.csv")

q1data1<-subset(q1data, q1data$VAL=="24")

answer1<-nrow(q1data1)

answer1

#2

answer2<- "Violates one variable per column"

answer2

#3

library(openxlsx)

fileURL2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"

download.file(fileURL, destfile="./Q3data.xlsx", mode = "wb")

datedownloaded3<-date()

dat<-read.xlsx("./Q3data.xlsx", sheet=1, rows = 18:23, cols = 7:15)

answer3<-sum(dat$Zip*dat$Ext,na.rm=T)

answer3

#4

library(XML)

fileURL4<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml" # Take "s" off of https to make fileURL work

data4<-xmlTreeParse(fileURL4, useInternal=TRUE)

datedownloaded4<-date()

RootNode<-xmlRoot(data4)

RootNode[[1]]

xmldata4<-as.data.frame(xpathSApply(RootNode, "//zipcode", xmlValue))

names(xmldata4)<-c("ZipCode")

xmldata4<-subset(xmldata4, xmldata4$ZipCode==21231)

answer4<-nrow(xmldata4)

answer4

#5

library(data.table)

fileURL5<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

DT<-fread(fileURL5)


t1<-system.time(for (i in 1:1000) {tapply(DT$pwgtp15,DT$SEX,mean)})
v1<-tapply(DT$pwgtp15,DT$SEX,mean)

t2<-system.time(for (i in 1:1000) {DT[,mean(pwgtp15),by=SEX]})
v2<-DT[,mean(pwgtp15),by=SEX]

t3<-system.time(for (i in 1:1000) {sapply(split(DT$pwgtp15,DT$SEX),mean)})
v3<-sapply(split(DT$pwgtp15,DT$SEX),mean)

t4<-system.time(for (i in 1:1000) {mean(DT$pwgtp15,by=DT$SEX)})
v4<-mean(DT$pwgtp15,by=DT$SEX)

t5<-system.time(for (i in 1:1000) {rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]})
v5<-rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]

t6<-system.time(for (i in 1:1000) {mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)})
v6<-mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)

## Only v2 is using the data.table package

answer5<-"DT[,mean(pwgtp15),by=SEX]"

answer5

# See slide 15 in data.table lecture

