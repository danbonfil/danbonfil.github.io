---
layout: default
title: Stata
parent: Languages Library
nav_order: 3
---

# Stata

Stata is a statistical software widely used in economics, political science, epidemiology, and public policy research.

---

# Stata: Basic Commands

## 1. Workspace & Help
```stata
clear all
describe
help regress
```

## 2. Loading Data
```stata
use data.dta, clear
import delimited data.csv, clear
```
## 3. Inspecting Data
```stata
browse
summarize
codebook
```

## 4. Subsetting
```stata
keep if age > 30
drop if income < 1000
```

## 5. Basic Statistics
```stata
summarize income
tabulate gender
mean income
```

---

# Stata: Intermediate Commands

## 6. Data Management
```stata
generate log_income = log(income)
replace income = income*1.1
rename income wage
```

## 7. Merging & Appending
```stata
merge 1:1 id using otherdata.dta
append using moredata.dta
```

## 8. Dates
```stata
gen year = year(date)
format date %td
```

## 9. Visualization
```stata
histogram income
scatter income age
graph box income, over(gender)
```

---

# Stata: Advanced Commands

## 10. Regressions & Econometrics
```stata
reg y x1 x2
logit y x1 x2
probit y x1 x2
```

## 11. Panel Data
```stata
xtset id year
xtreg y x1, fe
```

## 12. Instrumental Variables
```stata
ivregress 2sls y (x1 = z1) x2
```

## 13. Fixed Effects (High-Dimensional)
```stata
reghdfe y x1 x2, absorb(firm year)
```

## 14. Time Series
```stata
tsset date
arima y, arima(1,1,1)
```

---

# Documentation, Learning & Data

## Official Documentation
- https://www.stata.com/manuals/
- https://www.stata.com/support/faqs/

## Practice & Real Data
- World Bank Open Data
- IPUMS Microdata
- OECD Statistics
- Kaggle Datasets

## Econometrics Data
- FRED
- Penn World Tables
- World Inequality Database
- V-Dem
