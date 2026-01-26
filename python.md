---
layout: default
title: Python
parent: Languages Library
nav_order: 2
---

# Python

Python is a general-purpose programming language widely used for data analysis, econometrics, machine learning, automation, and scientific computing.

## Python Syntax Overview

Python is a general-purpose, interpreted programming language widely used for data analysis, machine learning, and software development.  
Unlike SQL, which is declarative, Python is **imperative and object-oriented**, meaning code is executed step by step and organized around objects and functions.

In data analytics, Python commonly relies on libraries such as **pandas**, **NumPy**, **scikit-learn**, and **matplotlib**.

---

## Python Language Building Blocks

| Type | Examples | Role / Purpose |
|----|----|----|
| Statements | `import`, `def`, `class`, `return`, `if`, `for`, `while` | Complete instructions executed by the interpreter. |
| Expressions | `x + 1`, `df["a"] > 5`, `np.mean(x)` | Pieces of code that evaluate to a value. |
| Objects | int, float, str, list, dict, DataFrame | All data in Python is represented as objects. |
| Functions | `len()`, `sum()`, `print()`, `mean()` | Reusable blocks of code that perform actions. |
| Methods | `df.head()`, `s.lower()` | Functions bound to objects. |
| Operators | `+`, `-`, `*`, `/`, `**`, `==`, `!=`, `and`, `or`, `not` | Perform arithmetic, comparison, and logic. |
| Control Flow | `if`, `elif`, `else`, `for`, `while`, `break` | Control execution order. |
| Indexing | `[ ]`, slicing (`[1:5]`) | Access elements within sequences. |
| Assignment | `=` | Bind values to variable names. |
| Keywords | `None`, `True`, `False`, `import`, `from`, `as` | Reserved words with special meaning. |
| Modules / Packages | `import pandas as pd` | Organize and reuse code. |

---

## Conceptual Structure of a Python Program

- **Python Program**
  - **Statements**
    - Imports — `import`, `from`
    - Definitions — `def`, `class`
    - Control flow — `if`, `for`, `while`
  - **Expressions**
    - Arithmetic — `x + y`
    - Logical — `x > 5 and y < 3`
  - **Objects**
    - Built-in types — int, float, str, list, dict
    - External types — `pandas.DataFrame`, `numpy.ndarray`
  - **Functions and Methods**
    - Built-in — `len()`, `sum()`
    - Library — `df.groupby()`, `np.mean()`
  - **Operators**
    - Arithmetic — `+`, `-`, `*`, `/`, `**`
    - Comparison — `==`, `<`, `>`
    - Logical — `and`, `or`, `not`
  - **Indexing and Slicing**
    - Positional — `x[0]`
    - Ranges — `x[1:5]`

---

## Python in the Data Analysis Workflow

- **Data import:** `pandas.read_csv()`, `read_sql()`
- **Data manipulation:** `pandas` (`loc`, `groupby`, `merge`)
- **Numerical computing:** `NumPy`
- **Modeling:** `scikit-learn`, `statsmodels`
- **Visualization:** `matplotlib`, `seaborn`
- **Reporting:** Jupyter notebooks, Markdown, HTML

---

## Key Python Syntax Rules to Remember

**Indentation**
- Indentation defines code blocks.
- Consistent spacing is required (typically 4 spaces).

**Case sensitivity**
- Python is case-sensitive (`Data` ≠ `data`).

**Whitespace**
- Significant only for indentation; otherwise improves readability.

**Function calls**
- Use parentheses: `mean(x)`
- Arguments can be positional or named.

**Missing values**
- Use `None` or `numpy.nan`.
- Test with `is None` or `pd.isna()`.

**Dynamic typing**
- Variable types are inferred at runtime.

---

# Python: Basic Commands

## 1. Environment & Help
```python
help(len)
dir(list)
```

## 2. Core Data Types
```python
x = 10              # int
y = 3.14            # float
name = "Daniel"     # string
flag = True         # boolean
```

## 3. Lists, Tuples, Dictionaries
```python
lst = [1, 2, 3]
tpl = (1, 2, 3)
dct = {"a": 1, "b": 2}
```

## 4. Control Flow
```python
for i in range(5):
    print(i)

if x > 5:
    print("Large")
else:
    print("Small")
```

## 5. Functions
```python
def mean(x):
    return sum(x) / len(x)
```

# Python: Data Analysis Basics

## 6. NumPy
```python
import numpy as np

arr = np.array([1,2,3])
arr.mean()
arr.reshape(3,1)
```

## 7. Pandas: Loading Data
```python
import pandas as pd

df = pd.read_csv("data.csv")
df = pd.read_excel("data.xlsx")
```

## 8. Inspecting Data
```python
df.head()
df.tail()
df.info()
df.describe()
```

## 9. Data Selection
```python
df["income"]
df.loc[df["age"] > 30]
df.iloc[:, 0:3]
```

## 10. Data Transformation
```python
df["log_income"] = np.log(df["income"])
df = df.dropna()
df = df.rename(columns={"old": "new"})
```

# Python: Intermediate Commands
## 11. Grouping & Aggregation
```python
df.groupby("gender")["income"].mean()
df.groupby("year").agg({"income": "mean", "age": "median"})
```

## 12. Merging Data
```python
pd.merge(df1, df2, on="id", how="left")
pd.concat([df1, df2], axis=0)
```

## 13. Dates & Times
```python
df["date"] = pd.to_datetime(df["date"])
df["year"] = df["date"].dt.year
df["month"] = df["date"].dt.month
```

## 14. Visualization
```python
import matplotlib.pyplot as plt

plt.scatter(df["age"], df["income"])
plt.hist(df["income"])
plt.show()
```

```python
import seaborn as sns
sns.boxplot(x="gender", y="income", data=df)
```

# Python: Advanced Commands
## 15. Statistical Models
```python
import statsmodels.formula.api as smf

model = smf.ols("y ~ x1 + x2", data=df).fit()
model.summary()
```

## 16. Panel Data & Fixed Effects
```python
from linearmodels.panel import PanelOLS

df = df.set_index(["id", "year"])
PanelOLS.from_formula("y ~ x1 + EntityEffects", data=df).fit()
```

## 17. Machine Learning
```python
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor

X = df.drop("y", axis=1)
y = df["y"]

X_train, X_test, y_train, y_test = train_test_split(X, y)

model = RandomForestRegressor()
model.fit(X_train, y_train)
```

## 18. Pipelines & Scaling
```python
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler

pipe = Pipeline([
    ("scale", StandardScaler()),
    ("model", RandomForestRegressor())
])
pipe.fit(X_train, y_train)
```

## 19. Time Series
```python
from statsmodels.tsa.arima.model import ARIMA

model = ARIMA(y, order=(1,1,1)).fit()
model.summary()
```

# Documentation, Learning & Data
## Official Documentation
https://docs.python.org/3/

https://pandas.pydata.org/docs/

https://numpy.org/doc/

https://scikit-learn.org/stable/documentation.html

https://www.statsmodels.org/stable/