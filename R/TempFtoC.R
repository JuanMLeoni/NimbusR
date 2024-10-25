#' @title Temperature Farenheit To Celsius
#' @description
#' Convierte la temperatura de Farenheit  a Celsius
#' @param temperature Temperatura en Farenheit (numeric)
#'
#' @return Temperatura en Celsius (numeric)
#' @export
#'
#' @examples
#' TempFtoC(32)
#' @author JM y VM
TempFtoC = function(temperature) {
  cli::cli_abort(is.numeric(temperature))
  return((temperature - 32)*5/9)
}
