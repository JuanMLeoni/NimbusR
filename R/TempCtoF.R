#' @title Temperature Celsius To Farenheit
#' @description
#' Convierte la temperatura de Celsius a Farenheit
#' @param temperature Temperatura en Celsius (numeric)
#'
#' @return Temperatura en Farenheit (numeric)
#' @export
#'
#' @examples
#' TempCtoF(10)
#' @author JM y VM
TempCtoF = function(temperature) {
  return((temperature *9/5) + 32)
}
