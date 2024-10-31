#' @title Serie de tiempo temperatura abrigo
#' @description
#' Genera un grafico de serie de tiempo que muestra la temperatura abrigo de cada estacion
#' @param dataset Dataset con datos de los centros (Deben tener columna "temperatura_abrigo_150cm")
#'
#' @return Grafico de la temperatura abrigo.
#' @export
#'
#' @examples
#'
#' @author JM y VM
plot_temperatura_abrigo <- function(dataset) {

  # Validaciones de `dataset` y columnas
  if (!"data.frame" %in% class(dataset)) {
    cli::cli_abort("El argumento 'dataset' debe ser un data frame.")
  }

  required_cols <- c("fecha", "temperatura_abrigo_150cm", "id")
  missing_cols <- setdiff(required_cols, colnames(dataset))

  if (length(missing_cols) > 0) {
    cli::cli_abort("El 'dataset' no contiene las columnas necesarias: {paste(missing_cols, collapse = ', ')}.")
  }

  if (!inherits(dataset$fecha, "Date") && !inherits(dataset$fecha, "POSIXt")) {
    cli::cli_abort("La columna 'fecha' debe ser de tipo Date o POSIXt.")
  }

  # Graficar
  grafico <- dataset |>
    mutate(mes = month(fecha)) |>
    group_by(id, mes) |>
    summarise(temperatura_media = mean(temperatura_abrigo_150cm, na.rm = TRUE)) |>
    ggplot(aes(mes, temperatura_media)) +
    geom_line(aes(color = id), linewidth = 1.4) +
    labs(x = "Mes", y = "Temperatura Media (C°)", title = "Serie de Tiempo Mensual de Temperatura Abrigo", color = "Estacion") +
    theme_minimal(base_size = 14)

  return(grafico)
}
