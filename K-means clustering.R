library(readr)
universities<-read.csv('C:/Users/HP/Desktop/datasets/Universities.csv')
View(universities)
attach(universities)
univ<-scale(universities[,2:7])
View(univ)

########Elbow graph for K value############
library(factoextra)
fviz_nbclust(univ,kmeans,method="wss")+labs(subtitle='Elbow method')
#k=3

########cluster algorithm building#########
km<-kmeans(univ,3)
km$centers
km$cluster
clust<-data.frame("university"=universities[,1],"cluster"=km$cluster)
View(clust)

############Animation##########
install.packages('animation')
library(animation)
km<-kmeans.ani(universities[,-c(1)],4)
