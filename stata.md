---
layout: default
title: Stata
parent: Languages Library
nav_order: 3
---

# Stata

Stata is a statistical software widely used in economics, political science, epidemiology, and public policy research.

## Stata Syntax Overview

Stata is a command-driven statistical software environment designed for data management, statistical analysis, and visualization.  
Unlike general-purpose programming languages, Stata operates on a **single active dataset in memory** and emphasizes reproducible, line-by-line command execution.

Stata syntax is declarative and procedural, with commands that act directly on variables and observations in the current dataset.

---

## Stata Language Building Blocks

| Type | Examples | Role / Purpose |
|----|----|----|
| Commands | `use`, `save`, `merge`, `regress`, `summarize` | Complete instructions that perform actions on the dataset. |
| Expressions | `income > 50000`, `age + 5`, `log(wage)` | Compute values or define conditions. |
| Variables | numeric, string, factor variables | Columns in the active dataset. |
| Operators | `+`, `-`, `*`, `/`, `==`, `!=`, `&`, `|` | Perform arithmetic, comparison, and logical operations. |
| Qualifiers | `if`, `in` | Restrict commands to subsets of observations. |
| Options | `, robust`, `, detail`, `, replace` | Modify how a command behaves. |
| Functions | `log()`, `exp()`, `mean()`, `round()` | Built-in operations used in expressions. |
| Macros | `local`, `global` | Store and reuse text or values. |
| Loops | `foreach`, `forvalues`, `while` | Repeat commands programmatically. |
| Keywords | `missing`, `_n`, `_N`, `by` | Reserved elements with special meaning. |

---

## Conceptual Structure of a Stata Command

- **Stata Command**
  - **Command name** — e.g., `regress`, `summarize`
  - **Variable list** — variables the command acts on
  - **Qualifiers**
    - `if` — restrict by condition
    - `in` — restrict by observation range
  - **Options**
    - Modify estimation, output, or behavior
  - **Expressions**
    - Arithmetic — `x + y`
    - Logical — `income > 0 & age < 65`
  - **Functions**
    - Mathematical — `log()`, `exp()`
    - Statistical — `mean()`, `sd()`

---

## Stata in the Data Analysis Workflow

- **Data import:** `use`, `import delimited`, `import excel`
- **Data cleaning:** `rename`, `drop`, `keep`, `replace`, `generate`
- **Data transformation:** `egen`, `bysort`, `collapse`
- **Estimation:** `regress`, `logit`, `xtreg`, `ivregress`
- **Visualization:** `graph`, `twoway`
- **Output and reporting:** `esttab`, `outreg2`, `putexcel`

---

## Key Stata Syntax Rules to Remember

**Case sensitivity**
- Stata commands are case-insensitive.
- Variable names are case-sensitive.

**Order matters**
- Commands follow a strict order: command → variables → qualifiers → options.

**Whitespace**
- Extra spaces are ignored but improve readability.

**Missing values**
- Missing values are denoted by `.` (and `.a`–`.z`).
- Missing values are treated as larger than any numeric value.

**Qualifiers**
- `if` filters observations.
- `in` selects observation ranges.

**Macros**
- Local macros: `` `name' ``
- Global macros: `$name`

---

## Stata Programming Philosophy

- Operates on one dataset at a time.
- Encourages reproducible scripts (`.do` files).
- Emphasizes clear, readable command sequences.
- Blends interactive use with scripting.

Stata’s syntax prioritizes transparency and statistical rigor, making it especially well suited for applied econometrics and policy analysis.

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
