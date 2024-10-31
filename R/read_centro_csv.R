#' @title Leer CSV de un centro desde URL
#' @description
#' La funcion importa a Rstudio el dataset del centro que queramos desde github, **SIN DESCARGAR EL ARCHIVO**
#' @param centro (str) Nombre del centro a descargar
#'
#' @return Si la descarga fue exitosa devuelve el dataset
#' @export
#'
#' @examples
#' NH0910 <- read_centro_csv("NH0910")
#' NH0910
#' @author JM y VM
#' @seealso [getNH0910()], [getNH0472()], [getNH0437()], [getNH0098()], [getNH0046()]
read_centro_csv = function(centro) {
  if (!is.character(centro) || length(centro) != 1) {
    cli::cli_abort("El parametro 'centro' debe ser una cadena de caracteres.")
  }

  url <- paste0("https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/", centro, ".csv")

  if (httr::http_error(url)) {
    cli::cli_abort(paste("Error al leer el archivo en la URL:", url))
  }

  # Intentar leer la URL y manejar el error
  tryCatch({
    centro_df = readr::read_csv(url)
    return(centro_df)
  }, error = function(e) {
    cli::cli_abort(paste("Error al leer el archivo en la URL:", url))
  })

  return(centro_df)
}
