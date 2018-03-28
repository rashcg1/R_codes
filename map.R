crime <- read.csv(file.choose())

cameras <- read.csv(file.choose())

head(crime)
head(cameras)

install.packages("ggmap")
library("ggmap")
get_map(location=c(CCTVLatitide_Trim,y=CCTVLongitude_Trim,color="red"))
?qmap

