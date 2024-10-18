test_that("La función hizo la conversión correctamente", {
  expect_equal(TempCtoF(0), 32)
})
test_that("La función tiró error correctamente", {
  expect_error(TempCtoF("10"))
})
