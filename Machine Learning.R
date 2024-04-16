install.packages("caret")
install.packages("lattice")

library(ggplot2)
library(lattice)
library(caret)

modelos <- getModelInfo()
names(modelos)
modelLookup("knn")
modelLookup("neuralnet")
getModelInfo("neuralnet")

trainControl()

data("mtcars")

set.seed(123)
index <- createDataPartition(mtcars$mpg,
                             p = 0.7,
                             list = FALSE)

train_set <- mtcars[index, ]
test_set <- mtcars[-index, ]

head(test_set)

modelLookup("lm")
modelLookup("knn")
modelLookup("neuralnet")

#Funcion de control
ctrl <- trainControl(method ="cv", number = 10, verboseIter = TRUE)

#Regresion lineal
lr_model <- train(mpg ~ .,
        data = train_set,
        method ="lm",
        trControl = ctrl
)

lr_model

lr_predict <-predict(lr_model, test_set)
lr_rmse <- sqrt(mean(lr_predict-test_set$mpg)^2)
lr_rmse

#KNN model
knn_model <- train(mpg ~ .,
                  data = train_set,
                  method ="knn",
                  trControl = ctrl,
                  tuneGrid = expand.grid(k = seq(1,20,1))
)

knn_model
knn_predict <- predict(knn_model, test_set)
knn_rmse <- sqrt(mean((knn_predict-test_set$mpg)^2))

knn_rmse

#Red Neuronal
nn_model <- train(mpg ~ .,
                   data = train_set,
                   method ="neuralnet",
                   trControl = ctrl,
                   tuneGrid = expand.grid(layer1 = c(1:3), layer2 = c(1:3), layer3 = 0))
)

nn_model
nn_predict <- predict(nn_model, test_set)
nn_rmse <- sqrt(mean((nn_predict-test_set$mpg)^2))

nn_rmse

#comparar los 3 modelos de regresión
cat("Regresion lineal", lr_rmse, "\n")
cat("KNN", knn_rmse, "\n")
cat("Red Neuronal", nn_rmse, "\n")

class


#Funcion de control

train_set <- iris[index, ]
test_set <- iris[-index, ]

table(train_set$Species)



nn_model <- train(Species ~ .,
                  data = train_set,
                  method ="knn",
                  trControl = ctrl,
                  tuneGrid = expand.grid(k = seq(2,15,1)))

knn_predict <-predict(knn_model, test_set)