#' Metadatos de centros metereologicos
#'
#' Este conjunto de datos contiene metadatos de los centros metereologicos
#'
#' @docType data
#' @usage data(metadatos)
#' @format Un dataframe con `258` filas y `11` columnas:
#' \describe{
#'   \item{id}{(chr) Id del centro meteorológico.}
#'   \item{nombre}{(chr) Nombre del centro}
#'   \item{tipo}{(chr) Tipo del centro}
#'   \item{localidad}{(chr) Localidad del centro}
#'   \item{provincia}{(chr) Provincia donde se encuentra el centro}
#'   \item{lat}{(dbl) Latitud geografica del centro}
#'   \item{lon}{(dbl) Longitud geografica del centro}
#'   \item{altura}{(dbl) Altura del nivel del mar del centro}
#'   \item{ubicacion}{(chr) Direccion del centro}
#' }
#' @source "https://github.com/rse-r/intro-programacion/blob/main/datos/metadatos_completos.csv"
#' @seealso [centros_df]
#' @keywords datasets
"metadatos"
