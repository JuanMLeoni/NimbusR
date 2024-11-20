
# URL base para los tests
base_url <- "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/"

# Directorio temporal para pruebas
test_dir <- tempdir()

# Tests
test_that("Error cuando 'centros' es NULL", {
  expect_error(getCentros(centros = NULL, destfile = test_dir),
               "El parametro 'centros' debe ser un vector de nombres de archivos no vacio.")
})

test_that("Error cuando 'centros' no es un vector de caracteres", {
  expect_error(getCentros(centros = 123, destfile = test_dir),
               "El parametro 'centros' debe ser un vector de nombres de archivos no vacio.")
})

test_that("Error cuando 'destfile' es NULL o vacío", {
  expect_error(getCentros(centros = c("NH0910"), destfile = NULL),
               "El parametro 'destfile' debe ser una cadena de texto no vacia que indique el directorio destino.")
  expect_error(getCentros(centros = c("NH0910"), destfile = ""),
               "El parametro 'destfile' debe ser una cadena de texto no vacia que indique el directorio destino.")
})

test_that("Error si el directorio destino no existe", {
  expect_error(getCentros(centros = c("NH0910"), destfile = "directorio/no/existe"),
               "El directorio especificado en 'destfile' no existe.")
})

test_that("Descarga correcta de un archivo válido", {
  centros <- c("NH0910")
  resultados <- getCentros(centros = centros, destfile = test_dir)
  expect_true("NH0910" %in% names(resultados))
  expect_true(is.data.frame(resultados[["NH0910"]]))
  expect_gt(nrow(resultados[["NH0910"]]), 0) # Verifica que haya datos
})

test_that("Descarga múltiple correcta", {
  centros <- c("NH0910", "NH0472")
  resultados <- getCentros(centros = centros, destfile = test_dir)
  expect_true(all(centros %in% names(resultados)))
  lapply(resultados, function(df) {
    expect_true(is.data.frame(df))
    expect_gt(nrow(df), 0)
  })
})


