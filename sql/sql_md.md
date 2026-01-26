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

``` sql
  SHOW TABLES;
```

| name     |
|:---------|
| airlines |
| airports |
| flights  |
| planes   |
| weather  |

``` sql
  DESCRIBE;
```

| database | schema | name | column_names | column_types | temporary |
|:---|:---|:---|:---|:---|:---|
| flights | main | airlines | carrier, name | VARCHAR, VARCHAR | FALSE |
| flights | main | airports | faa , name , lat , lon , alt , tz , dst , tzone | VARCHAR, VARCHAR, DOUBLE , DOUBLE , DOUBLE , DOUBLE , VARCHAR, VARCHAR | FALSE |
| flights | main | flights | year , month , day , dep_time , sched_dep_time, dep_delay , arr_time , sched_arr_time, arr_delay , carrier , flight , tailnum , origin , dest , air_time , distance , hour , minute , time_hour | INTEGER , INTEGER , INTEGER , INTEGER , INTEGER , DOUBLE , INTEGER , INTEGER , DOUBLE , VARCHAR , INTEGER , VARCHAR , VARCHAR , VARCHAR , DOUBLE , DOUBLE , DOUBLE , DOUBLE , TIMESTAMP | FALSE |
| flights | main | planes | tailnum , year , type , manufacturer, model , engines , seats , speed , engine | VARCHAR, INTEGER, VARCHAR, VARCHAR, VARCHAR, INTEGER, INTEGER, INTEGER, VARCHAR | FALSE |
| flights | main | weather | origin , year , month , day , hour , temp , dewp , humid , wind_dir , wind_speed, wind_gust , precip , pressure , visib , time_hour | VARCHAR , INTEGER , INTEGER , INTEGER , INTEGER , DOUBLE , DOUBLE , DOUBLE , DOUBLE , DOUBLE , DOUBLE , DOUBLE , DOUBLE , DOUBLE , TIMESTAMP | FALSE |

``` sql
  DESCRIBE airlines;
```

| column_name | column_type | null | key | default | extra |
|:------------|:------------|:-----|:----|:--------|:------|
| carrier     | VARCHAR     | YES  | NA  | NA      | NA    |
| name        | VARCHAR     | YES  | NA  | NA      | NA    |

``` sql
  SELECT tailnum, year, model
  FROM planes
  LIMIT 5;
```

| tailnum | year | model     |
|:--------|-----:|:----------|
| N10156  | 2004 | EMB-145XR |
| N102UW  | 1998 | A320-214  |
| N103US  | 1999 | A320-214  |
| N104UW  | 1999 | A320-214  |
| N10575  | 2002 | EMB-145LR |

``` sql
  SELECT *
  FROM planes
  LIMIT 5;
```

| tailnum | year | type | manufacturer | model | engines | seats | speed | engine |
|:---|---:|:---|:---|:---|---:|---:|---:|:---|
| N10156 | 2004 | Fixed wing multi engine | EMBRAER | EMB-145XR | 2 | 55 | NA | Turbo-fan |
| N102UW | 1998 | Fixed wing multi engine | AIRBUS INDUSTRIE | A320-214 | 2 | 182 | NA | Turbo-fan |
| N103US | 1999 | Fixed wing multi engine | AIRBUS INDUSTRIE | A320-214 | 2 | 182 | NA | Turbo-fan |
| N104UW | 1999 | Fixed wing multi engine | AIRBUS INDUSTRIE | A320-214 | 2 | 182 | NA | Turbo-fan |
| N10575 | 2002 | Fixed wing multi engine | EMBRAER | EMB-145LR | 2 | 55 | NA | Turbo-fan |

``` sql
  SELECT DISTINCT dest
  FROM flights
  LIMIT 5;
```

| dest |
|:-----|
| ATL  |
| MCO  |
| MSY  |
| XNA  |
| BNA  |

``` sql
  SELECT flight, distance, origin, dest
  FROM flights
  WHERE "distance" < 50;
```

| flight | distance | origin | dest |
|-------:|---------:|:-------|:-----|
|   1632 |       17 | EWR    | LGA  |

``` sql
  SELECT flight, month
  FROM flights
  WHERE "month" = 12
  LIMIT 5;
```

| flight | month |
|-------:|------:|
|    745 |    12 |
|    839 |    12 |
|   1895 |    12 |
|   1487 |    12 |
|   2243 |    12 |

``` sql
  SELECT flight, origin
  FROM flights
  WHERE "origin" = 'JFK'
  LIMIT 5;
```

| flight | origin |
|-------:|:-------|
|   1141 | JFK    |
|    725 | JFK    |
|     79 | JFK    |
|     49 | JFK    |
|     71 | JFK    |

``` sql
  SELECT flight, origin, dest
  FROM flights
  WHERE "origin" = 'JFK' AND "dest" = 'CMH'
  LIMIT 5;
```

| flight | origin | dest |
|-------:|:-------|:-----|
|   4146 | JFK    | CMH  |
|   3783 | JFK    | CMH  |
|   4146 | JFK    | CMH  |
|   3783 | JFK    | CMH  |
|   4146 | JFK    | CMH  |

``` sql
  SELECT
      DISTINCT flight,
      origin,
      dest
  FROM
      flights
  WHERE
      NOT (origin = 'JFK'
          OR origin = 'LGA')
      AND dest = 'CMH'
  LIMIT 5;
```

| flight | origin | dest |
|-------:|:-------|:-----|
|   4250 | EWR    | CMH  |
|   4692 | EWR    | CMH  |
|   4622 | EWR    | CMH  |
|   3852 | EWR    | CMH  |
|   4240 | EWR    | CMH  |

``` sql
  SELECT DISTINCT
      flight,
      origin,
      dest
  FROM flights
  WHERE
      origin NOT IN ('JFK', 'LGA')
      AND dest IN ('BWI', 'IAD', 'DCA')
  LIMIT 5;
```

| flight | origin | dest |
|-------:|:-------|:-----|
|   5818 | EWR    | DCA  |
|   4312 | EWR    | DCA  |
|   4509 | EWR    | BWI  |
|   1037 | EWR    | IAD  |
|   3827 | EWR    | IAD  |

``` sql
  SELECT flight, dep_delay
  FROM flights
  WHERE dep_delay IS NOT NULL
  LIMIT 5;
```

| flight | dep_delay |
|-------:|----------:|
|   1545 |         2 |
|   1714 |         4 |
|   1141 |         2 |
|    725 |        -1 |
|    461 |        -6 |

``` sql
  SELECT flight, dep_delay
  FROM flights
  WHERE dep_delay IS NULL
  LIMIT 5;
```

| flight | dep_delay |
|-------:|----------:|
|   4308 |        NA |
|    791 |        NA |
|   1925 |        NA |
|    125 |        NA |
|   4352 |        NA |
