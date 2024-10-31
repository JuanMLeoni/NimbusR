
test_that("Validaciones en read_centro_csv - Parámetro 'centro'", {
  # Test para el parámetro 'centro' no es una cadena
  expect_error(read_centro_csv(123), "El parametro 'centro' debe ser una cadena de caracteres.")

  # Test para el parámetro 'centro' con longitud diferente a 1
  expect_error(read_centro_csv(c("centro1", "centro2")), "El parametro 'centro' debe ser una cadena de caracteres.")
})

test_that("Validaciones en read_centro_csv - URL del archivo", {
  expect_error(
    read_centro_csv("nombre_invalido"),
    "Error al leer el archivo en la URL: https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/nombre_invalido.csv"
  )
})

test_that("Validaciones en read_centro_csv - Lectura de archivo válido", {
  df_valido <- read_centro_csv("NH0910")
  expect_s3_class(df_valido, "data.frame")
  expect_true(nrow(df_valido) > 0)
})
