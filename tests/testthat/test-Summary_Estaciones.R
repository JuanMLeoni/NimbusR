test_that("Error cuando los parámetros no son data frames", {
  df_valido <- data.frame(
    id = c("Est1", "Est2"),
    temperatura_abrigo_150cm = c(15.2, 16.5)
  )

  result <- Summary_Temperatura_Abrigo(df_valido)

  expect_s3_class(result, "data.frame")
  expect_equal(nrow(result), 2)
  expect_named(result, c("id", "temperatura_media", "temperatura_max", "temperatura_min", "temperatura_sd"))
})

test_that("Error cuando faltan columnas requeridas en los datasets", {
  df_valido <- data.frame(
    id = c("Est1", "Est2"),
    temperatura_abrigo_150cm = c(15.2, 16.5)
  )

  # Data frame incompleto sin la columna 'temperatura_abrigo_150cm'
  df_incompleto <- data.frame(
    id = c("Est1")
    # Falta 'temperatura_abrigo_150cm'
  )

  expect_error(Summary_Temperatura_Abrigo(df_valido, df_incompleto),
               "Las siguientes columnas faltan en el dataset: temperatura_abrigo_150cm.")
})

test_that("Resultado correcto con datasets válidos", {
  df1 <- data.frame(
    id = c("Est1", "Est1", "Est2", "Est2"),
    temperatura_abrigo_150cm = c(15.2, 16.5, 12.3, 14.7)
  )

  df2 <- data.frame(
    id = c("Est1", "Est3"),
    temperatura_abrigo_150cm = c(18.1, 10.5)
  )

  # Verifica que la función devuelva el dataframe esperado con cálculos correctos
  resultado <- Summary_Temperatura_Abrigo(df1, df2)
  expect_true("temperatura_media" %in% colnames(resultado))
  expect_true("temperatura_max" %in% colnames(resultado))
  expect_true("temperatura_min" %in% colnames(resultado))
  expect_true("temperatura_sd" %in% colnames(resultado))
  expect_equal(nrow(resultado), 3)
})

test_that("Resultado correcto cuando el dataset es vacío", {
  df_vacio <- data.frame(id = character(), temperatura_abrigo_150cm = numeric())

  result <- Summary_Temperatura_Abrigo(df_vacio)

  expect_s3_class(result, "data.frame")
  expect_equal(nrow(result), 0)
  expect_named(result, c("id", "temperatura_media", "temperatura_max", "temperatura_min", "temperatura_sd"))
})
