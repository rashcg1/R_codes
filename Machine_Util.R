getwd()
setwd("A:\\R\\DataSets")
getwd()
util<-read.csv("Machine-Utilization.csv")
head(util,10)
str(util)
summary(util)


#deriving utilization coloumn
util$Utilization<-1-util$Percent.Idle
head(util,10)



#Handling date-times
tail(util)
?POSIXct
util$PosixTime<-as.POSIXct(util$Timestamp, format="%d/%m/%Y %H:%M")
head(util,10)


#Tip:How to rearrange the coloumns
util$Timestamp<-NULL
head(util,10)
util<-util[,c(4,1,2,3)]
head(util,10)



#What is list: it can store any type of data

RL1<-util[util$Machine=="RL1",]
summary(RL1)  
RL1$Machine<-factor(RL1$Machine)
summary(RL1)
str(RL1)

#Construct a List
#Vector of min mean and max
util_stats_rl1<-c(min(RL1$Utilization, na.rm=T),
                  mean(RL1$Utilization, na.rm=T),
                  max(RL1$Utilization, na.rm=T))
util_stats_rl1
#logical has utilization fallen below 90%? true /false

util_under_90<-length(which(RL1$Utilization<0.90))>0
util_under_90


#list

list_rl1<-list("RL1", util_stats_rl1,util_under_90)
list_rl1


# naming component of list

names(list_rl1)<- c("Machine","Stats","LowThreshold")

list_rl1

#another way
rm(list_rl1)
list_rl1

list_rl1<-list(Machine="RL1", Stats=util_stats_rl1,LowThreshold=util_under_90)
list_rl1


#Extracting components of list
#3 ways
#[]-will always return a list
#[[]]-will always return the actual object
#$- same as [[]] but prettier

list_rl1
list_rl1[1]
list_rl1[[1]]
list_rl1$Machine
list_rl1[2]
typeof(list_rl1[2])

list_rl1[[2]]
typeof(list_rl1[[2]])

list_rl1$Stats
typeof(list_rl1$Stats)


#how to access the 3rd element of the vector in max utilization?
list_rl1
list_rl1[[2]][3]
list_rl1$Stats[3]



list_rl1[3]
list_rl1[[3]]
list_rl1[[3]]
list_rl1$LowThreshold


#Adding and deleting list components
list_rl1
list_rl1[4]<-"New Information"
list_rl1
#another way
#vector : All hours where utilization is unknown (NA's)

list_rl1$UnknownHours<-RL1[is.na(RL1$Utilization),"PosixTime"]
list_rl1

#Remove the component:use Null method
list_rl1[4]<-NULL

list_rl1
#!Note:Numeration shifted

#Add another componetn

#Dataframe machine
list_rl1$Data<-RL1
list_rl1
summary(list_rl1)
str(list_rl1)



#Subsetting a list
list_rl1
list_rl1[1:3]
list_rl1[c(1,4)]
sublst_rl1<-list_rl1[c("Machine","Stats")]

sublst_rl1


#double square brackects are not for subsetting
list_rl1[[1:3]]#!Error: can only specify one thing in the bracket





#Building timeseries plot
library(ggplot2)
p<-ggplot(data=util)
p+geom_line(aes(x=PosixTime,y=Utilization,colour=Machine),size=1.2)+
  facet_grid(Machine~.)+
  geom_hline(yintercept = 0.90,colour="Gray", size=1.2,linetype=3)

myplot<-p+geom_line(aes(x=PosixTime,y=Utilization,colour=Machine),size=1.2)+
  facet_grid(Machine~.)+
  geom_hline(yintercept = 0.90,colour="Gray", size=1.2,linetype=3)

list_rl1$Plot<-myplot
list_rl1

summary(list_rl1)
str(list_rl1)













