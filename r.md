---
layout: default
title: R
parent: Languages Library
nav_order: 1
---

# R

R is a statistical computing language designed for data manipulation, econometrics, and visualization.

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
