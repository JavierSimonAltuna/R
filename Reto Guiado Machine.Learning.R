install.packages("dplyr")
install.packages("caret")

library(caret)
library(dplyr)

data(package ="mlbench", PimaIndiansDiabetes2)
head(PimaIndiansDiabetes2)
summary(PimaIndiansDiabetes2)

data<- PimaIndiansDiabetes2 %>%
  select(pregnant, glucose, pressure, mass, pedigree, age, diabetes)%>%
  na.omit()

set.seed(478)
index <- createDataPartition(data$diabetes,
                             p=0.7,
                             list = FALSE)

index
train_set <- data[index,]
test_set <- data[-index,]

modelLookup("knn")

ctrl = trainControl(method = "cv", number =8, verboseIter = TRUE)
knn_params = expand.grid(k=c(2:20))
                    
knn_model <- train(diabetes ~ .,
                   data = train_set,
                   method = "knn",
                   trControl = ctrl,
                   tuneGrid = knn_params)

knn_model

plot(knn_model)

knn_predict <- predict(knn_model, test_set)
confusionMatrix(knn_predict, test_set$diabetes)

#Modelo de regresión Logistica
gm_model <- train(diabetes ~ .,
                   data = train_set,
                   method = "glm",
                   trControl = ctrl,
                   tuneGrid = NULL)

gm_model

glm_predict <- predict(gm_model, test_set)
confusionMatrix(glm_predict, test_set$diabetes)