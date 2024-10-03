#' @description
#' Suma valores positivos.
#' @author JM y VM
#' @examples
#' Suma(x = 5 , y = 2)
#' @return Devuelve la suma de dos numeros positivos
#' @title Suma de numeros


Suma <- function(x = 0, y = 0){
  if (!is.numeric(x) | !is.numeric(y)) {
    stop("El argumento 'x' debe ser numérico")
  }

  if (sign(x) == -1) {
    stop("No puedo sumar negativos: el argumento 'x' es negativo")
  }
  if (sign(y) == -1) {
    stop("No puedo sumar negativos: el argumento 'y' es negativo")
  }


  return(x + y)
}
