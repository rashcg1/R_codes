n<-10000
count<-0
for (i in rnorm(n)){
  if (-1<i & i<1){
    count<-count+1
  }
}
answer<-count/n
answer
x<- rnorm(5)
for (i in x){
  print (i)}