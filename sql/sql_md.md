---
layout: default
title: SQL – Applied
parent: SQL
nav_order: 1
---

sql
================
2026-01-18

``` r
# rm(list = ls(all = TRUE))
# install.packages("DBI", "duckdb")
# install.packages("nycflights13", "tidyverse", "here")
# install.packages("here")
```

``` r
library(here)
```

    ## Warning: package 'here' was built under R version 4.4.3

    ## here() starts at C:/Users/danbo/Documents/GitHub/danbonfil.github.io

``` r
library(DBI)
```

    ## Warning: package 'DBI' was built under R version 4.4.3

``` r
library(duckdb)
```

    ## Warning: package 'duckdb' was built under R version 4.4.3

``` r
library(nycflights13)
```

    ## Warning: package 'nycflights13' was built under R version 4.4.3

``` r
library(tidyverse)
```

    ## Warning: package 'tidyverse' was built under R version 4.4.3

    ## Warning: package 'ggplot2' was built under R version 4.4.3

    ## Warning: package 'tidyr' was built under R version 4.4.3

    ## Warning: package 'readr' was built under R version 4.4.3

    ## Warning: package 'forcats' was built under R version 4.4.3

    ## Warning: package 'lubridate' was built under R version 4.4.3

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ## ✔ ggplot2   3.5.2     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.4     ✔ tidyr     1.3.1
    ## ✔ purrr     1.0.4

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

``` r
# GitHub raw link for the DuckDB database file
url <- "https://github.com/AU-datascience/data/raw/main/413-613/flights.duckdb"

# Local path to save the file
dest <- here("sql", "flights.duckdb")

# Download the file
download.file(url, dest, mode = "wb")
```

``` r
con <- dbConnect(duckdb(dbdir = "./flights.duckdb"))
class(con)
```

    ## [1] "duckdb_connection"
    ## attr(,"package")
    ## [1] "duckdb"

``` sql
SHOW TABLES;
```

<div class="knitsql-table">

| name     |
|:---------|
| airlines |
| airports |
| flights  |
| planes   |
| weather  |

5 records

</div>
