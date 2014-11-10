install.packages("httpuv")
library(httr)
library(httpuv)
oauth_endpoints("github")
# 
myapp <- oauth_app("github","f7134a7d66211b25bbb6", "9eca26fd54e929c6a2adc1f88fb4ea817eda9e3d")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)


gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)

req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
stop_for_status(req)
content(req)
# curl -u Access Token:x-oauth-basic "https://api.github.com/users/jtleek/repos"
BROWSE("https://api.github.com/users/jtleek/repos",authenticate("Access Token","x-oauth-basic","basic"))


#Q2
install.packages("sqldf")
library(sqldf)
setwd("D:/CARLOS_DIAZ/MIS_DOC/Coursera")
fileurl <-("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")
download.file(fileurl, destfile="./getdata-data-ss06pid.csv")
acs <- read.csv("./getdata-data-ss06pid.csv", header=T, sep=",")
head(acs)
sqldf("select pwgtp1 from acs where AGEP < 50")

#Q3
length(unique(acs$AGEP)) # 91
sqldf("select distinct AGEP from acs")
hurl <- "http://biostat.jhsph.edu/~jleek/contact.html" 
con <- url(hurl)
htmlCode <- readLines(con)
close(con)
sapply(htmlCode[c(10, 20, 30, 100)], nchar)
#<meta name="Distribution" content="Global" /> 
#    45 
#<script type="text/javascript"> 
#    31 
#})(); 
#7 
#\t\t\t\t<ul class="sidemenu"> 
#    25
# Problem 5.
list.files()
data <- read.csv("./getdata-wksst8110.for", header=T)
head(data)
dim(data)
file_name <- "./getdata-wksst8110.for"
df <- read.fwf(file=file_name,widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
head(df)
sum(df[, 4])
# 32426.7

#QUIZ 3

file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
file.dest <- 'ACS.csv'

# download from the URL
download.file(file.url, file.dest)

# read the data
ACS <- read.csv('ACS.csv')

# create vector
ACS$agricultureLogical <- ifelse(ACS$ACR==3 & ACS$AGS==6,TRUE,FALSE)

# read lines
which(ACS$agricultureLogical)

# Preg2
file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
file.dest <- 'jeff.jpg'

# download from the URL
download.file(file.url, file.dest, mode='wb' )

install.packages("jpeg")

# load package
library(jpeg)

# load the data
picture <- readJPEG('jeff.jpg', native=TRUE)

# get the quantile info
quantile(picture, probs = c(0.3, 0.8) )

library(jsonlite)
file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
file.dest <- 'GDP.csv'

# download from the URL
download.file(file.url, file.dest )

# specify the right lines
rowNames <- seq(10,200, 2)

# read the data
gdp <- read.csv('GDP.csv', header=F, skip=5, nrows=190)
View(gdp)

# second data file
file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
file.dest <- 'GDP2.csv'

# download from the URL
download.file(file.url, file.dest )

# read second file
fed <- read.csv('GDP2.csv')
View(fed)

# merge datasets
combined <- merge(gdp, fed, by.x='V1', by.y='CountryCode', sort=TRUE)
View(combined)

# Q3.
# sort the data
combined[with(combined, order(-V2) )]

# Q4.
# OECD
mean(combined[combined$Income.Group=='High income: OECD',]$V2)
# non OECD
mean(combined[combined$Income.Group=='High income: nonOECD',]$V2)

# Q5.
# assign quentile values
quentile <- c(0.2,0.4,0.6,0.8,1)
q <- quantile(combined$V2, quentile)
q1 <- combined$V2 <= 38

ans <- xtabs(q1 ~ combined$Income.Group)
ans
 