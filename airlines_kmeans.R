library(readxl)
airlines_data<-read_excel('C:/Users/HP/Desktop/assignments submission/clustering/EastWestAirlines.xlsx',sheet=2)
View(airlines_data)
airlines<-scale(airlines_data[,-1])
View(airlines)

#elbow graph
library(factoextra)
fviz_nbclust(airlines,kmeans,method='wss')
#k=7

#kmeans model
km<-kmeans(airlines,7)
km$centers
km$cluster
final_out<-data.frame("AIRLINES_ID"=airlines_data[,1],"cluster"=km$cluster)
View(final_out)

#animation
library(animation)
km<-kmeans.ani(airlines,7)
