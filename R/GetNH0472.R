#' @title Descargar NH0472
#' @description
#' Descarga los datos del centro NH0472
#' @param destfile Ruta donde se descargará el .csv
#'
#' @return Si la descarga fue exitosa devuelve el dataset
#' @export
#'
#' @examples
#' getNH0472("NH0472.csv")
#' @author JM y VM
getNH0472 = function (destfile) {
  centro_url = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0472.csv"
  centro_archivo = destfile #Ruta donde se instala

  download.file(url = centro_url, destfile = centro_archivo)

  if (file.exists(centro_archivo)) {
    NH0472 <- readr::read_csv(centro_archivo)
    return(NH0472)
  } else {
    stop("Error: No se pudo descargar el archivo.")
  }
}
