data(iris)
View(iris)
d <- dist(iris[,-5])
d
View(as.matrix(d))

#Cmd scale
fit <- cmdscale(d,k=2)
fit
plot(x=fit[,1],y=fit[,2],col=as.numeric(iris[,5]))
legend("bottomright",legend = levels(iris$Species),col = 1:3)

#Clustering K-Means
clus <- kmeans(iris[,-5],3)
clus$cluster # - Il k means, invece parte da 1.

#Clustering Gerarchico
hclust(d, method="complete", members = NULL)
gerclu <- hclust(dist(iris[,-5]))
plot(gerclu)

#Pacchetto"cluster"
clusplot(x,clusters,color=TRUE,shade=TRUE,labels=2,lines=0)

library(cluster)
clusplot(iris[,-5],clus$cluster,color=TRUE,shade=TRUE)
clusplot(iris[,-5],clus$cluster,color=TRUE,shade=TRUE,label=2)
#Nel mio ambiente clusplot(iris[,-5],output$cluster,color=TRUE,shade=TRUE)

#Pacchetto dbscan
dbscan(x,eps,minPts=5)          #
predict(object,newdata = NULL)  #

clus1 <- dbscan(d,0.5,5)
clus1$cluster #Assegna ad ogni punto un cluster. Il cluster parte da 0
clusplot(iris[,-5],clus1$cluster,color=TRUE,shade=TRUE,lines=0)

clus1 <- dbscan(d,1,10) #Con diversi parametri abbiamo cluster diversi
clus1$cluster
clusplot(iris[,-5],clus1$cluster,color=TRUE,shade=TRUE,lines=0)
