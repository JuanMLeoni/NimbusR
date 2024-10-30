test_that("La función hizo la conversión correctamente", {
  expect_equal(TempFtoC(32), 0)
})
test_that("La función tiró error correctamente", {
  expect_error(TempFtoC("10"))
})
