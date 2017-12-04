#IGRAPH
install.packages("igraph")

library("igraph")

#bit.ly/netscix2016
#Tutorial igraph

g1 <- graph( edges=c(1,2, 2,3, 3,1),n=3,directed=F)
plot(g1)
