
<!-- README.md is generated from README.Rmd. Please edit that file -->

# chkmate

<!-- badges: start -->

<!-- badges: end -->

The goal of chkmate is to read results from
[rchk](https://github.com/kalibera/rchk) into a tibble

## Installation

``` r
pak::pkg_install("romainfrancois/chkmate")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(chkmate)

log <- system.file(
  "example_rchk", "dplyr_0.8.0.9008.tar.gz-c0b210930e7a4463a181e422cc216d29", 
  package = "chkmate"
)
read_rchk(log)
#> # A tibble: 266 x 5
#>    fun                 type  description             file             line 
#>    <chr>               <chr> <chr>                   <chr>            <chr>
#>  1 GroupSliceIndices<… UP    "ignoring variable <un… ""               ""   
#>  2 GroupSliceIndices<… UP    "ignoring variable <un… ""               ""   
#>  3 Rcpp::Armor<SEXPRE… PB    "has possible protecti… /opt/R-svn/pack… 47   
#>  4 Rcpp::Armor<SEXPRE… PB    "has negative depth "   /opt/R-svn/pack… 41   
#>  5 Rcpp::Armor<SEXPRE… UP    "attempt to unprotect … /opt/R-svn/pack… 41   
#>  6 Rcpp::Armor<SEXPRE… PB    "has possible protecti… /opt/R-svn/pack… 42   
#>  7 Rcpp::DataFrame_Im… UP    "ignoring variable <un… ""               ""   
#>  8 Rcpp::DataFrame_Im… UP    "ignoring variable <un… ""               ""   
#>  9 Rcpp::DataFrame_Im… UP    "ignoring variable <un… ""               ""   
#> 10 Rcpp::DataFrame_Im… UP    "ignoring variable <un… ""               ""   
#> # … with 256 more rows
```
