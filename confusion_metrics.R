
mtcars
names(mtcars)

#predict vs(enginetype)from wt and display
install.packages("caTools")

split=sample.split(mtcars,SplitRatio=0.8)
train_set=subset(mtcars,split==TRUE)
test_set=subset(mtcars,split==FALSE)
#fit model
model<-glm(vs   ~ wt +disp,data=train_set, family=binomial())
summary(model)

nrow(test_set)
pred<-predict(model,newdata=test_set,type="response")
pred

#actual classlabel for prediction
pred<-ifelse(pred>0.5,1,0)
pred
#variable<ifelse(condition,result_if cond_true,result_false)

#classification matrix
conf_matrix<-table(test_set$vs,pred)
conf_matrix
#table(actual value.predicted value)


#2 accuracy
#acc=1-mean(eror)

m<-mean(pred!=test_set$vs)#mean_error
m
print(paste("Accuracy:",1-m))

acc<-sum(diag(conf_matrix))/sum(conf_matrix)
print(paste("Accuracy from confusion matrix:",round(acc,2)))


#3other matrix

install.packages("Metrics")

#recall
print(paste("Recall:",recall(test_set$vs,pred)))

#precision
print(paste("Precision:",precision(test_set$vs,pred)))

#F1score
print(paste("F1 score:",f1(test_set$vs,pred)))

#accuracy
print(paste("Acuuracy:",accuracy(test_set$vs,pred)))


#4 ROC curave AOC curve

install.packages("pROC")
library(pROC)

roc_ob<-roc(test_set$vs,pred)
roc_ob
auc(roc_ob)
plot(roc_ob,col="red")


install.packages("caret")
library(caret)

confusionMatrix(conf_matrix)
confusionMatrix(table(test_set$vs,pred))

