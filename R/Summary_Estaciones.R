#' @title Summary de temperatura abrigo
#' @description
#' La funcion genera una summary para mostrar los estadisticos de los centros que solicites
#' @param ... Centros metereologicos
#' @return tibble
#' @export
#' @examples
#' centros <- NimbusR::centros_df
#' Summary_Temperatura_Abrigo(centros)
#' @author JM y VM
Summary_Temperatura_Abrigo = function (...) {
  Estaciones_lista <- list(...)

  if (!all(sapply(Estaciones_lista, is.data.frame))) {
    cli::cli_abort("Todos los parametros deben ser data frames.")
  }

  datos_combinados <- do.call(rbind, Estaciones_lista)

  required_columns <- c("id", "temperatura_abrigo_150cm")
  missing_columns <- setdiff(required_columns, names(datos_combinados))
  if (length(missing_columns) > 0) {
    cli::cli_abort("Las siguientes columnas faltan en los dataset: {paste(missing_columns, collapse = ', ')}.")
  }

  datos_combinados |>
    dplyr::group_by(id) |>
    dplyr::summarise(
      temperatura_media = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      temperatura_max = max(temperatura_abrigo_150cm, na.rm = TRUE),
      temperatura_min = min(temperatura_abrigo_150cm, na.rm = TRUE),
      temperatura_sd = sd(temperatura_abrigo_150cm, na.rm = TRUE)
    )
}
