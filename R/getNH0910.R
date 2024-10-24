#' @title Descargar NH0910
#' @description
#' Descarga los datos del centro NH0910
#' @param destfile Ruta donde se descargará el .csv
#'
#' @return Si la descarga fue exitosa devuelve el dataset
#' @export
#'
#' @examples
#' getNH0910("NH0910.csv")
#' @author JM y VM
getNH0910 = function (destfile) {
  centro_url = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0910.csv"
  centro_archivo = destfile #Ruta donde se instala

  download.file(url = centro_url, destfile = centro_archivo)

  if (file.exists(centro_archivo)) {
    NH0910 <- readr::read_csv(centro_archivo)
    return(NH0910)
  } else {
    stop("Error: No se pudo descargar el archivo.")
  }
}
