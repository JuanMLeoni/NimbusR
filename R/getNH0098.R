#' @title Descargar NH0098
#' @description
#' Descarga los datos del centro NH0098
#' @param destfile Ruta donde se descargará el .csv
#'
#' @return Si la descarga fue exitosa devuelve el dataset
#' @export
#'
#' @examples
#' getNH0098("NH0098.csv")
#' @author JM y VM
getNH0098 = function (destfile) {
  centro_url = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0098.csv"
  centro_archivo = destfile #Ruta donde se instala

  download.file(url = centro_url, destfile = centro_archivo)

  if (file.exists(centro_archivo)) {
    NH0098 <- readr::read_csv(centro_archivo)
    return(NH0098)
  } else {
    stop("Error: No se pudo descargar el archivo.")
  }
}
