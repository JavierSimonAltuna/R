# Instalar el paquete 'xlsx'
install.packages("xlsx")

# Cargar el paquete
library("xlsx")

# Crear un dataframe con los datos
df <- data.frame(mtcars)

# Escribir el dataframe en un archivo Excel
write.xlsx(df, file = "mtcars.xlsx")



#Leer el excel mtcars en C:/Users/jsimo/OneDrive/Escritorio/ThePowerMba/R/R/mtcars.xlsx
library(readxl)

datos <- read_excel(path = "C:/Users/jsimo/OneDrive/Escritorio/ThePowerMba/R/R/mtcars.xlsx")
head (datos, n=5)
?mtcars

automaticos <- datos[datos$am==0,]
resume_at <- automaticos[,c("mpg","cyl","hp","gear")]

datos[datos$model=="Mazda RX4",]$gear



#Leer de una web (página de wikipedia)
install.packages("rvest")
library(rvest)
url <- "https://en.wikipedia.org/wiki/Men%27s_high_jump_world_record_progression"

page <- read_html(url)
tables <- html_table(html_elements(page,"table"))
table <- tables [[3]]

class(table)
head(table,n=5)
tail(table, n=5)

table$Mark

ny =table[table$Venue=="New York",]
ny
