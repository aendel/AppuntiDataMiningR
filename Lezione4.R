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
plot(graph_from_literal(a--+b,b+--c)) #a punta a b , c punta a b
plot(graph_from_literal(a+-+b,b+-+c)) #a e b / b e c si puntano a vicenda
plot(graph_from_literal(a:b:c---c:d:e)) #a/b/c collegati c/d/e collegati

gl <- graph_from_literal(a-b-c-d-e-f, a-g-h-b, h-e:f:i, j)
plot(gl)

"""
Un grafo realizzato con la funzione graph può presentare cappi, ripetizioni, nodi ect...
Con la funzione simplify si possono rimuovere ridondanze e loop.

"""
net <- simplify(net, remove.multiple = T, remove.loops = T)

g4s <- simplify(g4, remove.multiple = T, remove.loops = F,
                edge.attr.comb=c(weight="sum",type="ignore") )

fg <- make_full_graph(40) #Tutti i nodi connessi tra loro (eccetto i loop, forse)

tr <- make_tree(40, children = 3 , mode = "undirected")

ri <- make_ring(40)

er <- sample_gnm(n=100,m=40)

sw <- sample_smallworld(dim=2,size=10,nei=1,p=0.1)

ba <- sample_pa(n=100,power=1,m=1,directed=F)

g <- g1%m%g2 #Differenza
g <- complementer(g1) #Complementare
g <- g1%s%g2 #Intersezione
g <- g1%u%g2 #Unione (Prendo una volta sola vertici uguali)
g <- g1%du%g2 #Unione disgiunta (Se trovo più di una volta un arco tra due nodi uguali devono essere etichettati differentemente.)

"""Accesso a nodi e archi del grafo"""
E(g4) #Archi del grafo
V(g4) #Vertici del grafo

g4[] #Un oggetto igraph è effettivamente visualizzata una matrice

V(g4)$name

V(g4)$gender <- c("male","female","male","female","male","female")
E(g4)$type <- "email"
E(g4)$weight <- 10

g4 <- set_graph_attr(g4, "name","Email Network")
g4 <- delete_graph_attr(g4,"attributoDaEliminare")

read_graph(file,format=c("edgelist",...)) #l'array continua, i puntini sono per semplicità
write_graph(graph,file,format=c("edgelist","pajek"),...) #come sopra

g <- read_graph("prova.txt")
g
