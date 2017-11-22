#Cart Pacchetto rpart
#Alberto Cart usato per classificare, ritorna un albero di classificazione
rpart(forumula,data, method = "class")
#Successivamente usiamo la funzione predict()
predict(object, newdata, type = c("prob","class"))
#prob di default, possiamo scegliere tra prob e class
#Invece di restituire una foglia restituisce una distribuzione di probabilità
#Riga,campione(nuovo da classificare),colonna corrisponde alla classificare
#Se uso class ogni elemento di un vettore corrisponde ad un elemento nuovo da classificare
#ed il valore mi dice la classe di appartenzenza

#TP = TRUE POSITIVE
#FP = FALSE POSITIVE
#FN = FALSE NEGATIVE

#PRECISION = TP/TP+FP #

#RECALL = TP/TP+FN #Tasso di elemento per cui il nostro modello di classificazione
#riesce a trovare valori positivi

library(rpart) #includiamo il Pacchetto
View(iris)
model <- rpart(Species ~ .,data = iris , method = "class")
model
predictions <- predict(model, newdata=iris ,type = "class")
#Confrontare le predizioni con la specie reale
table(predictions, iris$Species)
#Ritorna una matrice dove ogni riga corrisponde ad una predizione
#ogni colonna corrisponde ad una classe reale
#Troviamo degli errori tra le due classi molto vicine tra di loro nello spazio
#In questo caso andiamo a calcolare la precision e la recall rispetto alle due
#classi su cui abbiamo dubbi
tbl <- table(predictions,iris$Species) #E' un oggetto table, possiamo usarlo come
#matrice
tbl[2,2]
#SE VOGLIAMO CALCOLARE LA precision
#sarà
precision <- tbl[2,2]/(tbl[2,2]+tbl[2,3])
#Ritorna 0,90 significa che su 100 predizioni positive 90 saranno corrette
#le altre 10 saranno errate.
#Chiamata anche PRV Positive Retrive Value
recall <- tbl[2,2]/(tbl[2,2]+tbl[3,2])
#Ritorna 0.98 significa che di quelle predizioni (90 corrette) c'è un 2% che non
#andremmo mai a riconoscere come positivi
#Prestazioni del nostro metodo, nel trovare gli elementi positivi.
#Esiste anche un altra misura :

tbl[2:3,2:3] #Prendiamo la sottomatrice
diag(tbl[2:3,2:3]) #estriamo la diagonale
rowSums(tbl[2:3,2:3]) #somma degli elementi nella sottomatrice
diag(tbl[2:3,2:3])/rowSums(tbl[2:3,2:3]) #ritorna valori di accuratezaz del metodo
#sviluppato

#########################################
#NAIVE BAYES#
#########################################
#Pacchetto e1071
naiveBayes(formula, data, laplace = 0,na.action = na.pass)
predict(object,newdata,type=c("class","raw"), threshold = 0.001, eps = 0)

model.nb <- naiveBayes(Species ~ . ,data = iris)
model.nb

#Calcola Prima A-Priori
#Successivamente likelyhood
#Probabilità maggiori di 1, non sono un errore, ma bensì il logaritmo della probabilità
#Lavora nello spazio dei logaritmi per evitare problemi di underflow

#Puliamo predictions per evitare errori
rm(predictions)

predictions <- predict(model.nb,iris)
tbl <- table(predictions,iris$Species)
tbl

######################################
#Classificatore SVM e1071
######################################
svm(formula, data = NULL , na.action = na.omit , scale = TRUE , kernel = "linear", ...)
#Il kernel di base è lineare, ma possiamo usare anche :
#polynomial
#radial basis
#sigmoid

predict(objet,newdata,na.action = na.omit)

model.svm <- svm(Species ~ ., data = iris)
model.svm

dim(iris) #di 150 punti, 51 sono difficili da Classificatore

rm(predictions) #Solo perché sto usando la stessa variabile
predictions <- predict(model.svm,iris)
tbl <- table(predictions,iris$Species)
tbl

###################################
Cart
trControl <- trainControl(method = "cv", number = 10 , savePredictions = TRUE)

model <- train(Species ~.,data = iris, method = 'nb',trControl= trControl)

model$finalModel
summary(model$finalModel)
