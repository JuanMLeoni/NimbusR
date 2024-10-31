
test_that("Falla si el argumento no es un data frame", {
  expect_error(plot_temperatura_abrigo("no_un_dataframe"),
               "El argumento 'dataset' debe ser un data frame.")
})

test_that("Falla si faltan columnas necesarias", {
  # Creamos un dataset que no tiene todas las columnas necesarias
  dataset_incompleto <- data.frame(fecha = as.Date("2023-01-01"), temperatura_abrigo_150cm = 15)
  expect_error(plot_temperatura_abrigo(dataset_incompleto),
               "El 'dataset' no contiene las columnas necesarias: id.")
})

test_that("Falla si la columna 'fecha' no es Date o POSIXt", {
  # Creamos un dataset donde 'fecha' no es del tipo correcto
  dataset_tipo_incorrecto <- data.frame(
    fecha = "2023-01-01",
    temperatura_abrigo_150cm = 15,
    id = "Estación_1"
  )
  expect_error(plot_temperatura_abrigo(dataset_tipo_incorrecto),
               "La columna 'fecha' debe ser de tipo Date o POSIXt.")
})

test_that("Genera gráfico correctamente con dataset válido", {
  # Creamos un dataset correcto para probar que la función devuelva un gráfico
  dataset_valido <- data.frame(
    fecha = as.Date(c("2023-01-01", "2023-02-01", "2023-03-01")),
    temperatura_abrigo_150cm = c(15, 16, 18),
    id = c("Estación_1", "Estación_1", "Estación_1")
  )

  grafico <- plot_temperatura_abrigo(dataset_valido)

  # Verificamos que el resultado sea un objeto ggplot
  expect_s3_class(grafico, "ggplot")
})
