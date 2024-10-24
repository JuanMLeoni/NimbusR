#' @title Descargar NH0046
#' @description
#' Descarga los datos del centro NH0046
#' @param destfile Ruta donde se descargará el .csv
#'
#' @return Si la descarga fue exitosa devuelve el dataset
#' @export
#'
#' @examples
#' getNH0046("NH0046.csv")
#' @author JM y VM
#' @importFrom utils download.file
getNH0046 = function (destfile) {
  centro_url = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0046.csv"
  centro_archivo = destfile #Ruta donde se instala

  download.file(url = centro_url, destfile = centro_archivo)

  if (file.exists(centro_archivo)) {
    NH0046 <- readr::read_csv(centro_archivo)
    return(NH0046)
  } else {
    stop("Error: No se pudo descargar el archivo.")
  }
}
