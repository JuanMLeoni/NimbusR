#' @title Descarga de centros
#' @description
#' Función que permite descargar en un directorio los centros que se desean
#'
#'
#' @param centros Un vector donde se indica los centros que se quieren descargar
#' @param destfile Ruta donde se descargarán los .csv
#'
#' @return Si la descarga fue exitosa devuelve una lista de datasets
#' @export
#'
#' @examples
#' getCentros(c("NH0910", "NH0472"), file.path(tempdir()) )
#'
#' @author JM y VM
#' @seealso [centros_df] , [getNH0472()], [getNH0437()], [getNH0098()], [getNH0046()]
getCentros = function(centros = NULL, destfile) {
  base_url <- "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/"

  if (is.null(centros) || !is.character(centros) || length(centros) == 0) {
    cli::cli_abort("El parametro 'centros' debe ser un vector de nombres de archivos no vacio.")
  }

  if (missing(destfile) || !is.character(destfile) || destfile == "") {
    cli::cli_abort("El parametro 'destfile' debe ser una cadena de texto no vacia que indique el directorio destino.")
  }

  if (!dir.exists(destfile)) {
    cli::cli_abort("El directorio especificado en 'destfile' no existe. Por favor, cree el directorio primero.")
  }

  resultados <- list()

  for (nombre_centro in centros) {
    centro_url <- paste0(base_url, nombre_centro, ".csv")
    ruta_archivo <- file.path(destfile, paste0(nombre_centro, ".csv"))

    cli::cli_inform("Descargando {nombre_centro}.csv desde {centro_url}...")

    tryCatch({
      download.file(url = centro_url, destfile = ruta_archivo)
    }, error = function(e) {
      cli::cli_abort("Error en la descarga del archivo desde la URL proporcionada.")
    })

    if (file.exists(ruta_archivo)) {
      datos <- tryCatch({
        readr::read_csv(ruta_archivo)
      }, error = function(e) {
        cli::cli_warn("No se pudo leer el archivo descargado: {nombre_centro}.csv. Verifique el archivo.")
        NULL
      })

      if (!is.null(datos)) {
        if (nrow(datos) == 0 || ncol(datos) == 0) {
          cli::cli_warn("El archivo {nombre_centro}.csv no contiene datos validos.")
          next
        } else {
          resultados[[nombre_centro]] <- datos
        }
      }
    }
  }

  return(resultados)
}


