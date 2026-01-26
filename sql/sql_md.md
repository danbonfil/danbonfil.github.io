---
layout: default
title: SQL – Applied
parent: SQL
nav_order: 1
---

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
#dbDisconnect(con_p)
```

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

``` r
res <- dbGetQuery(con, "
  DESCRIBE;
")
knitr::kable(res)
```

| database | schema | name | column_names | column_types | temporary |
|:---|:---|:---|:---|:---|:---|
| flights | main | airlines | carrier, name | VARCHAR, VARCHAR | FALSE |
| flights | main | airports | faa , name , lat , lon , alt , tz , dst , tzone | VARCHAR, VARCHAR, DOUBLE , DOUBLE , DOUBLE , DOUBLE , VARCHAR, VARCHAR | FALSE |
| flights | main | flights | year , month , day , dep_time , sched_dep_time, dep_delay , arr_time , sched_arr_time, arr_delay , carrier , flight , tailnum , origin , dest , air_time , distance , hour , minute , time_hour | INTEGER , INTEGER , INTEGER , INTEGER , INTEGER , DOUBLE , INTEGER , INTEGER , DOUBLE , VARCHAR , INTEGER , VARCHAR , VARCHAR , VARCHAR , DOUBLE , DOUBLE , DOUBLE , DOUBLE , TIMESTAMP | FALSE |
| flights | main | planes | tailnum , year , type , manufacturer, model , engines , seats , speed , engine | VARCHAR, INTEGER, VARCHAR, VARCHAR, VARCHAR, INTEGER, INTEGER, INTEGER, VARCHAR | FALSE |
| flights | main | weather | origin , year , month , day , hour , temp , dewp , humid , wind_dir , wind_speed, wind_gust , precip , pressure , visib , time_hour | VARCHAR , INTEGER , INTEGER , INTEGER , INTEGER , DOUBLE , DOUBLE , DOUBLE , DOUBLE , DOUBLE , DOUBLE , DOUBLE , DOUBLE , DOUBLE , TIMESTAMP | FALSE |

``` r
res <- dbGetQuery(con, "
  DESCRIBE airlines;
")
knitr::kable(res)
```

| column_name | column_type | null | key | default | extra |
|:------------|:------------|:-----|:----|:--------|:------|
| carrier     | VARCHAR     | YES  | NA  | NA      | NA    |
| name        | VARCHAR     | YES  | NA  | NA      | NA    |

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

``` sql
DESCRIBE airlines;
```

<div class="knitsql-table">

| column_name | column_type | null | key | default | extra |
|:------------|:------------|:-----|:----|:--------|:------|
| carrier     | VARCHAR     | YES  | NA  | NA      | NA    |
| name        | VARCHAR     | YES  | NA  | NA      | NA    |

2 records

</div>

``` sql
SELECT "tailnum", "year", "model" 
FROM planes;
```

<div class="knitsql-table">

| tailnum | year | model     |
|:--------|-----:|:----------|
| N10156  | 2004 | EMB-145XR |
| N102UW  | 1998 | A320-214  |
| N103US  | 1999 | A320-214  |
| N104UW  | 1999 | A320-214  |
| N10575  | 2002 | EMB-145LR |
| N105UW  | 1999 | A320-214  |
| N107US  | 1999 | A320-214  |
| N108UW  | 1999 | A320-214  |
| N109UW  | 1999 | A320-214  |
| N110UW  | 1999 | A320-214  |

Displaying records 1 - 10

</div>

``` sql
SELECT * 
FROM planes
LIMIT 5;
```

<div class="knitsql-table">

| tailnum | year | type | manufacturer | model | engines | seats | speed | engine |
|:---|---:|:---|:---|:---|---:|---:|---:|:---|
| N10156 | 2004 | Fixed wing multi engine | EMBRAER | EMB-145XR | 2 | 55 | NA | Turbo-fan |
| N102UW | 1998 | Fixed wing multi engine | AIRBUS INDUSTRIE | A320-214 | 2 | 182 | NA | Turbo-fan |
| N103US | 1999 | Fixed wing multi engine | AIRBUS INDUSTRIE | A320-214 | 2 | 182 | NA | Turbo-fan |
| N104UW | 1999 | Fixed wing multi engine | AIRBUS INDUSTRIE | A320-214 | 2 | 182 | NA | Turbo-fan |
| N10575 | 2002 | Fixed wing multi engine | EMBRAER | EMB-145LR | 2 | 55 | NA | Turbo-fan |

5 records

</div>

``` sql
SELECT DISTINCT "dest" 
FROM flights;
```

<div class="knitsql-table">

| dest |
|:-----|
| ATL  |
| MCO  |
| MSY  |
| XNA  |
| BNA  |
| ALB  |
| ORF  |
| ROC  |
| PVD  |
| ABQ  |

Displaying records 1 - 10

</div>

``` sql
SELECT "flight", "distance", "origin", "dest" 
FROM flights
WHERE "distance" < 50;
```

<div class="knitsql-table">

| flight | distance | origin | dest |
|-------:|---------:|:-------|:-----|
|   1632 |       17 | EWR    | LGA  |

1 records

</div>

``` sql
SELECT "flight", "month" 
FROM flights
WHERE "month" = 12;
```

<div class="knitsql-table">

| flight | month |
|-------:|------:|
|    745 |    12 |
|    839 |    12 |
|   1895 |    12 |
|   1487 |    12 |
|   2243 |    12 |
|    939 |    12 |
|   3819 |    12 |
|   1441 |    12 |
|   2167 |    12 |
|    605 |    12 |

Displaying records 1 - 10

</div>

``` sql
SELECT "flight", "origin" 
FROM flights
WHERE "origin" = 'JFK';
```

<div class="knitsql-table">

| flight | origin |
|-------:|:-------|
|   1141 | JFK    |
|    725 | JFK    |
|     79 | JFK    |
|     49 | JFK    |
|     71 | JFK    |
|    194 | JFK    |
|   1806 | JFK    |
|   1743 | JFK    |
|    303 | JFK    |
|    135 | JFK    |

Displaying records 1 - 10

</div>

``` sql
SELECT "flight", "origin", "dest" 
FROM flights
WHERE "origin" = 'JFK' AND "dest" = 'CMH';
```

<div class="knitsql-table">

| flight | origin | dest |
|-------:|:-------|:-----|
|   4146 | JFK    | CMH  |
|   3783 | JFK    | CMH  |
|   4146 | JFK    | CMH  |
|   3783 | JFK    | CMH  |
|   4146 | JFK    | CMH  |
|   3783 | JFK    | CMH  |
|   4146 | JFK    | CMH  |
|   3783 | JFK    | CMH  |
|   4146 | JFK    | CMH  |
|   3650 | JFK    | CMH  |

Displaying records 1 - 10

</div>

``` sql
SELECT
    DISTINCT "flight",
    "origin",
    "dest"
FROM
    flights
WHERE
    NOT ("origin" = 'JFK'
        OR "origin" = 'LGA')
    AND dest = 'CMH';
```

<div class="knitsql-table">

| flight | origin | dest |
|-------:|:-------|:-----|
|   4692 | EWR    | CMH  |
|   4250 | EWR    | CMH  |
|   4622 | EWR    | CMH  |
|   4230 | EWR    | CMH  |
|   3813 | EWR    | CMH  |
|   3842 | EWR    | CMH  |
|   5906 | EWR    | CMH  |
|   5679 | EWR    | CMH  |
|   4372 | EWR    | CMH  |
|   4316 | EWR    | CMH  |

Displaying records 1 - 10

</div>

``` sql
SELECT DISTINCT
    "flight",
    "origin",
    "dest"
FROM flights
WHERE
    "origin" NOT IN ('JFK', 'LGA')
    AND "dest" IN ('BWI', 'IAD', 'DCA');
```

<div class="knitsql-table">

| flight | origin | dest |
|-------:|:-------|:-----|
|   5821 | EWR    | IAD  |
|   4561 | EWR    | IAD  |
|   4709 | EWR    | DCA  |
|   3815 | EWR    | DCA  |
|   4091 | EWR    | IAD  |
|   3835 | EWR    | DCA  |
|   4636 | EWR    | DCA  |
|   4625 | EWR    | BWI  |
|   5899 | EWR    | DCA  |
|   4100 | EWR    | BWI  |

Displaying records 1 - 10

</div>

``` sql
SELECT "flight", "dep_delay" 
FROM flights
WHERE "dep_delay" IS NOT NULL;
```

<div class="knitsql-table">

| flight | dep_delay |
|-------:|----------:|
|   1545 |         2 |
|   1714 |         4 |
|   1141 |         2 |
|    725 |        -1 |
|    461 |        -6 |
|   1696 |        -4 |
|    507 |        -5 |
|   5708 |        -3 |
|     79 |        -3 |
|    301 |        -2 |

Displaying records 1 - 10

</div>

``` sql
SELECT "flight", "dep_delay" 
FROM flights
WHERE "dep_delay" IS NULL;
```

<div class="knitsql-table">

| flight | dep_delay |
|-------:|----------:|
|   4308 |        NA |
|    791 |        NA |
|   1925 |        NA |
|    125 |        NA |
|   4352 |        NA |
|   4406 |        NA |
|   4434 |        NA |
|   4935 |        NA |
|   3849 |        NA |
|    133 |        NA |

Displaying records 1 - 10

</div>
