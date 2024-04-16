# Instalar el paquete 
install.packages("ggplot2")
install.packages("readr")
install.packages("profvis")
install.packages("dplyr")


data(diamonds)
write.csv(diamonds, "C:/Users/jsimo/OneDrive/Escritorio/ThePowerMba/R/R/diamonds.csv")

library(profvis)
library(ggplot2)
library(readr)
library(dplyr)


#Leer datos csv
profvis ({
path <- "C:/Users/jsimo/OneDrive/Escritorio/ThePowerMba/R/R/diamonds.csv"
datos <- read.csv(path)

resumen_diamantes <- datos%>% group_by(cut) %>%
  summarise(Media =mean(price))
resumen_diamantes


ggplot(resume_diamons,aes(x=Corte, y=Media))+
  geom_col()+
  geom_text(aes(label=Media))
})
