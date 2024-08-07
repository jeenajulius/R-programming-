
data("USArrests")
names(USArrests)
head(USArrests)

#assign this to a data frame
df<-USArrests
#remove rows with missing values
df<-na.omit(df)

#scale all column values
df<-scale(df)
head(df)

install.packages("factoextra")
library(factoextra)

#Elbow test: to find optimal no of clusters
#factorial visualization of no of clusters
#within cluster sum of squares

fviz_nbclust(df,kmeans,method="wss")

#implement kmeans using kmeans function
set.seed(123)

#optimal no of cluster is 4
km<-kmeans(df,centers = 4,nstart=25)

#view results
km
km$cluster
km$centers

#plot results 1
fviz_cluster(km,data=df)

#plot results 2
install.packages("ggfortify")
library(ggfortify)
autoplot(km,df,frame=TRUE)

#mean of each cluster
aggregate(USArrests,by=list(cluster=km$cluster),mean)

#add a new column cluster
cbind(USArrests,cluster=km$cluster)
