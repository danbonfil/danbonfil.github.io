sql
================
2026-01-18

``` r
install.packages(
  setdiff(
    c("DBI", "duckdb", "nycflights13", "tidyverse", "here"),
    rownames(installed.packages())
  )
)
```

``` r
library(here)
library(DBI)
library(duckdb)
library(nycflights13)
library(tidyverse)
```

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

\[1\] “duckdb_connection” attr(,“package”) \[1\] “duckdb”

``` r
res <- dbGetQuery(con, "
  SHOW TABLES;
")
knitr::kable(res)
```

| name     |
|:---------|
| airlines |
| airports |
| flights  |
| planes   |
| weather  |

<!-- ```{sql, connection=con}
SHOW TABLES;
```
-->
