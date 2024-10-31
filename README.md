
<!-- README.md is generated from README.Rmd. Please edit that file -->

# NimbusR

<!-- badges: start -->

[![R-CMD-check](https://github.com/JuanMLeoni/NimbusR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/JuanMLeoni/NimbusR/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/JuanMLeoni/NimbusR/graph/badge.svg)](https://app.codecov.io/gh/JuanMLeoni/NimbusR)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

El objetivo de NimbusR es garantizar al desarrollador herramientas para
leer, analizar y trabajar con datos meteorológicos

## Instalación

Podes instalar la versión en desarrollo de Nimbus en
[GitHub](https://github.com/JuanMLeoni/NimbusR):

``` r
# install.packages("pak")
pak::pak("JuanMLeoni/NimbusR")
```

## Ejemplo

Para verificar que NimbusR se descargó de forma correcta probar con:

``` r
library(NimbusR)
TempCtoF(15)
#> [1] 59
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
