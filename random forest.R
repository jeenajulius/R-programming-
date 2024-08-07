
install.packages("caTools")
install.packages("Metrics")
library(caTools)
library(Metrics)

data("iris")
sp=sample.split(iris,SplitRatio = 0.8)
test_set=subset(iris,sp==TRUE)
train_set=subset(iris,sp==FALSE)

install.packages("randomForest")
library(randomForest)
set.seed(123)
model<- randomForest(Species ~.,data= test_set)
model

plot(model)
pred<-predict(model,newdata = train_set)

