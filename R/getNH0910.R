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
  if (missing(centro_archivo) || !is.character(centro_archivo) || destfile == "") {
    cli::cli_abort("El parametro 'destfile' debe ser una cadena de texto no vacia.")
  }

  tryCatch({
    download.file(url = centro_url, destfile = centro_archivo)
  }, error = function(e) {
    cli::cli_abort("Error en la descarga del archivo desde la URL proporcionada.")
  })

  if (file.exists(centro_archivo)) {
    expect_error(
      tryCatch({
        NH0910 <- readr::read_csv(centro_archivo)
      }, error = function(e) {
        cli::cli_abort("No se pudo leer el archivo descargado. Verifique que el archivo sea un CSV valido.")
      }),
      if (nrow(NH0910) == 0 || ncol(NH0910) == 0) {
        cli::cli_abort("El archivo descargado no contiene datos validos.")}
    )


    return(NH0910)

  } else {
    cli::cli_abort("El archivo no se descargo correctamente.")
  }
}
