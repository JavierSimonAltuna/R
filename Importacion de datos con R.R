#Importar ficheros Internet
download.file(url = "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data",
              destfile = "C:/Users/jsimo/OneDrive/Escritorio/ThePowerMba/R/R/DATOS/iris.data")

#LEER DATOS EN FORMATO TABLA
mis_datos <- read.table(file = "C:/Users/jsimo/OneDrive/Escritorio/ThePowerMba/R/R/DATOS/iris.data",
                        header = FALSE,
                        sep = ",",
                        col.names = c("A","B","C","D","class"),
                        stringsAsFactors = FALSE
                        )

head(mis_datos)

#leer archivos en formato csv
datos_csv <- read.csv(file = "C:/Users/jsimo/OneDrive/Escritorio/ThePowerMba/R/R/DATOS/iris.data",
                      header = TRUE,
                      sep = ","
)

head(datos_csv)

#Leer archivos con formato excell
install.packages("readxl")
library(readxl)

excel_sheets("datos/alumnos.xlsx")

datos_excell <- read_excel(path = "datos/alumnos.clsx",
                           sheet = "Datos")


head(datos_excel)

#leer archivos en formatos json
install.packages("jsonlite")
library(jsonlite)

datos_json <- read_json(path = "Datos/alumnos.json")


#Archivos cuya estructura desconocemos
file.show("datos/alumnos.xlsx")


#leer un archivos linea por linea
readLines("datos/diabetes.csv", n=5)
readlines("datos/alumnos.xlsx")