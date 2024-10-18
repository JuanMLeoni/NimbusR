#' @title Descargar NH0437
#' @description
#' Descarga los datos del centro NH0437
#' @param destfile Ruta donde se descargará el .csv
#'
#' @return Si la descarga fue exitosa devuelve el dataset
#' @export
#'
#' @examples
#' getNH0437("datos/NH0437.csv")
#' @author JM y VM
getNH0437 = function (destfile) {
  centro_url = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0437.csv"
  centro_archivo = destfile #Ruta donde se instala

  download.file(url = centro_url, destfile = centro_archivo)

  if (file.exists(centro_archivo)) {
    NH0437 <- read_csv(centro_archivo)
    return(NH0437)
  } else {
    stop("Error: No se pudo descargar el archivo.")
  }
}
