#Reading the 
movies<- read.csv(file.choose())
head(movies)
colnames(movies)<- c("File", "Genre", "CriticRating", 
                     "AudienceRating","BudgetMillions", "Year")
head(movies)
tail(movies)
str(movies)
summary(movies)

factor(movies$Year)
movies$Year<-factor(movies$Year)
#---------------Aesthetic------------
library(ggplot2)
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))


#add geometry
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))+geom_point()


#add color
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))+geom_point()



#add size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=Genre))+geom_point()#-----Warning message:
#Using size for a discrete variable is not advised

#add size---better way

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions))+geom_point()


#improvising
#Plotting Layers

p<-ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions))


#point
p+geom_point()

#lines
p+geom_line()


#multiple layers
p+geom_point()+geom_line()

p+geom_line()+geom_point()


#---------------Overridding aesthetics

q<- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,colour=Genre,size=BudgetMillions))


#add geom layer
q+geom_point()


#overridding
#ex1
q+geom_point(aes(size=CriticRating))


#ex2
q+geom_point(aes(colour=BudgetMillions))

#q remains same
q+geom_point()


#ex3
q+geom_point(aes(x=BudgetMillions))+
  xlab("BudgetMillion$$$")


#ex4
p+geom_line()+geom_point()
#reducing the line size
p+geom_line(size=1)+geom_point()

#------------Mapping vs Setting

r<-ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r+geom_point()


#add color
#1Mapping
r+geom_point(aes(colour=Genre))
#2Setting
r+geom_point(colour="DarkGreen")

#error
#r+geom_point(aes(colour="DarkGreen"))----its like mapping the colour

#1.Mapping

r+geom_point(aes(size=BudgetMillions))

#2.Setting
r+geom_point(size=10)


#3Error
#r+geom_point(aes(size=10))----its very misleading if u are setting dont use aesthetic, if u are mapping dont forget aesthetic



#-------------------Geometry


#---------------Histogram and  Density Chrat

s<-ggplot(data=movies, aes(x=BudgetMillions))
s+geom_histogram(binwidth=10)

#adding colour

#s+geom_histogram(binwidth=10, fill="Green")#--set the colur
s+geom_histogram(binwidth=10, aes(fill=Genre))#--map the colur


#add a border
s+geom_histogram(binwidth=10, aes(fill=Genre),colour="Black")

#density chart
s+geom_density(aes(fill=Genre))
s+geom_density(aes(fill=Genre),position="Stack")

#Starting Layer tips
t<-ggplot(data=movies,aes(x=AudienceRating))
t+geom_histogram(binwidth = 10,fill="White", colour="Blue")


#another way to acheive this
t<-ggplot(data=movies)
t+geom_histogram(binwidth = 10,aes(x=AudienceRating),
                 fill="White", colour="Blue")#using overridding method 


#>>4
#we dont have to recreate the object like t.just override
t+geom_histogram(binwidth = 10,aes(x=CriticRating),
                 fill="White", colour="Blue")

#>>5
t<-ggplot()
#Skeleton plotwant use the plot on diffeternt data set








#-----------------Statisctcal Transformations
?geom_smooth
u<-ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))

u+geom_point()+geom_smooth()
u+geom_point()+geom_smooth(fill=NA)


#box plots

u<-ggplot(data=movies, aes(x=Genre, y=AudienceRating,colour=Genre))
u+geom_boxplot()
u+geom_boxplot(size=1.2)
u+geom_boxplot(size=1.2)+geom_point()


#tip/hack
u+geom_boxplot(size=1.2)+geom_jitter()#jitter is a good combination with boxplot
#anotehr way

u+geom_jitter()+geom_boxplot(size=1.2,alpha=0.5)#aplpha is incahrge of transperency 1-opaque 0-transperant


#>>6
v<-ggplot(data=movies, aes(x=Genre, y=CriticRating,colour=Genre))
v+geom_jitter()+geom_boxplot(size=1.2,alpha=0.5)









#---------------Facets
w<-ggplot(data=movies, aes(x=BudgetMillions))
w+geom_histogram(binwidth = 10, aes(fill=Genre),colour="Black")
#to differentiate  colours



#---facts
w+geom_histogram(binwidth = 10, aes(fill=Genre),colour="Black")+
  facet_grid(Genre~.)#Genre in rows and nothing in coloumns hence .
#the only problem is these hostograms are small, axis is uniform accross all hostograms, hence

w+geom_histogram(binwidth = 10, aes(fill=Genre),colour="Black")+
  facet_grid(Genre~.,scales = "free")




#facet for scaterplot
x<-ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))


x+geom_point(size=3)



#faceting
x+geom_point(size=3)+
  facet_grid(Genre~.)

x+geom_point(size=3)+
  facet_grid(.~Year)

x+geom_point(size=3)+
  facet_grid(Genre~Year)

x+geom_point(size=3)+
  geom_smooth()+
  facet_grid(Genre~Year)

x+geom_point(aes(size=BudgetMillions))+
  geom_smooth()+
  facet_grid(Genre~Year)
#1>>>(Still improve)








#-------------------Coordinate
#Limits
#Zoom


m<-ggplot(data=movies,aes(x=CriticRating, y=AudienceRating,size=BudgetMillions, colour=Genre))
m+geom_point()

m+geom_point()+xlim(50,100)#cut off the point to the left.Actua;;y removed teh points
m+geom_point()+xlim(50,100)+
  ylim(50,100)

#xlim and y lim wont work well always
n<-ggplot(data=movies,aes(x=BudgetMillions))

n+geom_histogram(binwidth = 10,aes(fill=Genre),colour="Black")

n+geom_histogram(binwidth = 10,aes(fill=Genre),colour="Black")+
  ylim(0,50)#----removed all the data after 50



#instead---Zoom

n+geom_histogram(binwidth = 10,aes(fill=Genre),colour="Black")+
  coord_cartesian(ylim=c(0,50))


#improve >>1

x+geom_point(aes(size=BudgetMillions))+
  geom_smooth()+
  facet_grid(Genre~Year)+
  coord_cartesian(ylim=c(0,100))



#------------Theme

#to improve charts

o<-ggplot(data=movies, aes(x=BudgetMillions))
h<-o+geom_histogram(binwidth=10, aes(fill=Genre),colour="Black")

h

#axeslable
h+xlab("MoneyAxis")+ylab("No of Movies")


#lableFormatting

h+xlab("MoneyAxis")+
  ylab("No of Movies")+
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size=30))


#tick marking formating

h+xlab("MoneyAxis")+
  ylab("No of Movies")+
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20))

  
#legend formating

h+xlab("MoneyAxis")+
  ylab("No of Movies")+
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1))





#title--add layer called ggtite

h+xlab("MoneyAxis")+
  ylab("No of Movies")+
  ggtitle("Movie Budget Disturbution")+
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(colour="DarkBlue",size=30,family="Courier"))
  
  
  
  
  























