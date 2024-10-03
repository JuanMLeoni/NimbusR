#' @description
#' Suma valores positivos.
#' @author JM y VM
#' @examples
#' Suma(x = 5 , y = 2)
#' @return Devuelve la suma de dos números positivos
#' @title Suma de números


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
