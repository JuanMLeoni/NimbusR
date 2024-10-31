#' Datos de centros meteorológicos
#'
#' Este conjunto de datos contiene información sobre los centros meteorológicos NH0910, NH0472, NH0437,
#' NH0098 y NH0046
#'
#' @docType data
#' @usage data(centros_df)
#' @format Un dataframe con `95,681` filas y `35` columnas:
#' \describe{
#'   \item{id}{(chr)ID de la estacion, datos categoricos.}
#'   \item{fecha}{(date)Fecha de la medicion, datos temporales.}
#'   \item{temperatura_abrigo_150cm}{(dbl)Temperatura medida en abrigo a 150 cm, datos numéricos.}
#'   \item{temperatura_abrigo_150cm_maxima}{(dbl)Temperatura máxima en abrigo a 150 cm, datos numéricos.}
#'   \item{temperatura_abrigo_150cm_minima}{(dbl)Temperatura mínima en abrigo a 150 cm, datos numéricos.}
#'   \item{temperatura_intemperie_5cm_minima}{(dbl)Temperatura mínima medida en intemperie a 5 cm del suelo, valores NA.}
#'   \item{temperatura_intemperie_50cm_minima}{(dbl)Temperatura mínima medida en intemperie a 50 cm del suelo, valores NA.}
#'   \item{temperatura_suelo_5cm_media}{(dbl)Temperatura media medida en el suelo a 5 cm de profundidad, valores NA.}
#'   \item{temperatura_suelo_10cm_media}{(dbl)Temperatura media medida en el suelo a 10 cm de profundidad, valores NA.}
#'   \item{temperatura_inte_5cm}{(lgl)Temperatura medida a 5 cm en intemperie, valores NA.}
#'   \item{temperatura_intemperie_150cm_minima}{(lgl)Temperatura mínima en intemperie a 150 cm, valores NA.}
#'   \item{humedad_suelo}{(lgl)Humedad del suelo, valores NA.}
#'   \item{precipitacion_pluviometrica}{(dbl)Precipitación pluviométrica en mm, datos numéricos.}
#'   \item{granizo}{(dbl)Indica presencia de granizo, valores NA.}
#'   \item{nieve}{(dbl)Indica presencia de nieve, valores NA.}
#'   \item{heliofania_efectiva}{(dbl)Heliofanía efectiva, valores NA.}
#'   \item{heliofania_relativa}{(dbl)Heliofanía relativa, valores NA.}
#'   \item{tesion_vapor_media}{(dbl)Tensión de vapor media, valores NA.}
#'   \item{humedad_media}{(lgl)Humedad relativa media, valores NA.}
#'   \item{humedad_media_8_14_20}{(dbl)Humedad relativa media registrada a las 8, 14 y 20 horas, valores NA.}
#'   \item{rocio_medio}{(dbl)Punto de rocío medio, valores NA.}
#'   \item{duracion_follaje_mojado}{(dbl)Duración del follaje mojado, valores NA.}
#'   \item{velocidad_viento_200cm_media}{(dbl)Velocidad media del viento a 200 cm de altura, valores NA.}
#'   \item{direccion_viento_200cm}{(lgl)Dirección del viento a 200 cm de altura, valores NA.}
#'   \item{velocidad_viento_1000cm_media}{(dbl)Velocidad media del viento a 1000 cm de altura, valores NA.}
#'   \item{direccion_viento_1000cm}{(chr)Dirección del viento a 1000 cm de altura, valores NA.}
#'   \item{velocidad_viento_maxima}{(lgl)Velocidad máxima del viento registrada, valores NA.}
#'   \item{presion_media}{(dbl)Presión atmosférica media, valores NA.}
#'   \item{radiacion_global}{(dbl)Radiación solar global medida en la estación, valores NA.}
#'   \item{radiacion_neta}{(dbl)Radiación neta medida en la estación, valores NA.}
#'   \item{evaporacion_tanque}{(lgl)Evaporación medida en tanque, valores NA.}
#'   \item{evapotranspiracion_potencial}{(dbl)Evapotranspiración potencial, valores NA.}
#'   \item{profundidad_napa}{(dbl)Profundidad de la napa freática, valores NA.}
#'   \item{horas_frio}{(dbl)Cantidad de horas de frío registradas, valores numéricos.}
#'   \item{unidad_frio}{(lgl)Unidad de medida para las horas de frío, valores NA.}
#' }
#' @source Datos ficticios para demostración.
#' @keywords datasets
"centros_df"
