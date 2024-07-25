df <- data.frame(
  Name = c("A", "B", "C"),
  Age = c(25, 23, NA ),
  Score = c(95, NA, 78)
)
df

is.na(df)

mean(df$Age,na.rm= TRUE)

install.packages('Hmisc')
library(Hmisc)

data<-impute(df$age,fun=mean)
data

df1<-data.frame(
  id=c(1,2,3,4,5),
  name=c("x","y","z","w","z"),
  age=c(28,41,32,40,21),
  score=c(40,50,60,20,10)
)
df1

library(dplyr)
d<-df1 %>% select(name)
d

filter_df1<-df1%>%filter(age>30)
filter_df1

result<-df1%>% filter(age>30)%>%select(name)
result

Arr<-df1%>%arrange(name)
Arr

patt<-select(df1,starts_with("ag"))
patt

patt<-select(df1,-starts_with("ag"))
patt

patt<-select(df1,contains("ag"))
patt

patt<-select(df1,matches("ag"))
patt

add<-mutate(df1,ag_sc=age+score)
add

add<-transmute(df1,ag_sc=age+score)
add

summarise(df1,mean=mean(age))

new<-df1%>%slice(2,3)
new

new<-slice(df1,c(2,3))
new

new<-slice(df1,c(2:4))
new

df<-df1%>%slice(-2)
df

df<-df1%>%slice(-2,-4)
df


install.packages("caTools")
library(caTools)

#splitting
sp<-sample.split(df1$age,0.8)
sp

#training and test set
train<-subset(df1,sp==TRUE)
train
test<-subset(df1,sp==FALSE)
test

#scale
scale(df1$age,center=TRUE,scale=TRUE)


library(ggplot2)
plot<-
ggplot(data=df1,aes(x=age,y=score,col="blue",shape=name))+geom_point()

plot+facet_grid(age~.)+facet_grid(.~age)




