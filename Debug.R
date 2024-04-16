#Localizar Error
comprobar_residencia <- function(localidad) {
  if(localidad == "Madrid"){
    TRUE
  } else{
    FALSE
  }
}


comprobar_edad <- function(edad){
  if(!is.numeric(edad)){
    stop("La edad debe ser un número", call.= FALSE)
  } else if(
    edad > 18){
    TRUE
  } else {
    FALSE
  }
}

comprobar_acceso <- function(localidad,edad){
  if(comprobar_edad(edad) & comprobar_residencia(localidad)){
    print("Mostrar contenido")
  } else {
    print("No Mostrar contenido")
  }
}

comprobar_acceso("Madrid", 35)

traceback()

debug(comprobar_acceso)
comprobar_acceso("Madrid", 35)
undebug(comprobar_acceso)
