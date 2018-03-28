
?read.csv()

#method1 Select the fiel manually
stats <- read.csv(file.choose())
Stats


#Method2:Set working Dirextory and Read Data
getwd()
#Windows
setwd("A:\\R\\DataSets")
#MAC
setwd("A:\R\DataSets")
getwd()
rm(stats)
stats <- read.csv("DemographicData.csv")
stats  

#----------Exploring Data
nrow(stats)
ncol(stats)
head(stats)#-first 6 rows
tail(stats)#-last 6 rows
head(stats,n=10)
#Structure
str(stats)
#str will give the catogorical data in the incoem column there are low incoem, high income etc.str assigns neumerical value
#runif() random numbers distributed uniformaly. we have rnorm(),ramndon numbers distributed normaly
summary(stats)


#------------------Using $ sign
head(stats)
stats[3,3]
stats[3,"Birth.rate"]
stats$Internet.users     #=stats[,"Internet.users]
stats$Internet.users[2]
levels(stats$Income.Group)   #to supply the factors


#-------------Basic operation with Data Frame
stats[1:10,]   #subsetting
stats[3:9,]
stats[c(4,100),]


#
is.data.frame(stats[1,])
is.data.frame(stats[,1])
is.data.frame(stats[,1,drop=F])
#multiply coloumn 
stats$Birth.rate * stats$Internet.users
#add a coloum
head(stats)
stats$mycol <- stats$Birth.rate * stats$Internet.users




#---filtering data frame
head(stats)
filter<- stats$Internet.users < 2
stats[filter,]
stats[stats$Birth.rate>40,]
stats[stats$Birth.rate>40 & stats$Internet.users < 2,]
stats[stats$Income.Group=="High income",]
levels(stats$Income.Group)
stats[stats$Country.Name=="Malta",]

#------------------Qplot--------------
#install.packages("ggplot2")
library(ggplot2)
qplot(data=stats,x=Internet.users)
qplot(data=stats,x=Income.Group, y=Birth.rate,size=10)
qplot(data=stats,x=Income.Group, y=Birth.rate,size=I(3),colour=I("blue"))
qplot(data=stats,x=Income.Group, y=Birth.rate,geom="boxplot")





