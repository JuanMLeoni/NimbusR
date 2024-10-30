
test_that("Falla si destfile es vacío o inválido", {
  expect_error(getNH0437(""), "El parametro 'destfile' debe ser una cadena de texto no vacia")
  expect_error(getNH0437(NULL), "El parametro 'destfile' debe ser una cadena de texto no vacia")
  expect_error(getNH0437(123), "El parametro 'destfile' debe ser una cadena de texto no vacia")
})


test_that("Falla si la URL no es accesible", {
  skip_on_cran()

  with_mocked_bindings(
    download.file = function(...) stop("Couldn't resolve host name"),
    expect_error(getNH0437(tempfile()), "Error en la descarga del archivo desde la URL proporcionada")
  )
})


test_that("Falla si el archivo no es un CSV válido", {
  archivo_temp <- tempfile(fileext = ".csv")

  with_mocked_bindings(
    download.file = function(...) writeLines("contenido no valido", archivo_temp),
    {
      expect_error(getNH0437(archivo_temp),
                   "El archivo descargado no contiene datos validos.")
    }
  )

  unlink(archivo_temp)
})

test_that("Falla si el archivo no se descarga correctamente", {
  archivo_temp <- tempfile(fileext = ".csv")

  # Simulamos que download.file no descarga el archivo
  with_mocked_bindings(
    download.file = function(...) {

    },
    {
      expect_error(getNH0437(archivo_temp),
                   "El archivo no se descargo correctamente.")
    }
  )
})
