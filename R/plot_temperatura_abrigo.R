#' @title Serie de tiempo temperatura abrigo
#' @description
#' Genera un grafico de serie de tiempo que muestra la temperatura abrigo de cada estacion
#' @param dataset Dataset con datos de los centros (Deben tener columna "temperatura_abrigo_150cm")
#' @details
#' Los dataset deben tener una columna "id" para identificar el centro metereologico
#'
#' @return Grafico de la temperatura abrigo.
#' @export
#'
#' @examples
#' dataset <- NimbusR::centros_df
#' plot_temperatura_abrigo(dataset)
#' plot_temperatura_abrigo(dataset, titulo = "Temperatura Abrigo Mensual")
#' plot_temperatura_abrigo(df,c("red", "blue", "black","pink", "lightblue"), titulo = "Temperatura Abrigo Mensual")
#' @author JM y VM
plot_temperatura_abrigo <- function(dataset, colores = NULL, titulo = "Temperatura Abrigo") {
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

  num_estaciones <- length(unique(dataset$id))
  if (is.null(colores) || length(colores) < num_estaciones) {
    colores <- sample(colors(), num_estaciones)
  }

  # Graficar
  grafico <- dataset |>
    dplyr::mutate(mes = lubridate::month(fecha)) |>
    dplyr::group_by(id, mes) |>
    dplyr::summarise(temperatura_media = mean(temperatura_abrigo_150cm, na.rm = TRUE)) |>
    ggplot2::ggplot(ggplot2::aes(mes, temperatura_media)) +
    ggplot2::geom_line(ggplot2::aes(color = id), linewidth = 1.4) +
    ggplot2::scale_color_manual(values = colores) +
    ggplot2::labs(x = "Mes", y = "Temperatura Media (C\u00b0)", title = titulo, color = "Estaci\u00f3n") +
    ggplot2::theme_minimal(base_size = 14)

  return(grafico)
}
