#Principales paquetes:
#RODBC
#DBI
#RMYSQL
#RPOSTGRESQL
#RSQLITE
#DBPLYR

install.packages("RSQLite")
library(RSQLite)


#cREAR UNA CONEXION odbc
CON <- ODBCcONNECT ("MI_ODBC_DATA_SOURCE")

#eJECUTAR UNA CONSULTA SQL
query <- "SELECT * FROM Ventas"
resultado <- sqlQuery(con, "SELECT * FROM mi_tabla")
resultado <- sqlQuery(con, query)

#Cerrar una conexion
odbcClose(con)

#RSQLite
# Crear una conexion a una base de datos SQLite
con <- dbConnect(RSQLite::SQLite(), "C:/Users/jsimo/OneDrive/Escritorio/GESTION EPI'S/inventario.sqlite")
tablas <- dbListTables(con)
tablas
resultado <- dbGetQuery(con, "SELECT * FROM")

head(con)
plot (con)

# Ejecutar consulta SQL
resultado <- dbGetQuery(con, "SELECT * FROM mi_tabla")

#Cerrar la conexión
dbDisconnect

##RMYSQL
#Crear una conexion
# Crear una conexion a una base de datos SQLite
con <- dbConnect(RMySQL::MySQL(),
                 dbname = "mi_base_de_datos",
                 host ="localhost",
                 user = "usuario",
                 password = "contraseña")

##POSTGREESQL
nombre_usuario <- "Postgrees"
contraseña <- "Postgrees"
host <- "localhost"
puerto <- 5432
nombre_base_de_datos <- "tu_base_de_datos"

##POSTGREESQL
nombre_usuario <- "Postgree"
contraseña <- "tu_contraseña"
host <- "localhost"
puerto <- 5432
nombre_base_de_datos <- "tu_base_de_datos"