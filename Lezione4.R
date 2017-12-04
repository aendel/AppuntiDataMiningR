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

g3 <- graph( c("John","Johnny","Ciaone","Punto a caso"))
plot(g3)
g3

g4 <- graph( c("John2","Johnny2","Ciaone2","Punto a caso2"),
                isolates=c("Jess","Mark","Pino"))
plot(g4)
g4


plot(graph_from_literal(a---b,b---c))
