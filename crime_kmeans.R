library(readr)
crime_data<-read.csv('C:/Users/HP/Desktop/assignments submission/clustering/crime_data.csv')
View(crime_data)
crime<-scale(crime_data[,-1])
View(crime)

#elbow graph
library(factoextra)
fviz_nbclust(crime,kmeans,method='wss')+labs(subtitle = 'elbow graph')
#k=4

#k-means model
km<-kmeans(crime,4)
km$cluster
km$centers
final_data<-data.frame(crime_data[,1],km$cluster)
View(final_data)

#animation
library(animation)
km<-kmeans.ani(crime,4)
