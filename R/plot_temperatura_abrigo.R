#' @title Serie de tiempo temperatura abrigo
#' @description
#' Genera un grafico de serie de tiempo que muestra la temperatura abrigo de cada estacion
#' @param ... Datasets de los centros a graficar (separados por comas).
#'
#' @return Gráfico de la temperatura abrigo.
#' @export
#'
#' @examples
#' plot_temperatura_abrigo(NH0472, otro_dataset)
#' @author JM y VM
plot_temperatura_abrigo <- function(...) {
  # Combina los datasets
  centros_list <- list(...)
  centros_df <- bind_rows(centros_list, .id = "id")

  # Graficar
  ggplot(centros_df |>
           mutate(mes = month(fecha)) |>
           group_by(id, mes) |>
           summarise(temperatura_media = mean(temperatura_abrigo_150cm, na.rm = TRUE)) ) +
    geom_line(aes(x = mes, y = temperatura_media, color = id)) +
    labs(x = "Mes", y = "Temperatura Media", title = "Serie de Tiempo de Temperatura Abrigo") +
    theme_minimal()
}
