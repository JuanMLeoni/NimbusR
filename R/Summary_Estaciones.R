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
Summary_Temperatura_Abrigo = function(...) {
  Estaciones_lista <- list(...)

  if (!all(sapply(Estaciones_lista, is.data.frame))) {
    cli::cli_abort("Todos los parámetros deben ser data frames.")
  }

  # Definir columnas requeridas
  required_columns <- c("id", "temperatura_abrigo_150cm")

  # Verificar si faltan columnas en los dataframes
  for (df in Estaciones_lista) {
    missing_columns <- setdiff(required_columns, names(df))
    if (length(missing_columns) > 0) {
      cli::cli_abort("Las siguientes columnas faltan en el dataset: {paste(missing_columns, collapse = ', ')}.")
    }
  }

  # Combinar dataframes
  datos_combinados <- do.call(rbind, Estaciones_lista)

  # Verificar si el dataframe combinado está vacío
  if (nrow(datos_combinados) == 0) {
    return(data.frame(
      id = character(0),
      temperatura_media = numeric(0),
      temperatura_max = numeric(0),
      temperatura_min = numeric(0),
      temperatura_sd = numeric(0)
    ))
  }

  datos_combinados |>
    dplyr::group_by(id) |>
    dplyr::summarise(
      temperatura_media = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      temperatura_max = max(temperatura_abrigo_150cm, na.rm = TRUE),
      temperatura_min = min(temperatura_abrigo_150cm, na.rm = TRUE),
      temperatura_sd = sd(temperatura_abrigo_150cm, na.rm = TRUE),
      .groups = "drop"  # Para evitar advertencias sobre grupos
    )
}
