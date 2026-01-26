---
layout: default
title: R
parent: Languages Library
nav_order: 1
---

# R

R is a statistical computing language designed for data manipulation, econometrics, and visualization.

## R Syntax Overview

R is **expression-based** and evaluates objects in memory. Code in R is written as a sequence of expressions that are evaluated to produce objects, values, or side effects.

R emphasizes **functions**, **objects**, and **vectorized operations**, allowing concise and expressive data analysis workflows.

---

## R Language Building Blocks

| Type | Examples | Role / Purpose |
|----|----|----|
| Expressions | `x + 1`, `mean(x)`, `df$a > 5` | The basic unit of execution; everything in R is an expression. |
| Objects | vectors, data frames, lists, functions | Containers that store data or behavior. |
| Functions | `mean()`, `sum()`, `lm()`, `filter()` | Reusable operations that take inputs and return outputs. |
| Operators | `+`, `-`, `*`, `/`, `^`, `<`, `>`, `==`, `!=` | Combine, compare, or transform values. |
| Pipes | `|>` , `%>%` | Pass the output of one expression as input to the next. |
| Control Flow | `if`, `else`, `for`, `while`, `repeat` | Control how and when expressions are evaluated. |
| Indexing | `[ ]`, `[[ ]]`, `$` | Access elements within objects. |
| Assignment | `<-`, `=` | Bind values to object names. |
| Keywords | `TRUE`, `FALSE`, `NULL`, `NA`, `NaN`, `Inf` | Reserved literals and special values. |
| Packages | `library()`, `require()` | Extend R with additional functions and datasets. |

---

## Conceptual Structure of an R Expression

- **R Expression**
  - **Objects**
    - Atomic vectors — numeric, character, logical
    - Data frames / tibbles — tabular data
    - Lists — heterogeneous collections
  - **Functions**
    - Inputs (arguments)
    - Outputs (return values)
  - **Operators**
    - Arithmetic — `+`, `-`, `*`, `/`, `^`
    - Logical — `&`, `|`, `!`
    - Comparison — `==`, `<`, `>`, `<=`, `>=`
  - **Pipes**
    - Native pipe — `|>`
    - Magrittr pipe — `%>%`
  - **Control Flow**
    - Conditional execution — `if`, `else`
    - Iteration — `for`, `while`
  - **Indexing**
    - Positional — `[ ]`
    - Element-level — `[[ ]]`
    - Named — `$`

---

## R in the Data Analysis Workflow

- **Data import:** `read.csv()`, `readr::read_csv()`, `DBI::dbGetQuery()`
- **Data manipulation:** `dplyr::select()`, `filter()`, `mutate()`, `summarise()`
- **Modeling:** `lm()`, `glm()`, `lmer()`
- **Visualization:** `plot()`, `ggplot2`
- **Reporting:** `rmarkdown`, `knitr`

---

## Key R Syntax Rules to Remember

**Case sensitivity**
- R is case-sensitive (`Data` ≠ `data`).

**Assignment**
- `<-` is preferred for readability and convention.

**Whitespace**
- Whitespace is generally ignored, but improves readability.

**Function calls**
- Functions use parentheses: `mean(x)`
- Arguments can be named or positional.

**Missing values**
- Use `NA` for missing data.
- Test with `is.na()`.

**Vectorization**
- Most operations are vectorized; loops are often unnecessary.

---

# R: Basic Commands

## 1. Workspace & Help
```r
ls()
rm(list = ls())
help(mean)
?mean
```

## 2. Loading Data
```r
df <- read.csv("data.csv")
df <- readRDS("data.rds")
df <- readxl::read_excel("file.xlsx")
```

## 3. Inspecting Data
```r
head(df)
tail(df)
str(df)
summary(df)
```

## 4. Subsetting
```r
df$income
df[, c("age","income")]
subset(df, age > 30)
```

## 5. Basic Statistics
```r
mean(df$income, na.rm=TRUE)
sd(df$income, na.rm=TRUE)
table(df$gender)
```

---

# R: Intermediate Commands

## 6. dplyr (Data Manipulation)
```r
library(dplyr)

df %>% filter(age > 30)
df %>% select(name, income)
df %>% arrange(desc(income))
df %>% mutate(log_income = log(income))
df %>% group_by(gender) %>% summarise(avg_inc = mean(income))
```

## 7. Joins
```r
left_join(df1, df2, by="id")
inner_join(df1, df2, by="id")
```

## 8. Dates
```r
library(lubridate)
df$date <- ymd(df$date)
month(df$date)
```

## 9. Visualization
```r
library(ggplot2)

ggplot(df, aes(age, income)) + geom_point()
ggplot(df, aes(gender, income)) + geom_boxplot()
```

---

# R: Advanced Commands

## 10. Regressions & Econometrics
```r
lm(y ~ x1 + x2, data=df)
glm(y ~ x1 + x2, family=binomial, data=df)
```

## 11. Panel Data
```r
library(plm)
plm(y ~ x1, data=df, index=c("id","year"), model="within")
```

## 12. Fixed Effects (High-Dim)
```r
library(fixest)
feols(y ~ x1 + x2 | firm + year, data=df)
```

## 13. Time Series
```r
library(forecast)
auto.arima(tsdata)
```

## 14. Machine Learning
```r
library(caret)
train(y ~ ., data=df, method="rf")
```

---

# Documentation, Learning & Data

## Official Documentation
- https://cran.r-project.org/manuals.html  
- https://r4ds.hadley.nz  
- https://posit.co/resources/cheatsheets/

## Practice & Real Data
- World Bank Open Data
- IPUMS Microdata
- OECD Statistics
- Kaggle Datasets
- UCI Machine Learning Repository

## Econometrics Data
- FRED (Federal Reserve)
- Penn World Tables
- World Inequality Database
- Comparative Political Data Set (CPDS)
- V-Dem
