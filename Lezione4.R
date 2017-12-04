#IGRAPH
install.packages("igraph")

library("igraph")

#bit.ly/netscix2016
#Tutorial igraph

g1 <- graph( edges=c(1,2, 2,3, 3,1),n=3,directed=F)
plot(g1)
g1

""" Output g1
IGRAPH U--- 3 3 -- #attributi
+ edges:
[1] 1--2 2--3 1--3 #archi
"""

#n numero di nodi.
g2 <- graph( edges=c(1,2, 2,3, 3,1),n=10)
plot(g2)
g2
