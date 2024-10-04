#' @title Suma de números
#' @description
#' Suma números positivos.
#' @param x Argumento int positivo (valor default 1)
#' @param y Argumento int positivo (valor default 1)
#' @examples
#' Suma(x = 5 , y = 2)
#' Suma(5)
#' @return Devuelve la suma de dos números positivos
#' @author JM y VM


Suma <- function(x = 1, y = 1){
  if (!is.numeric(x) | !is.numeric(y)) {
    stop("Alguno de los argumentos no son números!")
  } else {
    if (sign(x) == -1 | sign(y) == -1 ) {
      stop("No puedo sumar números negativos")
    } else {
      return(x + y)
    }
  }
}
