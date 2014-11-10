### Getting and Cleaning data with R ###

#Set working directory:

setwd('D:/CARLOS_DIAZ/MIS_DOC/R/Coursera/GCD')
getwd()

#Checking and creatinf directories:

if (!file.exists("Rawdata")) {
  dir.create("Rawdata")
}

#Downloading data [downloading.file()]:

fileurl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"

download.file(fileurl,destfile = "./Rawdata/cameras.csv")
list.files("./Rawdata")
datedownloaded <- date()
datedownloaded

# Reding local flat files

cameraData <- read.table("./Rawdata/cameras.csv", sep = ",", header = T)
head(cameraData)

# Reading Excel Files
install.packages("xlsx")
install.packages("rJava")
install.packages("xlsxjars")

fileurl2 <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileurl2, destfile = "./Rawdata/cameras.xlsx", method="curl")
dateDownloaded <- date()
dateDownloaded

install.packages("xlsx")
install.packages("rJava")
install.packages("xlsxjars")

cameraData2 <- read.xlsx("./Rawdata/cameras.xlsx", sheetIndex = 1, header = T)
head(cameraData)

#Reading XML Data
install.packages("XML")
library(XML)

fileurl <- "http: //www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileurl)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

names(rootNode)

##Quiz W1##

if(!file.exists("Quiz1")) {
  dir.create("Quiz1")
}
  
  

fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurl, destfile = "./Quiz1/quiz1P1.csv")

dataP1 <- read.csv("./Quiz1/quiz1P1.csv", header = T, select = c("VAL")

#DataP1_df <- data.frame(dataP1)

val24 <- subset(dataP1, VAL >= 24)
sum(complete.cases(val24))

#q3

fileurl <- "http://www.gsa.gov/dg/pbs/DATA.gov_NGAP.xlsx"
download.file(fileurl, destfile = "./Quiz1/tablaP3.xlsx")
install.packages("xlsx")
tablaP3 <- read.xlsx("./Quiz1/tablaP3.xlsx")

Zip = c(74136, 30329, 74136, 80203, 80120)
CuCurrent = c(0, 1, 1, 0, 1)
PoCurrent = c(0, 0, 0, 0, 0)
Contact = c(918-491-6998, 404-321-5711, 918-523-2516, 303-864-1919, 345-098-8890)
Ext = c(0, NA, 0, 0, 456)

dat = matrix(c(zip, CuCurrent, PoCurrent, Contact, Ext), byrow = F, nrow = 5)
colnames(dat) = c("Zip", "CuCurrent", "PoCurrent", "Contact", "Ext")
dat
        
        
sum(dat$Zip*dat$Ext,na.rm=T)
sum(Zip*Ext,na.rm=T)
#365...

#q4
install.packages("XML")
library("XML")
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileurl, useInternal = T)

#Q5
install.packages("data.table")
library(data.table)
fileurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileurl, destfile = "./Quiz1/P5.csv")
DT <- read.csv("./Quiz1/P5.csv", header = T)
DT1 <- fread("./Quiz1/P5.csv")
tapply(DT$pwgtp15,DT$SEX,mean)
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
DT[,mean(pwgtp15),by=SEX]
DT1[,mean(pwgtp15), by=SEX]
mean(DT$pwgtp15,by=DT$SEX)
sapply(split(DT$pwgtp15,DT$SEX),mean)
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
