
data("iris")
head(iris)

#remove species column
library(dplyr)
data<-select(iris,c(1:4))
head(data)

df<-data
#remove rows with missing values
df<-na.omit(df)

install.packages("factoextra")
library(factoextra)

#Elbow test: to find optimal no of clusters

fviz_nbclust(df,kmeans,method="wss")

#implement kmeans using kmeans function
set.seed(123)
#optimal no of cluster is 2
km<-kmeans(df,centers = 2,nstart=25)

km
km$cluster
km$centers

#view results
fviz_cluster(km,data=df)

library(ggfortify)
autoplot(km,df,frame=TRUE)
