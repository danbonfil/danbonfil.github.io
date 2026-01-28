---
layout: default
title: Stats 0
parent: Teaching Assistant
nav_order: 1
---

# Chapter 1: Introduction

## What Are Statistics

Statistics is the science of **collecting, organizing, analyzing, and
interpreting data**.  
It helps us make sense of information and draw conclusions in the
presence of uncertainty.

- **Plain Language:** Statistics is about turning numbers into
  knowledge.
- **Real-World Example:** Businesses use statistics to understand
  customers; doctors use it to evaluate treatments.

------------------------------------------------------------------------

## Importance of Statistics

Statistics is everywhere:

- In **healthcare**, to test new drugs.
- In **sports**, to analyze performance.
- In **business**, to forecast sales.

**Why learn statistics?**

- To **interpret data critically**
- To **avoid misleading conclusions**
- To **make informed decisions**

------------------------------------------------------------------------

## Descriptive Statistics

Descriptive statistics summarize data using:

- Measures of **central tendency** (mean, median, mode)
- Measures of **variability** (range, variance, SD)
- **Graphs** (histograms, boxplots)

### Example in R

``` r
# Simulate a small dataset
set.seed(123)
data <- c(5, 7, 8, 6, 9, 10)

# Compute descriptive statistics
mean(data)      # Average
```

    ## [1] 7.5

``` r
median(data)    # Middle value
```

    ## [1] 7.5

``` r
sd(data)        # Standard deviation
```

    ## [1] 1.870829

**Interpretation:**

- Mean: The average score
- Median: The middle score
- SD: How spread out the scores are

------------------------------------------------------------------------

## Inferential Statistics

Inferential statistics allow us to **generalize** from a sample to a
population.

**Example:**  
Testing whether a new teaching method improves exam scores by studying a
sample of students.

------------------------------------------------------------------------

## Variables

A **variable** is any characteristic that can vary.

- **Qualitative (categorical):** Gender, color
- **Quantitative (numerical):** Height, weight

### Example in R

``` r
# Qualitative and quantitative variables
gender <- c("Male", "Female", "Female", "Male")
height <- c(170, 165, 160, 175)

table(gender)   # Frequency of categories
```

    ## gender
    ## Female   Male 
    ##      2      2

``` r
mean(height)    # Average height
```

    ## [1] 167.5

------------------------------------------------------------------------

## Percentiles

Percentiles describe the **position** of a value in a dataset.

### Example in R

``` r
quantile(height, probs = c(0.25, 0.5, 0.75))
```

    ##    25%    50%    75% 
    ## 163.75 167.50 171.25

------------------------------------------------------------------------

## Levels of Measurement

- **Nominal:** Categories (colors)
- **Ordinal:** Ordered categories (rankings)
- **Interval:** Equal intervals, no true zero (°C)
- **Ratio:** Equal intervals with true zero (weight)

------------------------------------------------------------------------

## Distributions

A **distribution** shows how values are spread.

### Example in R

``` r
hist(height,
     main = "Height Distribution",
     xlab = "Height (cm)",
     col = "lightblue")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

------------------------------------------------------------------------

## Summation Notation

The summation symbol:

``` r
plot.new()
text(0.5, 0.5, expression(sum(x[i], i==1, n)), cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

<!-- $$ -->

<!-- \sum_{i=1}^{n} x_i -->

<!-- $$ -->

In R:

``` r
sum(height)
```

    ## [1] 670

------------------------------------------------------------------------

## Linear Transformations

Adding or multiplying by a constant changes the **scale** but not the
**shape**.

### Example in R

``` r
height_m <- height / 100
height_m
```

    ## [1] 1.70 1.65 1.60 1.75

------------------------------------------------------------------------

## Logarithms

Log transformations help handle **skewed** data.

### Example in R

``` r
log_height <- log(height)
log_height
```

    ## [1] 5.135798 5.105945 5.075174 5.164786

------------------------------------------------------------------------

## Statistical Literacy

- Understand **what numbers represent**
- Question **how data was collected**
- Recognize **bias and uncertainty**

------------------------------------------------------------------------

# Exercises

Below are the exercises **and their solutions**.

------------------------------------------------------------------------

## **Exercise 1: Difference between descriptive and inferential statistics**

**Answer:**  
Descriptive statistics summarize and describe data (e.g., mean,
histogram).  
Inferential statistics use sample data to make generalizations or
predictions about a population.

------------------------------------------------------------------------

## **Exercise 2: Create a vector of 10 random numbers and compute mean, median, SD**

``` r
set.seed(111)
x <- rnorm(10)
x
```

    ##  [1]  0.2352207 -0.3307359 -0.3116238 -2.3023457 -0.1708760  0.1402782
    ##  [7] -1.4974267 -1.0101884 -0.9484756 -0.4939622

``` r
mean(x)
```

    ## [1] -0.6690135

``` r
median(x)
```

    ## [1] -0.412349

``` r
sd(x)
```

    ## [1] 0.7847206

------------------------------------------------------------------------

## **Exercise 3: Plot a histogram of your simulated data**

``` r
hist(x,
     main = "Histogram of Simulated Data",
     xlab = "Value",
     col = "lightgreen")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-10-1.png)<!-- -->

------------------------------------------------------------------------

## **Exercise 4: Identify levels of measurement**

- Temperature in Celsius → **Interval**
- Number of siblings → **Ratio**
- Favorite color → **Nominal**

------------------------------------------------------------------------

## **Exercise 5: Compute percentiles for your data**

``` r
quantile(x, probs = c(0.25, 0.5, 0.75))
```

    ##        25%        50%        75% 
    ## -0.9947602 -0.4123490 -0.2060630

------------------------------------------------------------------------

# Chapter 2: Graphing Distributions

## Why Graph Data?

Graphs provide a **visual summary** of data, making patterns and trends
easier to understand. They help answer questions like:

- Is the data **symmetrical or skewed**?
- Are there **outliers**?
- How do **categories compare**?

------------------------------------------------------------------------

## Graphing Qualitative Variables

Qualitative (categorical) variables represent **categories** (e.g.,
gender, color).

### Common Graphs:

- **Bar Charts**
- **Pie Charts** (less preferred)

### Example in R

``` r
# Qualitative data: Favorite color
colors <- c("Red", "Blue", "Blue", "Green", "Red", "Blue", "Green", "Red")

# Frequency table
table(colors)
```

    ## colors
    ##  Blue Green   Red 
    ##     3     2     3

``` r
# Bar chart
barplot(table(colors), main = "Favorite Colors",
        col = c("red", "blue", "green"))
```

![](stats0_md_files/figure-gfm/unnamed-chunk-12-1.png)<!-- -->

**Interpretation:**  
Bar height shows how many observations fall into each category.

------------------------------------------------------------------------

## Graphing Quantitative Variables

Quantitative variables are **numeric** (e.g., height, weight).

### Common Graphs:

- **Histograms**
- **Boxplots**
- **Dot plots**

------------------------------------------------------------------------

## Stem and Leaf Displays

A **stem-and-leaf plot** shows the distribution while preserving actual
data values.

### Example in R

``` r
scores <- c(45, 47, 50, 52, 53, 55, 57, 60)
stem(scores)
```

    ## 
    ##   The decimal point is 1 digit(s) to the right of the |
    ## 
    ##   4 | 57
    ##   5 | 023
    ##   5 | 57
    ##   6 | 0

**Interpretation:**  
The stem represents tens, and the leaves represent ones.

------------------------------------------------------------------------

## Histograms

Histograms group data into **bins** and show frequency.

``` r
set.seed(123)
data <- rnorm(100, mean = 50, sd = 10)

hist(data,
     main = "Histogram of Data",
     xlab = "Value",
     col = "lightblue",
     border = "white")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-14-1.png)<!-- -->

------------------------------------------------------------------------

## Frequency Polygons

A frequency polygon connects midpoints of histogram bars.

``` r
hist_data <- hist(data, plot = FALSE)

plot(hist_data$mids, hist_data$counts, type = "b",
     main = "Frequency Polygon",
     xlab = "Value", ylab = "Frequency")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-15-1.png)<!-- -->

------------------------------------------------------------------------

## Box Plots

Boxplots summarize data using **quartiles** and highlight outliers.

``` r
boxplot(data,
        main = "Boxplot of Data",
        horizontal = TRUE)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-16-1.png)<!-- -->

------------------------------------------------------------------------

## Bar Charts (again)

Used for **categorical** comparisons.

``` r
barplot(table(colors),
        main = "Bar Chart Example",
        col = c("red", "blue", "green"))
```

![](stats0_md_files/figure-gfm/unnamed-chunk-17-1.png)<!-- -->

------------------------------------------------------------------------

## Line Graphs

Line graphs show **trends over time**.

``` r
time <- 1:12
sales <- c(100,120,130,125,140,150,160,155,170,180,190,200)

plot(time, sales, type = "o",
     main = "Monthly Sales",
     xlab = "Month", ylab = "Sales",
     col = "blue")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-18-1.png)<!-- -->

------------------------------------------------------------------------

## Dot Plots

``` r
stripchart(data,
           method = "stack",
           main = "Dot Plot",
           xlab = "Value",
           col = "darkgreen")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-19-1.png)<!-- -->

------------------------------------------------------------------------

## Statistical Literacy

- Graphs can **mislead** if axes are manipulated.
- Always check **labels** and **scales**.
- Avoid **pie charts** for complex comparisons.

------------------------------------------------------------------------

# Exercises — With Code and Answers

## Exercise 1: Create a bar chart for a categorical variable

``` r
colors <- c("Red", "Blue", "Blue", "Green", "Red", "Blue", "Green", "Red")
table(colors)
```

    ## colors
    ##  Blue Green   Red 
    ##     3     2     3

``` r
barplot(table(colors), main = "Favorite Colors",
        col = c("red", "blue", "green"))
```

![](stats0_md_files/figure-gfm/unnamed-chunk-20-1.png)<!-- -->

------------------------------------------------------------------------

## Exercise 2: Simulate 50 random numbers and plot a histogram

``` r
set.seed(123)
data <- rnorm(50, mean = 50, sd = 10)

hist(data,
     main = "Histogram of Simulated Data",
     xlab = "Value",
     col = "lightblue")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-21-1.png)<!-- -->

------------------------------------------------------------------------

## Exercise 3: Boxplot + interpretation

``` r
boxplot(data,
        main = "Boxplot of Simulated Data",
        horizontal = TRUE)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-22-1.png)<!-- -->

``` r
summary(data)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   30.33   44.41   49.27   50.34   56.98   71.69

**Interpretation:**  
Data appears roughly symmetric with no extreme outliers.

------------------------------------------------------------------------

## Exercise 4: Why are pie charts less preferred?

**Answer:**  
Pie charts make it difficult to compare category sizes accurately.  
Bar charts make comparisons easier because they use aligned lengths and
a consistent baseline.

------------------------------------------------------------------------

## Exercise 5: Line graph of monthly temperature

``` r
months <- 1:12
temp <- c(15,16,18,20,22,24,25,24,22,20,18,16)

plot(months, temp, type = "o",
     main = "Monthly Temperature",
     xlab = "Month",
     ylab = "Temperature (°C)",
     col = "blue")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-23-1.png)<!-- -->

------------------------------------------------------------------------

# Chapter 3: Summarizing Distributions

## What is Central Tendency?

Central tendency refers to a **single value that represents the center
of a dataset**. It answers:

- What is a “typical” value?
- Where does the data cluster?

Common measures:

- **Mean** (average)  
- **Median** (middle)  
- **Mode** (most frequent)

------------------------------------------------------------------------

## Measures of Central Tendency

### Mean

The arithmetic average:

``` r
plot.new()
text(0.5, 0.5, expression(bar(x) == sum(x[i], i==1, n) / n), cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-24-1.png)<!-- -->

<!-- $$ -->

<!-- \bar{x} = \frac{\sum x_i}{n} -->

<!-- $$ -->

### Median

The middle value when data is ordered.

### Mode

The value that appears most often.

------------------------------------------------------------------------

### Example in R

``` r
# Simulate data
set.seed(123)
data <- c(5, 7, 8, 6, 9, 10, 12)

mean(data)     # Mean
```

    ## [1] 8.142857

``` r
median(data)   # Median
```

    ## [1] 8

``` r
# Compute mode manually
mode_val <- names(sort(table(data), decreasing = TRUE))[1]
mode_val
```

    ## [1] "5"

**Interpretation:**

- Mean: Sensitive to outliers
- Median: Robust to outliers
- Mode: Best for categorical data

------------------------------------------------------------------------

## Median and Mean

When data is **skewed**, the median is often a better measure than the
mean.

### Example in R

``` r
# Skewed data
skewed <- c(2, 3, 3, 4, 4, 5, 100)

mean(skewed)
```

    ## [1] 17.28571

``` r
median(skewed)
```

    ## [1] 4

**Interpretation:**  
The extreme value (100) pulls the mean upward, while the median remains
stable.

------------------------------------------------------------------------

## Additional Measures of Central Tendency

### Trimmed Mean

Removes extreme values before averaging.

``` r
mean(skewed, trim = 0.1)
```

    ## [1] 17.28571

------------------------------------------------------------------------

## Comparing Measures of Central Tendency

- Use **mean** for symmetric distributions.
- Use **median** for skewed distributions.
- Use **mode** for categorical data.

------------------------------------------------------------------------

## Measures of Variability

Variability describes **how spread out** data is.

Common measures:

- **Range:** max − min

``` r
plot.new()
text(0.5, 0.5, expression(Range == max((x)) - min((x))), cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-28-1.png)<!-- -->

- **Variance:** average squared deviation

``` r
plot.new()
text(0.5, 0.5, expression(sigma^2 == sum((x[i] - bar(x))^2, i==1, n)/n), cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-29-1.png)<!-- -->

- **Standard deviation (SD):** square root of variance

``` r
plot.new()
text(0.5, 0.5, expression(sigma == sqrt(sigma^2)), cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-30-1.png)<!-- -->

### Example in R

``` r
range(data)       # Range
```

    ## [1]  5 12

``` r
var(data)         # Variance
```

    ## [1] 5.809524

``` r
sd(data)          # Standard deviation
```

    ## [1] 2.410295

------------------------------------------------------------------------

## Shapes of Distributions

- **Symmetrical:** Mean ≈ Median
- **Skewed:** Mean and median differ
- **Normal:** Bell-shaped

------------------------------------------------------------------------

## Effects of Linear Transformations

Adding or multiplying by a constant changes the **scale**, not the
**shape**.

### Example in R

``` r
data_plus10 <- data + 10
mean(data_plus10)
```

    ## [1] 18.14286

``` r
sd(data_plus10)
```

    ## [1] 2.410295

------------------------------------------------------------------------

## Variance Sum Law I

For independent variables:

``` r
plot.new()
text(0.5, 0.5,
     expression(Var(X + Y) == Var(X) + Var(Y)),
     cex = 1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-33-1.png)<!-- -->

<!-- $$ -->

<!-- \text{Var}(X + Y) = \text{Var}(X) + \text{Var}(Y) -->

<!-- $$ -->

------------------------------------------------------------------------

## Statistical Literacy

- Understand **spread** alongside the center.
- Don’t rely only on the mean.
- Always check for **outliers** and **skewness**.

------------------------------------------------------------------------

# Exercises — With Code and Answers

------------------------------------------------------------------------

## Exercise 1: Compute mean, median, mode

``` r
data <- c(5, 7, 8, 6, 9, 10, 12)

mean(data)
```

    ## [1] 8.142857

``` r
median(data)
```

    ## [1] 8

``` r
mode_val <- names(sort(table(data), decreasing = TRUE))[1]
mode_val
```

    ## [1] "5"

------------------------------------------------------------------------

## Exercise 2: Simulate 100 random numbers and calculate SD

``` r
set.seed(123)
nums <- rnorm(100, mean = 50, sd = 10)

sd(nums)
```

    ## [1] 9.128159

------------------------------------------------------------------------

## Exercise 3: Compare mean and median for skewed data

``` r
skewed <- c(2, 3, 3, 4, 4, 5, 100)

mean(skewed)
```

    ## [1] 17.28571

``` r
median(skewed)
```

    ## [1] 4

**Interpretation:**  
The mean is far larger due to the extreme value, while the median
reflects the “typical” central value.

------------------------------------------------------------------------

## Exercise 4: Why is SD preferred over range?

**Answer:**  
Range uses only the minimum and maximum values, ignoring all other
data.  
Standard deviation incorporates **every observation**, giving a better
measure of overall spread.

------------------------------------------------------------------------

## Exercise 5: Apply a linear transformation and observe changes

``` r
data_plus10 <- data + 10

mean(data_plus10)
```

    ## [1] 18.14286

``` r
sd(data_plus10)
```

    ## [1] 2.410295

**Interpretation:**  
Adding 10 increases the mean by 10 but **does not change** the SD.

------------------------------------------------------------------------

# Chapter 4: Describing Bivariate Data

## Introduction to Bivariate Data

**Bivariate data** involves two variables measured on the same
subjects.  
Examples include:

- Height and weight  
- Study time and exam score

**Goal:** Understand the **relationship** between two variables.

------------------------------------------------------------------------

## Values of the Pearson Correlation

The **Pearson correlation coefficient (r)** measures the strength and
direction of a linear relationship:

- $r \in [-1, 1]$
- **r \> 0:** Positive relationship  
- **r \< 0:** Negative relationship  
- **r = 0:** No linear relationship

------------------------------------------------------------------------

## Properties of Pearson’s r

- **Unit-free:** Independent of measurement scale.  
- **Sensitive to outliers:** One extreme value can change r
  drastically.  
- **Measures linear relationships only:** Fails with curved patterns.

------------------------------------------------------------------------

## Computing Pearson’s r

The formula is:

``` r
plot.new()
text(0.5, 0.5,
     expression(
       r ==
       frac(sum((x[i] - bar(x))*(y[i] - bar(y))), 
       sqrt(sum((x[i]-bar(x))^2) * sum((y[i]-bar(y))^2)))
     ), cex=1.4)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-38-1.png)<!-- -->

<!-- $$ -->

<!-- r = \frac{\sum (x_i - \bar{x})(y_i - \bar{y})}{\sqrt{\sum (x_i - \bar{x})^2 \sum (y_i - \bar{y})^2}} -->

<!-- $$ -->

### Example in R

``` r
set.seed(123)
study_time <- c(2, 3, 4, 5, 6, 7, 8)
exam_score <- c(50, 55, 60, 65, 70, 75, 80)

cor(study_time, exam_score)
```

    ## [1] 1

**Interpretation:**  
r = 1 indicates a **perfect positive** linear relationship.

------------------------------------------------------------------------

## Scatterplots

Scatterplots visually represent relationships between two variables.

### Example in R

``` r
plot(study_time, exam_score,
     main = "Study Time vs Exam Score",
     xlab = "Study Time (hours)",
     ylab = "Exam Score",
     pch = 19, col = "blue")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-40-1.png)<!-- -->

**Interpretation:**  
A clear upward trend indicates a strong positive association.

------------------------------------------------------------------------

## Variance Sum Law II

For two variables X and Y:

``` r
plot.new()
text(0.5, 0.5,
     expression(Var(X + Y) ==
                Var(X) + Var(Y) + 2*Cov(X, Y)),
     cex = 1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-41-1.png)<!-- -->

<!-- $$ -->

<!-- \text{Var}(X + Y) = \text{Var}(X) + \text{Var}(Y) + 2\text{Cov}(X,Y) -->

<!-- $$ -->

Where **covariance** describes how variables change together.

``` r
plot.new()
text(0.5, 0.5,
     expression(
       Cov(X, Y) == sum((x[i]-bar(x))*(y[i]-bar(y))) / (n-1)
     ), cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-42-1.png)<!-- -->

### Example in R

``` r
cov(study_time, exam_score)
```

    ## [1] 23.33333

------------------------------------------------------------------------

## Statistical Literacy

- **Correlation ≠ Causation:** Even a strong r does not imply
  cause–effect.
- Look for **lurking variables**.
- Use scatterplots to check for **non-linearity** or outliers.

------------------------------------------------------------------------

# Exercises — With Code and Answers

------------------------------------------------------------------------

## Exercise 1: Compute Pearson’s r

``` r
study_time <- c(2, 3, 4, 5, 6, 7, 8)
exam_score <- c(50, 55, 60, 65, 70, 75, 80)

cor(study_time, exam_score)
```

    ## [1] 1

------------------------------------------------------------------------

## Exercise 2: Create a scatterplot

``` r
plot(study_time, exam_score,
     main = "Study Time vs Exam Score",
     xlab = "Study Time",
     ylab = "Exam Score",
     pch = 19, col = "blue")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-45-1.png)<!-- -->

------------------------------------------------------------------------

## Exercise 3: Why does correlation ≠ causation?

**Answer:**  
Correlation measures association, not cause–effect.  
A third variable could influence both, or the relationship could be
coincidental.

------------------------------------------------------------------------

## Exercise 4: Simulate two uncorrelated variables

``` r
set.seed(123)
x <- rnorm(50)
y <- rnorm(50)

cor(x, y)
```

    ## [1] -0.03586983

------------------------------------------------------------------------

## Exercise 5: Compute covariance

``` r
cov(study_time, exam_score)
```

    ## [1] 23.33333

**Interpretation:**  
Positive covariance indicates that the variables increase together.

------------------------------------------------------------------------

# Chapter 5: Probability

## Remarks on the Concept of “Probability”

Probability measures **uncertainty**. It answers:

- What is the chance of an event happening?
- Expressed between **0 and 1** (or 0% to 100%).

**Examples:**

- Probability of flipping heads = 0.5  
- Probability of rolling a 6 on a die = $\frac{1}{6} \approx 0.167$

------------------------------------------------------------------------

## Basic Concepts

- **Experiment:** A process that produces an outcome  
- **Sample Space (S):** All possible outcomes  
- **Event:** A subset of the sample space

### Rules

``` r
plot.new()
text(0.5, 0.5,
     expression(P(E) ==
                frac("Favorable outcomes", "Total outcomes")),
     cex=1.4)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-48-1.png)<!-- -->

<!-- $$ -->

<!-- P(E) = \frac{\text{Number of favorable outcomes}}{\text{Total outcomes}} -->

<!-- $$ -->

``` r
plot.new()
text(
  0.5, 0.5,
  expression("0 <= P(E) <= 1"),
  cex = 1.4
)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-49-1.png)<!-- -->

<!-- $$ -->

<!-- 0 \le P(E) \le 1 -->

<!-- $$ -->

### Example in R

``` r
# Probability of rolling a 6
favorable <- 1
total <- 6
prob <- favorable / total
prob
```

    ## [1] 0.1666667

------------------------------------------------------------------------

## Permutations and Combinations

### Permutation (order matters)

``` r
plot.new()
text(0.5, 0.5,
     expression(P(n,r) ==
                frac("n!", "(n-r)!")),
     cex=1.4)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-51-1.png)<!-- -->

<!-- $$ -->

<!-- P(n,r) = \frac{n!}{(n-r)!} -->

<!-- $$ -->

### Combination (order does not matter)

``` r
plot.new()
text(0.5, 0.5,
     expression(C(n,r) ==
                frac("n!", "r!(n-r)!")),
     cex=1.4)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-52-1.png)<!-- -->

<!-- $$ -->

<!-- C(n,r) = \frac{n!}{r!(n-r)!} -->

<!-- $$ -->

### Example in R

``` r
# Number of ways to choose 2 out of 5
choose(5, 2)
```

    ## [1] 10

------------------------------------------------------------------------

## Binomial Distribution

A binomial distribution applies when:

- Fixed number of trials
- Only two outcomes (success/failure)
- Constant probability of success

``` r
plot.new()
text(
  0.5, 0.5,
  expression(
    P(X == k) ==
      binom(n, k) * p^k * (1 - p)^(n - k)
  ),
  cex = 1.4
)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-54-1.png)<!-- -->

<!-- $$ -->

<!-- P(X = k) = \binom{n}{k} p^k (1-p)^{n-k} -->

<!-- $$ -->

### Example in R

``` r
dbinom(3, size = 10, prob = 0.5)
```

    ## [1] 0.1171875

------------------------------------------------------------------------

## Poisson Distribution

Models **rare events**:

``` r
plot.new()
text(
  0.5, 0.5,
  expression(
    P(X == k) ==
      frac(lambda^k * e^{-lambda}, "k!")
  ),
  cex = 1.4
)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-56-1.png)<!-- -->

<!-- $$ -->

<!-- P(X = k) = \frac{\lambda^k e^{-\lambda}}{k!} -->

<!-- $$ -->

### Example in R

``` r
dpois(2, lambda = 4)
```

    ## [1] 0.1465251

------------------------------------------------------------------------

## Multinomial Distribution

Generalization of the binomial when there are **more than two
categories**.

------------------------------------------------------------------------

## Hypergeometric Distribution

Used when sampling **without replacement**.

### Example in R

``` r
dhyper(2, m = 5, n = 5, k = 3)
```

    ## [1] 0.4166667

------------------------------------------------------------------------

## Base Rates

Always consider **prior probabilities** before drawing conclusions about
conditional probabilities.

------------------------------------------------------------------------

## Statistical Literacy

- Probability describes long-run tendencies, not certainties.
- Beware of **base rate neglect**.
- Understand model assumptions such as independence.

------------------------------------------------------------------------

# Exercises — With Code and Answers

------------------------------------------------------------------------

## Exercise 1: Probability of rolling an even number

``` r
favorable <- 3  # (2, 4, 6)
total <- 6
prob_even <- favorable / total
prob_even
```

    ## [1] 0.5

------------------------------------------------------------------------

## Exercise 2: Combinations for choosing 3 items from 8

``` r
choose(8, 3)
```

    ## [1] 56

------------------------------------------------------------------------

## Exercise 3: Binomial probability

Compute P(X = 4) for n = 12, p = 0.3

``` r
dbinom(4, size = 12, prob = 0.3)
```

    ## [1] 0.2311397

------------------------------------------------------------------------

## Exercise 4: Poisson probability

Find P(X = 5) for lambda = 3

``` r
dpois(5, lambda = 3)
```

    ## [1] 0.1008188

------------------------------------------------------------------------

## Exercise 5: Hypergeometric probability

1 red ball from 4 red, 6 blue, sample size 3

``` r
dhyper(1, m = 4, n = 6, k = 3)
```

    ## [1] 0.5

------------------------------------------------------------------------

# Chapter 6: Research Design

## Scientific Method

The **scientific method** is the foundation of research:

1.  Ask a question  
2.  Formulate a hypothesis  
3.  Collect data  
4.  Analyze data  
5.  Draw conclusions

**Goal:** Ensure findings are **objective, reproducible, and valid**.

------------------------------------------------------------------------

## Measurement

Measurement assigns **numbers or labels** to characteristics according
to rules.

- **Reliability:** Consistency of measurement  
- **Validity:** Accuracy of measurement

**Example:**  
A calibrated scale measures weight with both high reliability and high
validity.

------------------------------------------------------------------------

## Basics of Data Collection

- **Population:** Full group of interest  
- **Sample:** Subset of the population

### Sampling Methods

- **Random sampling:** Every member has an equal chance  
- **Stratified sampling:** Divide population into subgroups (strata) and
  sample each  
- **Convenience sampling:** Easy to reach but prone to bias

### Example in R — Simple Random Sample

``` r
set.seed(123)
population <- 1:100
sample(population, size = 10)
```

    ##  [1] 31 79 51 14 67 42 50 43 97 25

------------------------------------------------------------------------

## Sampling Bias

Sampling bias occurs when the sample **does not represent the
population**.

**Examples:**

- Surveying only college students to represent the whole country
- Voluntary response surveys (only highly motivated people respond)

------------------------------------------------------------------------

## Experimental Designs

- **Observational study:** No manipulation, only observation
- **Experiment:** Researcher manipulates variables
- **Randomized Controlled Trial (RCT):** Gold standard for causal
  inference

### Key Concepts

- **Independent variable (IV):** Manipulated factor
- **Dependent variable (DV):** Measured outcome
- **Control group:** No treatment
- **Random assignment:** Reduces systematic bias

------------------------------------------------------------------------

## Causation

Correlation ≠ causation.

To infer causation:

- Manipulate the IV
- Randomly assign participants
- Control confounding variables

------------------------------------------------------------------------

## Statistical Literacy

- Understand **sampling bias** and how it distorts findings
- Recognize **confounding variables**
- Be skeptical of causal claims without proper design

------------------------------------------------------------------------

# Exercises — With Code and Answers

------------------------------------------------------------------------

## Exercise 1: Simple random sample of 15 numbers from 1 to 200

``` r
set.seed(456)
population <- 1:200
sample(population, size = 15)
```

    ##  [1] 163  38  27  25 159 122  79  90  83 171   8 126 142  13 180

------------------------------------------------------------------------

## Exercise 2: Create a stratified sample from two groups

``` r
groupA <- 1:50
groupB <- 51:100

sampleA <- sample(groupA, size = 5)
sampleB <- sample(groupB, size = 5)

c(sampleA, sampleB)
```

    ##  [1] 30 47 25 38 40 87 91 84 77 54

------------------------------------------------------------------------

## Exercise 3: Why does convenience sampling lead to bias?

**Answer:**  
Convenience sampling systematically excludes parts of the population,
leading to **non‑representative samples** and biased conclusions.

------------------------------------------------------------------------

## Exercise 4: Simulate random assignment of 20 participants into 2 groups

``` r
participants <- 1:20

group_assignment <- sample(rep(c("Treatment", "Control"), each = 10))

data.frame(Participant = participants,
           Group = group_assignment)
```

    ##    Participant     Group
    ## 1            1 Treatment
    ## 2            2 Treatment
    ## 3            3   Control
    ## 4            4   Control
    ## 5            5 Treatment
    ## 6            6   Control
    ## 7            7   Control
    ## 8            8 Treatment
    ## 9            9 Treatment
    ## 10          10 Treatment
    ## 11          11 Treatment
    ## 12          12   Control
    ## 13          13   Control
    ## 14          14   Control
    ## 15          15 Treatment
    ## 16          16   Control
    ## 17          17   Control
    ## 18          18 Treatment
    ## 19          19 Treatment
    ## 20          20   Control

------------------------------------------------------------------------

## Exercise 5: Identify IV and DV in a drug study

**Answer:**

- **IV:** Drug treatment (new drug vs placebo)
- **DV:** Health outcome (e.g., blood pressure reduction)

------------------------------------------------------------------------

# Chapter 7: Normal Distributions

## Introduction to Normal Distributions

The **normal distribution** is one of the most important concepts in
statistics:

- Bell-shaped curve  
- Symmetrical around the mean  
- Defined by **mean (μ)** and **standard deviation (σ)**

**Why is it important?**

- Many natural phenomena approximate normality (e.g., height, test
  scores)  
- It forms the basis for many inferential statistical procedures

------------------------------------------------------------------------

## History of the Normal Distribution

- Introduced by **Carl Friedrich Gauss** in the early 19th century  
- Used first for modeling astronomical measurement errors  
- Also known as the **Gaussian distribution**

------------------------------------------------------------------------

## Areas Under Normal Distributions

According to the **Empirical Rule**:

- ~68% of data lie within 1 SD of the mean  
- ~95% within 2 SD  
- ~99.7% within 3 SD

------------------------------------------------------------------------

### Example in R: Plot Normal Curve

``` r
x <- seq(-4, 4, length = 100)
y <- dnorm(x, mean = 0, sd = 1)

plot(
  x, y, type = "l",
  main = "Standard Normal Curve",
  xlab = "Z",
  ylab = "Density"
)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-68-1.png)<!-- -->

------------------------------------------------------------------------

## Standard Normal Distribution

A normal distribution with:

- Mean = 0
- SD = 1

``` r
plot.new()
text(0.5, 0.5,
     expression(phi(x) ==
                frac(1, sqrt(2*pi)) * e^(-x^2/2)),
     cex=1.4)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-69-1.png)<!-- -->

Values can be converted to **z‑scores**:

``` r
plot.new()
text(0.5, 0.5,
     expression(z == frac(x - mu, sigma)),
     cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-70-1.png)<!-- -->

<!-- $$ -->

<!-- z = \frac{x - \mu}{\sigma} -->

<!-- $$ -->

### Example in R

``` r
x <- 70
mu <- 60
sigma <- 10

z <- (x - mu) / sigma
z
```

    ## [1] 1

------------------------------------------------------------------------

## Normal Approximation to the Binomial

When n is large and p not extreme:

``` r
plot.new()
text(0.5, 0.5,
     expression(mu == n*p ~~ "~" ~~ sigma == sqrt(n*p*(1-p))),
     cex=1.4)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-72-1.png)<!-- -->

<!-- $$ -->

<!-- \mu = np,\qquad \sigma = \sqrt{np(1-p)} -->

<!-- $$ -->

### Example in R

``` r
n <- 100
p <- 0.5

mu <- n * p
sigma <- sqrt(n * p * (1 - p))

mu
```

    ## [1] 50

``` r
sigma
```

    ## [1] 5

------------------------------------------------------------------------

## Statistical Literacy

- Many statistical tests assume **normality**
- Always **check the distribution** before using parametric methods
- Tools to check normality: **histograms**, **Q-Q plots**

------------------------------------------------------------------------

# Exercises — With Code and Answers

------------------------------------------------------------------------

## Exercise 1: Plot a normal curve with mean = 50, sd = 10

``` r
x <- seq(20, 80, length = 100)
y <- dnorm(x, mean = 50, sd = 10)

plot(
  x, y, type = "l",
  main = "Normal Curve (μ = 50, σ = 10)",
  xlab = "Value",
  ylab = "Density"
)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-74-1.png)<!-- -->

------------------------------------------------------------------------

## Exercise 2: Compute z‑score for x = 85, mean = 70, sd = 12

``` r
x <- 85
mu <- 70
sigma <- 12

z <- (x - mu) / sigma
z
```

    ## [1] 1.25

------------------------------------------------------------------------

## Exercise 3: Probability that Z \< 1.96

``` r
pnorm(1.96)
```

    ## [1] 0.9750021

------------------------------------------------------------------------

## Exercise 4: Probability that Z \> 2.33

``` r
1 - pnorm(2.33)
```

    ## [1] 0.009903076

------------------------------------------------------------------------

## Exercise 5: Simulate 1000 normal values and check mean and sd

``` r
set.seed(123)
sim_data <- rnorm(1000, mean = 50, sd = 10)

mean(sim_data)
```

    ## [1] 50.16128

``` r
sd(sim_data)
```

    ## [1] 9.91695

**Interpretation:**  
Simulated data should be close to mean = 50 and sd = 10.

------------------------------------------------------------------------

# Chapter 8: Advanced Graphs

## Why Advanced Graphs?

Basic graphs (histograms, bar charts) are great for simple data.  
**Advanced graphs** help visualize:

- Distributional comparisons  
- Multivariate relationships  
- Model diagnostics

------------------------------------------------------------------------

## Quantile–Quantile (Q–Q) Plots

Q–Q plots compare the distribution of your data to a theoretical
distribution (usually normal).

**Purpose:** Check normality assumptions.

### Example in R

``` r
set.seed(123)
data <- rnorm(100, mean = 50, sd = 10)

qqnorm(data)
qqline(data, col = "red")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-79-1.png)<!-- -->

**Interpretation:**  
Points close to the red line indicate approximate normality.

------------------------------------------------------------------------

## Contour Plots

Contour plots display **density levels** of two continuous variables.

### Example in R

``` r
library(MASS)

set.seed(123)
data2 <- mvrnorm(
  n = 200,
  mu = c(0, 0),
  Sigma = matrix(c(1, 0.5, 0.5, 1), 2, 2)
)

x <- data2[, 1]
y <- data2[, 2]

kde <- kde2d(x, y, n = 50)

contour(kde, main = "Contour Plot")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-80-1.png)<!-- -->

**Interpretation:**  
Each contour line represents an area of equal density.

------------------------------------------------------------------------

## 3D Plots

3D plots show density surfaces or multivariate relationships in three
dimensions.

### Example in R

``` r
persp(
  kde$x, kde$y, kde$z,
  theta = 30, phi = 20,
  expand = 0.5,
  col = "lightblue",
  xlab = "X", ylab = "Y", zlab = "Density"
)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-81-1.png)<!-- -->

**Interpretation:**  
Peaks represent areas of higher density.

------------------------------------------------------------------------

## Statistical Literacy

- Advanced graphs reveal **non-linear patterns**, **clusters**, and
  **outliers**.
- More complex visuals must be interpreted carefully to avoid misreading
  patterns.

------------------------------------------------------------------------

# Exercises — With Code and Answers

## Exercise 1: Create a Q–Q plot for 100 simulated normal values

``` r
set.seed(456)
data <- rnorm(100)

qqnorm(data)
qqline(data, col = "blue")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-82-1.png)<!-- -->

------------------------------------------------------------------------

## Exercise 2: Generate a Q–Q plot for skewed data

``` r
skewed <- rexp(100, rate = 1)

qqnorm(skewed)
qqline(skewed, col = "red")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-83-1.png)<!-- -->

**Interpretation:**  
Curvature in the plot shows deviation from normality.

------------------------------------------------------------------------

## Exercise 3: Create a contour plot for bivariate normal data

``` r
library(MASS)

set.seed(789)
data2 <- mvrnorm(
  n = 300,
  mu = c(0, 0),
  Sigma = matrix(c(1, 0.7, 0.7, 1), 2, 2)
)

x <- data2[, 1]
y <- data2[, 2]

kde <- kde2d(x, y, n = 50)

contour(kde, main = "Contour Plot Example")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-84-1.png)<!-- -->

------------------------------------------------------------------------

## Exercise 4: Create a 3D surface plot for the same data

``` r
persp(
  kde$x, kde$y, kde$z,
  theta = 40, phi = 30,
  expand = 0.5,
  col = "lightgreen",
  xlab = "X", ylab = "Y", zlab = "Density"
)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-85-1.png)<!-- -->

------------------------------------------------------------------------

## Exercise 5: Why are Q–Q plots useful before parametric tests?

**Answer:**  
Parametric tests (t‑tests, ANOVA) assume normality.  
Q–Q plots provide a fast visual check of whether this assumption is
reasonable.  
If data strongly deviates from the line, transformations or
non-parametric alternatives may be needed.

------------------------------------------------------------------------

# Chapter 9: Sampling Distributions

## Introduction to Sampling Distributions

A **sampling distribution** is the probability distribution of a
statistic  
(e.g., the sample mean) that would be obtained from taking many
samples  
of the same size from a population.

**Why important?**

- Sampling distributions form the basis for **inferential
  statistics**.  
- They describe the **variability** of a statistic across repeated
  samples.

------------------------------------------------------------------------

## Sampling Distribution of the Mean

If we take many samples and compute their means:

- The distribution of those means becomes **approximately normal**  
  (Central Limit Theorem).  
- The mean of the sampling distribution equals the **population mean**
  $\mu$.  
- The **standard error (SE)** is:

``` r
plot.new()
text(0.5, 0.5,
     expression(SE == frac(sigma, sqrt(n))),
     cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-86-1.png)<!-- -->

<!-- $$ -->

<!-- SE = \frac{\sigma}{\sqrt{n}} -->

<!-- $$ -->

### Example in R

``` r
set.seed(123)

population <- rnorm(10000, mean = 50, sd = 10)

sample_means <- replicate(
  1000,
  mean(sample(population, size = 30))
)

hist(sample_means,
     main = "Sampling Distribution of the Mean",
     col = "lightblue")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-87-1.png)<!-- -->

``` r
mean(sample_means)
```

    ## [1] 50.0051

``` r
sd(sample_means)
```

    ## [1] 1.794127

------------------------------------------------------------------------

## Sampling Distribution of Difference Between Means

For two independent samples:

``` r
plot.new()
text(0.5, 0.5,
     expression(
       SE == sqrt( sigma[1]^2 / n[1] + sigma[2]^2 / n[2] )
     ),
     cex = 1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-88-1.png)<!-- -->

<!-- $$ -->

<!-- SE = \sqrt{ \frac{\sigma_1^2}{n_1} + \frac{\sigma_2^2}{n_2} } -->

<!-- $$ -->

------------------------------------------------------------------------

## Sampling Distribution of Pearson’s r

The correlation coefficient also has a sampling distribution.  
For large n, the sampling distribution of r becomes approximately
normal.

------------------------------------------------------------------------

## Sampling Distribution of p (Proportion)

For a proportion p:

``` r
plot.new()
text(0.5, 0.5,
     expression(SE == sqrt(p*(1-p)/n)),
     cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-89-1.png)<!-- -->

<!-- $$ -->

<!-- SE = \sqrt{\frac{p(1 - p)}{n}} -->

<!-- $$ -->

------------------------------------------------------------------------

## Statistical Literacy

- Larger samples → **smaller standard error** → more precise estimates.
- The standard error measures **uncertainty** in estimates.
- The **Central Limit Theorem** is fundamental to hypothesis testing  
  and confidence intervals.

------------------------------------------------------------------------

# Exercises — With Code and Answers

------------------------------------------------------------------------

## Exercise 1: Sampling distribution of the mean (n = 50)

``` r
set.seed(456)

population <- rnorm(10000, mean = 100, sd = 15)

sample_means <- replicate(
  1000,
  mean(sample(population, size = 50))
)

mean(sample_means)
```

    ## [1] 100.2198

``` r
sd(sample_means)
```

    ## [1] 2.164207

------------------------------------------------------------------------

## Exercise 2: Plot histogram of the sample means

``` r
hist(sample_means,
     main = "Sampling Distribution (n = 50)",
     col = "lightgreen")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-91-1.png)<!-- -->

------------------------------------------------------------------------

## Exercise 3: Compute standard error for n = 100

``` r
sigma <- 15
n <- 100

SE <- sigma / sqrt(n)
SE
```

    ## [1] 1.5

------------------------------------------------------------------------

## Exercise 4: Sampling distribution of a proportion (p = 0.4, n = 200)

``` r
set.seed(789)

p <- 0.4
n <- 200

sample_props <- replicate(
  1000,
  mean(rbinom(n, size = 1, prob = p))
)

mean(sample_props)
```

    ## [1] 0.402225

``` r
sd(sample_props)
```

    ## [1] 0.0350707

------------------------------------------------------------------------

## Exercise 5: Why do sampling distributions matter?

**Answer:**  
Sampling distributions allow us to:

- quantify uncertainty in sample statistics
- compute confidence intervals
- perform hypothesis tests
- understand how statistics vary across repeated samples

They are the foundation of inferential statistics.

------------------------------------------------------------------------

# Chapter 10: Estimation

## Introduction to Estimation

Estimation uses sample data to **infer population parameters**.

Two main types:

- **Point estimate:** A single value (e.g., sample mean)  
- **Interval estimate:** A range of plausible values (e.g., confidence
  interval)

**Goal:** Quantify uncertainty in sample-based estimates.

------------------------------------------------------------------------

## Degrees of Freedom

Degrees of freedom (df) represent the number of independent pieces of
information.

For sample variance:

``` r
plot.new()
text(0.5, 0.5, expression(df == n - 1), cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-94-1.png)<!-- -->

<!-- $$ -->

<!-- df = n - 1 -->

<!-- $$ -->

------------------------------------------------------------------------

## Characteristics of Estimators

- **Unbiased:** Expected value equals the true parameter  
- **Consistent:** Becomes more accurate as sample size increases  
- **Efficient:** Has the smallest variance among unbiased estimators

------------------------------------------------------------------------

## Confidence Intervals

A confidence interval provides a **range of plausible values** for a
parameter:

``` r
plot.new()
text(0.5, 0.5,
     expression(CI == "Point Estimate" %+-% "Margin of Error"),
     cex=1.4)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-95-1.png)<!-- -->

<!-- $$ -->

<!-- CI = \text{Point Estimate} \pm \text{Margin of Error} -->

<!-- $$ -->

------------------------------------------------------------------------

## Introduction to Confidence Intervals

For a mean:

Using known population SD:

``` r
plot.new()
text(
  0.5, 0.5,
  expression(CI == bar(x) ~ +- ~ z^frac(sigma, sqrt(n))),
  cex = 1.4
)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-96-1.png)<!-- -->

<!-- $$ -->

<!-- CI = \bar{x} \pm z^* \frac{\sigma}{\sqrt{n}} -->

<!-- $$ -->

Using sample SD (t‑distribution):

``` r
plot.new()
text(
  0.5, 0.5,
  expression(CI == bar(x) ~ +- ~ t^frac(s, sqrt(n))),
  cex = 1.4
)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-97-1.png)<!-- -->

<!-- $$ -->

<!-- CI = \bar{x} \pm t^* \frac{s}{\sqrt{n}} -->

<!-- $$ -->

------------------------------------------------------------------------

### Example in R: CI for a Mean

``` r
set.seed(123)

data <- rnorm(30, mean = 50, sd = 10)

xbar <- mean(data)
s <- sd(data)
n <- length(data)

alpha <- 0.05
t_crit <- qt(1 - alpha/2, df = n - 1)

margin <- t_crit * s / sqrt(n)

CI <- c(xbar - margin, xbar + margin)
CI
```

    ## [1] 45.86573 53.19219

------------------------------------------------------------------------

## t Distribution

Used when:

- Population SD is unknown
- Sample size is small (n \< 30)

------------------------------------------------------------------------

## Confidence Interval for the Mean

- Use **z** when σ is known and n large
- Use **t** when σ is unknown or n small

------------------------------------------------------------------------

## Difference Between Means

For two independent samples:

``` r
plot.new()
text(
  0.5, 0.5,
  expression(
    CI ==
      (bar(x)[1] - bar(x)[2]) ~+-~
      t * sqrt(
        frac(s[1]^2, n[1]) +
        frac(s[2]^2, n[2])
      )
  ),
  cex = 1.4
)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-99-1.png)<!-- -->

<!-- $$ -->

<!-- CI = (\bar{x}_1 - \bar{x}_2) \pm t^* \sqrt{\frac{s_1^2}{n_1} + \frac{s_2^2}{n_2}} -->

<!-- $$ -->

------------------------------------------------------------------------

## Correlation

Confidence intervals for correlation typically use **Fisher’s z
transformation**.

------------------------------------------------------------------------

## Proportion

Confidence interval for a proportion:

``` r
plot.new()
text(
  0.5, 0.5,
  expression(
    hat(p) ~+-~
      z^sqrt(
        frac(
          hat(p) * (1 - hat(p)),
          n
        )
      )
  ),
  cex = 1.4
)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-100-1.png)<!-- -->

<!-- $$ -->

<!-- \hat{p} \pm z^* \sqrt{ \frac{ \hat{p}(1 - \hat{p}) }{n} } -->

<!-- $$ -->

------------------------------------------------------------------------

## Statistical Literacy

- A 95% CI does **not** mean “95% chance the true value is inside this
  interval.”
- It means **95% of intervals constructed this way will contain the true
  parameter**.
- Wider intervals indicate **greater uncertainty**.

------------------------------------------------------------------------

# Exercises — With Code and Answers

------------------------------------------------------------------------

## Exercise 1: 95% CI for mean of simulated data

``` r
set.seed(456)

data <- rnorm(40, mean = 100, sd = 15)

xbar <- mean(data)
s <- sd(data)
n <- length(data)

alpha <- 0.05
t_crit <- qt(1 - alpha/2, df = n - 1)

margin <- t_crit * s / sqrt(n)

CI <- c(xbar - margin, xbar + margin)
CI
```

    ## [1]  96.4703 107.1669

------------------------------------------------------------------------

## Exercise 2: CI for difference between two means

``` r
group1 <- rnorm(30, mean = 50, sd = 10)
group2 <- rnorm(30, mean = 55, sd = 10)

mean_diff <- mean(group1) - mean(group2)

s1 <- sd(group1)
s2 <- sd(group2)

n1 <- length(group1)
n2 <- length(group2)

SE <- sqrt(s1^2/n1 + s2^2/n2)

t_crit <- qt(0.975, df = n1 + n2 - 2)

CI_diff <- c(mean_diff - t_crit * SE,
             mean_diff + t_crit * SE)

CI_diff
```

    ## [1] -9.1274207  0.5427001

------------------------------------------------------------------------

## Exercise 3: CI for a proportion (p = 0.4, n = 200)

``` r
p_hat <- 0.4
n <- 200

z_crit <- qnorm(0.975)

margin <- z_crit * sqrt(p_hat * (1 - p_hat) / n)

CI_prop <- c(p_hat - margin, p_hat + margin)
CI_prop
```

    ## [1] 0.3321049 0.4678951

------------------------------------------------------------------------

## Exercise 4: Why use t-distribution for small samples?

**Answer:**  
Because the **population SD is unknown**, and the t-distribution
correctly accounts for the extra uncertainty in estimating σ from small
samples.

------------------------------------------------------------------------

## Exercise 5: Simulate 1000 sample means and compute average CI width

``` r
set.seed(789)

widths <- replicate(1000, {
  data <- rnorm(30, mean = 50, sd = 10)

  xbar <- mean(data)
  s <- sd(data)
  n <- length(data)

  t_crit <- qt(0.975, df = n - 1)
  margin <- t_crit * s / sqrt(n)

  2 * margin
})

mean(widths)
```

    ## [1] 7.337961

------------------------------------------------------------------------

# Chapter 11: Logic of Hypothesis Testing

## Introduction

Hypothesis testing is a decision‑making framework used to evaluate
claims about population parameters using sample data.  
A hypothesis test evaluates two competing statements:

- H0: Null hypothesis (no effect, no difference)
- H1: Alternative hypothesis (some effect, some difference)

The idea is to measure how unlikely the sample data would be **if the
null hypothesis were true**.

Below is the typical notation for a sum of squared deviations, written
using your required format:

``` r
plot.new()
text(0.5, 0.5, expression(sum((x[i] - bar(x))^2, i==1, n)), cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-105-1.png)<!-- -->

## Significance Testing

A significance test computes a *test statistic* and compares it with a
known sampling distribution.  
This produces a *p‑value*, the probability of obtaining a value as
extreme as the observed statistic assuming H0 is true.

Example: one‑sample z-statistic (written in plain text):

z = (xbar – mu0) / (sigma / sqrt(n))

### Example Simulation Plot

``` r
set.seed(1)
zvals <- rnorm(10000, 0, 1)
hist(zvals, breaks=40, col="skyblue", main="Standard Normal Distribution")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-106-1.png)<!-- -->

## Type I and Type II Errors

- **Type I error**: Rejecting H0 when it is true (false positive).  
  Probability = alpha.

- **Type II error**: Failing to reject H0 when H1 is true (false
  negative).  
  Probability = beta.

Power = 1 - beta.

## One- and Two-Tailed Tests

A test is **one-tailed** when the direction of the effect is specified:

- H1: mu \> mu0  
  or
- H1: mu \< mu0

A **two‑tailed test** looks for any difference:

- H1: mu ≠ mu0

Plot showing critical regions:

``` r
curve(dnorm(x), from=-4, to=4, main="Two-Tailed Critical Regions")
abline(v=c(-1.96, 1.96), col="red", lwd=2)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-107-1.png)<!-- -->

## Interpreting Significant Results

A significant result (p \< alpha):

- Means the observed data are unlikely under H0.
- Does **not** prove the alternative is true with certainty.
- Does **not** measure effect size.

## Interpreting Non-Significant Results

A non-significant result:

- Means the data are not sufficiently inconsistent with H0.
- Does **not** prove H0 is true.
- May simply reflect insufficient power.

## Steps in Hypothesis Testing

1.  State H0 and H1.
2.  Select alpha (commonly 0.05).
3.  Compute the test statistic.
4.  Find the p-value.
5.  Make a decision.
6.  Interpret the result.

## Significance Testing and Confidence Intervals

A two‑tailed hypothesis test at alpha = 0.05 corresponds to a **95%
confidence interval**.  
If the hypothesized mean mu0 is **outside** the CI, H0 is rejected.

## Misconceptions

Common misunderstandings:

- p-value is NOT the probability H0 is true.
- Statistical significance is NOT practical importance.
- A non‑significant test does NOT confirm H0.

## Statistical Literacy

Students should understand:

- What p-values represent
- Why effect size matters
- Why sample size influences significance
- The difference between statistical and practical significance

------------------------------------------------------------------------

# Exercises

### **1. Define Type I and Type II errors in your own words.**

**Response:**  
Type I error is rejecting a true H0 (false positive).  
Type II error is failing to reject a false H0 (false negative).

------------------------------------------------------------------------

### **2. A researcher tests H0: mu = 50 and obtains p = 0.03. What conclusion should be drawn?**

**Response:**  
Because p \< 0.05, we reject H0 and conclude the population mean likely
differs from 50.

------------------------------------------------------------------------

### **3. Show the formula for a one-sample t-statistic using the required text‑based expression method.**

**Formula block:**

``` r
plot.new()
text(0.5, 0.5, expression(t == (bar(x) - mu[0]) / (s/sqrt(n))), cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-108-1.png)<!-- -->

------------------------------------------------------------------------

### **4. Perform a small simulation showing how sample size affects p-values.**

``` r
set.seed(1)

sim_p <- function(n) {
  x <- rnorm(n, mean=0.3, sd=1)
  ttest <- t.test(x, mu=0)
  return(ttest$p.value)
}

sizes <- c(10, 30, 100, 300)
pvals <- sapply(sizes, sim_p)

plot(sizes, pvals, type="b", pch=19, col="blue",
     main="Sample Size vs. p-value")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-109-1.png)<!-- -->

**Response:**  
Larger sample sizes lead to smaller p-values when an effect exists.

------------------------------------------------------------------------

### **5. Explain why a two-tailed test has a larger critical value than a one-tailed test.**

**Response:**  
Because the same alpha is split between two symmetrical tails, each tail
has alpha/2, making the rejection region farther from zero.

------------------------------------------------------------------------

# Chapter 12. Testing Means

This chapter develops hypothesis tests for population means.  
We examine tests for a **single mean**, the **difference between two
means**, and comparisons involving **independent** and **correlated**
groups.

To maintain consistency, mathematical symbols appear in *plain text*,
and visual formulas use your required graphical method.

------------------------------------------------------------------------

# Testing a Single Mean

A one‑sample t‑test evaluates whether the sample mean differs from a
hypothesized value:

t = (xbar – mu0) / (s / sqrt(n))

Below is the t‑formula using the required method:

``` r
plot.new()
text(0.5, 0.5,
     expression(t == (bar(x) - mu[0]) / (s/sqrt(n))),
     cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-110-1.png)<!-- -->

### Example Simulation Plot

Visualizing sampling variability:

``` r
set.seed(1)
xbar_vals <- replicate(5000, mean(rnorm(30, mean=50, sd=10)))
hist(xbar_vals, breaks=40, col="lightgreen",
     main="Sampling Distribution of the Sample Mean")
abline(v=50, col="red", lwd=2)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-111-1.png)<!-- -->

------------------------------------------------------------------------

# Differences between Two Means (Independent Groups)

This situation tests whether two unrelated samples differ.

The two‑sample t‑statistic (equal variances):

t = (xbar1 – xbar2) / sqrt( sp^2 \* (1/n1 + 1/n2) )

And the pooled variance expression:

``` r
plot.new()
text(0.5, 0.5,
     expression(s[p]^2 == (((n[1]-1)*s[1]^2 + (n[2]-1)*s[2]^2) / (n[1] + n[2] - 2))),
     cex=1.5)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-112-1.png)<!-- -->

### Example Plot

Comparing two groups:

``` r
group1 <- rnorm(100, mean=10, sd=2)
group2 <- rnorm(100, mean=12, sd=2)
boxplot(group1, group2, names=c("G1","G2"),
        main="Independent Groups Example")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-113-1.png)<!-- -->

------------------------------------------------------------------------

# All Pairwise Comparisons Among Means

When comparing more than two groups, pairwise t‑tests are used.  
However, these inflate Type I error, so corrections (e.g., Bonferroni)
are often applied.

Example dataset with three groups:

``` r
set.seed(1)
gA <- rnorm(40, 10, 2)
gB <- rnorm(40, 12, 2)
gC <- rnorm(40, 14, 2)
boxplot(list(A=gA,B=gB,C=gC), main="Three Groups for Pairwise Comparisons")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-114-1.png)<!-- -->

------------------------------------------------------------------------

# Specific Comparisons (Independent Groups)

Researchers often test only *particular* differences rather than all
possible pairs.  
These planned comparisons reduce the multiple‑test burden.

Formula for a general contrast:

contrast = sum( c_i \* xbar_i )

with t = contrast / sqrt( sum( c_i^2 \* s_i^2/n_i ) ).

``` r
plot.new()
text(0.5, 0.5, expression(C == sum(c[i] * bar(x)[i])),
     cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-115-1.png)<!-- -->

------------------------------------------------------------------------

# Difference Between Two Means (Correlated Pairs)

Used in paired designs (before‑after, matched subjects).  
The test is based on *difference scores*:

t = dbar / (sd / sqrt(n))

``` r
plot.new()
text(0.5, 0.5,
     expression(t == (bar(d) / (s[d]/sqrt(n)))),
     cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-116-1.png)<!-- -->

Example paired plot:

``` r
set.seed(1)
before <- rnorm(40, 50, 10)
after  <- before + rnorm(40, 5, 5)
plot(before, after, pch=19, col="blue",
     main="Paired Scores (Before vs After)")
abline(0,1,col="red",lwd=2)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-117-1.png)<!-- -->

------------------------------------------------------------------------

# Specific Comparisons (Correlated Observations)

Contrasts may also be used in repeated measures contexts.  
They follow the same mathematical logic but must account for
within‑subject variance.

------------------------------------------------------------------------

# Pairwise Comparisons (Correlated Observations)

Repeated measures ANOVA or paired t‑tests can be used for comparing
repeated conditions.  
Pairwise post‑hoc tests must account for correlated data.

Example:

``` r
set.seed(2)
A <- rnorm(30, 50, 5)
B <- A + rnorm(30, 3, 5)
C <- A + rnorm(30, -2, 5)
mat <- cbind(A,B,C)
matplot(mat, type="l", lty=1, col=c("red","blue","green"),
        main="Repeated Measures Across 3 Conditions")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-118-1.png)<!-- -->

------------------------------------------------------------------------

# Statistical Literacy

Students should understand:

- Why t‑tests depend on sample variability
- How correlation between paired observations affects power
- Why multiple comparisons inflate Type I error
- How effect sizes complement significance tests

------------------------------------------------------------------------

# Exercises

### **1. Explain the difference between independent and correlated (paired) samples.**

Independent samples involve unrelated individuals.  
Paired samples involve repeated measures or matched individuals.

------------------------------------------------------------------------

### **2. Write the formula for the pooled variance using the required expression method.**

``` r
plot.new()
text(0.5, 0.5,
     expression(s[p]^2 == (((n[1]-1)*s[1]^2 + (n[2]-1)*s[2]^2) / (n[1] + n[2] - 2))),
     cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-119-1.png)<!-- -->

------------------------------------------------------------------------

### **3. Conduct a simulation that compares the power of paired vs independent tests.**

``` r
set.seed(1)

simulate_power <- function(type="paired"){
  n <- 30
  if(type=="paired"){
    x <- rnorm(n, 0, 1)
    y <- x + rnorm(n, 0.5, 1)
    return(t.test(x,y,paired=TRUE)$p.value < 0.05)
  } else {
    x <- rnorm(n, 0, 1)
    y <- rnorm(n, 0.5, 1)
    return(t.test(x,y,paired=FALSE)$p.value < 0.05)
  }
}

paired_power <- mean(replicate(2000, simulate_power("paired")))
indep_power  <- mean(replicate(2000, simulate_power("independent")))

barplot(c(paired_power, indep_power),
        names=c("Paired","Independent"),
        col=c("skyblue","orange"),
        main="Power Comparison")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-120-1.png)<!-- -->

**Response:**  
Paired designs typically show higher power because they remove
between‑subject variability.

------------------------------------------------------------------------

### **4. When should you use a one‑sample t‑test instead of a paired t‑test?**

Use a one‑sample test when you compare a sample mean to a fixed value.  
Use a paired test when you compare linked observations.

------------------------------------------------------------------------

### **5. Describe one situation in which a contrast is more appropriate than post‑hoc tests.**

When researchers have a specific directional or theoretical prediction
prior to data collection, a contrast directly tests that prediction.

------------------------------------------------------------------------

# Chapter 13. Power

Statistical **power** is the probability that a test will correctly
reject a false null hypothesis.  
It depends on several factors: effect size, sample size, variability,
and significance level.

All mathematical expressions are provided in plain text, with formula
graphics using your required R method.

------------------------------------------------------------------------

# Introduction to Power

Power = probability of detecting an effect when the effect is real.  
More formally:

Power = 1 − beta

where beta is the probability of a Type II error.

Visual representation using your required notation:

``` r
plot.new()
text(0.5,0.5,expression(Power == 1 - beta), cex=1.8)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-121-1.png)<!-- -->

### Example Plot: Distributions Under H0 and H1

``` r
curve(dnorm(x,0,1), from=-4,to=6, col="blue", lwd=2,
      main="H0 vs H1 Distributions")
curve(dnorm(x,1.2,1), add=TRUE, col="red", lwd=2)
abline(v=1.64, col="black", lwd=2, lty=2)
legend("topright", legend=c("H0","H1"), col=c("blue","red"),
       lwd=2)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-122-1.png)<!-- -->

------------------------------------------------------------------------

# Example Calculations

The power of a test increases when:

- The true mean is further from the null value
- Standard deviation is smaller
- Sample size increases
- Alpha is increased

### Illustration: Power Curve

``` r
library(pwr)
effect_sizes <- seq(0,1,0.05)
power_vals <- sapply(effect_sizes, function(d)
  pwr.t.test(d=d, n=30, sig.level=0.05, type="two.sample")$power)

plot(effect_sizes, power_vals, type="l", lwd=3, col="purple",
     main="Power Curve for Two-Sample Test")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-123-1.png)<!-- -->

------------------------------------------------------------------------

# Factors Affecting Power

1.  **Effect Size**  
    Larger true differences yield more power.

2.  **Sample Size**  
    Larger n reduces sampling error and increases power.

3.  **Variability of the Data (σ)**  
    Lower variability → more power.

4.  **Significance Level (α)**  
    Higher alpha increases power but also increases Type I error.

Formula for standardized effect size (Cohen’s d):

``` r
plot.new()
text(0.5,0.5,expression(d == (mu[1] - mu[2]) / s[p]), cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-124-1.png)<!-- -->

------------------------------------------------------------------------

### Simulation: Power Increases With Sample Size

``` r
set.seed(1)
sim_power_n <- function(n){
  mean(replicate(1000, {
    x <- rnorm(n, 0.4, 1)
    t.test(x, mu=0)$p.value < 0.05
  }))
}

sizes <- c(10,20,40,80,160)
powers <- sapply(sizes, sim_power_n)

plot(sizes, powers, type="b", pch=19, col="darkgreen",
     main="Power vs Sample Size")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-125-1.png)<!-- -->

------------------------------------------------------------------------

# Statistical Literacy

Students should understand:

- Power is not fixed — it varies across study designs
- A non-significant result may simply reflect inadequate power
- Power analysis should be conducted **before** data collection

------------------------------------------------------------------------

# Exercises

### **1. Define statistical power in your own words.**

**Response:**  
Power is the probability that a statistical test correctly detects an
effect when the effect truly exists.

------------------------------------------------------------------------

### **2. Use the required expression method to display the formula for beta.**

``` r
plot.new()
text(0.5,0.5,expression(beta == P( fail~to~reject~H[0]~when~H[1]~is~true )), cex=1.3)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-126-1.png)<!-- -->

------------------------------------------------------------------------

### **3. Simulate power for effect size d = 0.5 at n = 20, 50, and 100.**

``` r
set.seed(2)
power_sim <- function(n){
  mean(replicate(2000, {
    x <- rnorm(n, 0.5, 1)
    t.test(x, mu=0)$p.value < 0.05
  }))
}

nvals <- c(20,50,100)
pvals <- sapply(nvals, power_sim)

barplot(pvals, names.arg=nvals, col="steelblue",
        main="Simulated Power for d = 0.5")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-127-1.png)<!-- -->

**Response:**  
Power increases substantially as n increases.

------------------------------------------------------------------------

### **4. Why does reducing variability increase statistical power?**

**Response:**  
Lower variability makes true differences easier to detect because
sampling distributions are narrower.

------------------------------------------------------------------------

### **5. Show graphically (using your required style) the equation linking power, alpha, and beta.**

``` r
plot.new()
text(0.5,0.5,expression(Power == 1 - beta ~~";"~~ alpha == P(Type~I~error)),
     cex=1.2)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-128-1.png)<!-- -->

------------------------------------------------------------------------

# Chapter 14. Regression

Regression analysis examines the relationship between a predictor
variable (X) and an outcome variable (Y).  
This chapter covers **simple linear regression**, its core formulas,
inferential statistics, influential observations, regression to the
mean, and an introduction to **multiple regression**.

Mathematical symbols appear in plain text, and all formal equations are
displayed using your required R graphical-expression method.

------------------------------------------------------------------------

# Introduction to Linear Regression

Simple linear regression models the relationship:

Y = b0 + b1 \* X + error

Graphical representation using your required method:

``` r
plot.new()
text(0.5, 0.5, expression(Y == b[0] + b[1]*X + epsilon), cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-129-1.png)<!-- -->

### Example Scatterplot with Fitted Line

``` r
set.seed(1)
x <- rnorm(100, 10, 3)
y <- 5 + 0.8*x + rnorm(100, 0, 3)
plot(x, y, pch=19, col="blue", main="Scatterplot with Regression Line")
abline(lm(y ~ x), col="red", lwd=3)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-130-1.png)<!-- -->

------------------------------------------------------------------------

# Partitioning the Sums of Squares

Total variation in Y is partitioned into:

- SS_total
- SS_regression
- SS_residual

Formula representation:

``` r
plot.new()
text(0.5,0.5,expression(SS[T] == SS[R] + SS[E]), cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-131-1.png)<!-- -->

### Example ANOVA Table from a Regression Model

``` r
model <- lm(y ~ x)
anova(model)
```

    ## Analysis of Variance Table
    ## 
    ## Response: y
    ##           Df Sum Sq Mean Sq F value    Pr(>F)    
    ## x          1 458.83  458.83  55.002 4.364e-11 ***
    ## Residuals 98 817.52    8.34                      
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

------------------------------------------------------------------------

# Standard Error of the Estimate

Standard error of estimate:

SE = sqrt( SS_residual / (n - 2) )

Graphical formula:

``` r
plot.new()
text(0.5,0.5,expression(SE == sqrt(SS[E] / (n - 2))), cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-133-1.png)<!-- -->

### Example Visualization: Residual Distribution

``` r
res <- resid(model)
hist(res, breaks=30, col="lightblue", main="Residual Distribution")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-134-1.png)<!-- -->

------------------------------------------------------------------------

# Inferential Statistics for b and r

The slope b1 is tested using:

t = b1 / SE_b1

Correlation r is tested using:

t = r \* sqrt((n - 2) / (1 - r^2))

Graphical slope-test expression:

``` r
plot.new()
text(0.5,0.5,expression(t == b[1] / SE[b[1]]), cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-135-1.png)<!-- -->

### Example Output

``` r
summary(model)
```

    ## 
    ## Call:
    ## lm(formula = y ~ x)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -5.6305 -1.8413 -0.4185  1.6182  7.0385 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)   4.8975     1.1493   4.261 4.68e-05 ***
    ## x             0.7989     0.1077   7.416 4.36e-11 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 2.888 on 98 degrees of freedom
    ## Multiple R-squared:  0.3595, Adjusted R-squared:  0.3529 
    ## F-statistic:    55 on 1 and 98 DF,  p-value: 4.364e-11

------------------------------------------------------------------------

# Influential Observations

Influential points disproportionately affect parameter estimates.  
Common diagnostics include:

- Cook’s distance
- Leverage (hat-values)
- Standardized residuals

### Cook’s Distance Plot

``` r
plot(cooks.distance(model), type="h", col="red", lwd=2,
     main="Cook's Distance")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-137-1.png)<!-- -->

------------------------------------------------------------------------

# Regression Toward the Mean

Regression toward the mean happens when extreme scores tend to move
closer to the average on repeated measurement.

Simple graphical demonstration:

``` r
set.seed(2)
true <- rnorm(100)
obs1 <- true + rnorm(100, 0, 1)
obs2 <- true + rnorm(100, 0, 1)
plot(obs1, obs2, pch=19, col="purple",
     main="Regression Toward the Mean")
abline(lm(obs2 ~ obs1), col="red", lwd=3)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-138-1.png)<!-- -->

------------------------------------------------------------------------

# Introduction to Multiple Regression

Multiple regression extends the model to include multiple predictors:

Y = b0 + b1*X1 + b2*X2 + … + error

Graphical expression:

``` r
plot.new()
text(0.5,0.5,expression(Y == b[0] + b[1]*X[1] + b[2]*X[2] + epsilon), cex=1.3)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-139-1.png)<!-- -->

### Example Multiple Regression Fit

``` r
x2 <- rnorm(100, 5, 2)
model2 <- lm(y ~ x + x2)
summary(model2)
```

    ## 
    ## Call:
    ## lm(formula = y ~ x + x2)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -5.6615 -1.8001 -0.3921  1.7064  6.9985 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)   5.6017     1.3835   4.049 0.000104 ***
    ## x             0.8113     0.1087   7.467 3.58e-11 ***
    ## x2           -0.1478     0.1613  -0.916 0.361869    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 2.891 on 97 degrees of freedom
    ## Multiple R-squared:  0.365,  Adjusted R-squared:  0.3519 
    ## F-statistic: 27.88 on 2 and 97 DF,  p-value: 2.724e-10

### 3D Scatterplot Representation (optional)

``` r
library(scatterplot3d)
scatterplot3d(x, x2, y, pch=19, color="blue",
              main="3D Scatterplot of Y ~ X1 + X2")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-141-1.png)<!-- -->

------------------------------------------------------------------------

# Statistical Literacy

Students should understand:

- Regression describes relationships, not causation
- Outliers can influence slopes and intercepts
- More predictors do not guarantee better models
- Importance of residual analysis
- How multicollinearity impacts interpretation

------------------------------------------------------------------------

# Exercises

### **1. Write out the plain-text formula for simple linear regression.**

**Response:**  
Y = b0 + b1 \* X

------------------------------------------------------------------------

### **2. Show the formula for the slope b1 using the graphical-expression method.**

``` r
plot.new()
text(0.5,0.5,
     expression(b[1] == (sum((X - bar(X))*(Y - bar(Y)))) /
                      (sum((X - bar(X))^2))),
     cex=1.5)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-142-1.png)<!-- -->

------------------------------------------------------------------------

### **3. Fit a simple regression model and plot the residuals vs. fitted values.**

``` r
plot(fitted(model), resid(model),
     main="Residuals vs Fitted",
     pch=19, col="darkgreen")
abline(h=0, col="red", lwd=2)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-143-1.png)<!-- -->

**Response:**  
Residuals should show no systematic pattern if model assumptions hold.

------------------------------------------------------------------------

### **4. Explain what Cook’s distance measures.**

**Response:**  
Cook’s distance measures how much the regression coefficients would
change if a single observation were removed. Large values indicate
influential points.

------------------------------------------------------------------------

### **5. Demonstrate multicollinearity by creating two correlated predictors and fitting a model.**

``` r
set.seed(3)
xA <- rnorm(100)
xB <- xA*0.9 + rnorm(100,0,0.3)
y2 <- 2 + 1.5*xA + rnorm(100)

model_mc <- lm(y2 ~ xA + xB)
summary(model_mc)
```

    ## 
    ## Call:
    ## lm(formula = y2 ~ xA + xB)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -2.31525 -0.65375  0.04323  0.68272  2.39972 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  2.11295    0.10269  20.576  < 2e-16 ***
    ## xA           1.52531    0.29932   5.096 1.71e-06 ***
    ## xB          -0.06751    0.31386  -0.215     0.83    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 1.027 on 97 degrees of freedom
    ## Multiple R-squared:  0.6042, Adjusted R-squared:  0.596 
    ## F-statistic: 74.03 on 2 and 97 DF,  p-value: < 2.2e-16

**Response:**  
Coefficients become unstable and inflated because the predictors carry
overlapping information.

------------------------------------------------------------------------

# Chapter 15. Analysis of Variance

ANOVA tests whether **three or more means** differ significantly.  
Instead of comparing means pairwise with many t‑tests, ANOVA partitions
variance into:

- Between-groups variation  
- Within-groups variation

Mathematical notation is in plain text; formulas are visualized using
your required R plotting method.

------------------------------------------------------------------------

# Introduction

ANOVA evaluates the null hypothesis:

H0: all group means are equal  
H1: at least one mean differs

The F-ratio compares between-group to within-group variance:

F = MS_between / MS_within

Graphical representation:

``` r
plot.new()
text(0.5,0.5,expression(F == MS[b] / MS[w]), cex=1.7)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-145-1.png)<!-- -->

------------------------------------------------------------------------

# Analysis of Variance Designs

ANOVA can be:

- **Between-subjects** (independent groups)
- **Within-subjects** (repeated measures)
- **Mixed designs** (both)

------------------------------------------------------------------------

# Between- and Within-Subjects Factors

A factor is **between-subjects** if each participant belongs to only one
level.  
A factor is **within-subjects** if each participant receives all levels.

------------------------------------------------------------------------

# One-Factor ANOVA (Between Subjects)

The classic one-way ANOVA uses:

MS_between = SS_between / (k - 1)  
MS_within = SS_within / (N - k)

F = MS_between / MS_within

Graphical formula:

``` r
plot.new()
text(0.5,0.5,
     expression(MS[b] == SS[b] / (k - 1)),
     cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-146-1.png)<!-- -->

### Example ANOVA Simulation and Plot

``` r
set.seed(1)
g1 <- rnorm(40, 10, 2)
g2 <- rnorm(40, 12, 2)
g3 <- rnorm(40, 14, 2)

anova_data <- data.frame(
  score = c(g1,g2,g3),
  group = factor(rep(1:3, each=40))
)

boxplot(score ~ group, data=anova_data,
        col=c("lightblue","lightgreen","pink"),
        main="Three-Group ANOVA Example")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-147-1.png)<!-- -->

``` r
summary(aov(score ~ group, data=anova_data))
```

    ##              Df Sum Sq Mean Sq F value Pr(>F)    
    ## group         2  328.0  164.01   51.89 <2e-16 ***
    ## Residuals   117  369.8    3.16                   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

------------------------------------------------------------------------

# Multi-Factor Between-Subjects Designs

Two-factor ANOVA evaluates:

- **Main effects** of Factor A
- **Main effects** of Factor B
- **Interaction** between A and B

Example interaction plot:

``` r
set.seed(2)
A <- factor(rep(c("Low","High"), each=60))
B <- factor(rep(c("X","Y"), times=60))

y <- 5 + ifelse(A=="High", 2, 0) +
        ifelse(B=="Y",   1, 0) +
        ifelse(A=="High" & B=="Y", 2, 0) +
        rnorm(120, 0, 2)

interaction.plot(A, B, y, col=c("red","blue"), lwd=2)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-148-1.png)<!-- -->

------------------------------------------------------------------------

# Unequal Sample Sizes

When group sizes differ, ANOVA still works, but:

- Type I sums of squares depend on factor order
- Type II/III sums of squares adjust for imbalance

------------------------------------------------------------------------

# Tests Supplementing ANOVA

If ANOVA is significant, post-hoc tests identify specific group
differences:

- Tukey’s HSD
- Bonferroni correction
- Scheffé method

Example:

``` r
TukeyHSD(aov(score ~ group, data=anova_data))
```

    ##   Tukey multiple comparisons of means
    ##     95% family-wise confidence level
    ## 
    ## Fit: aov(formula = score ~ group, data = anova_data)
    ## 
    ## $group
    ##         diff      lwr      upr   p adj
    ## 2-1 2.056481 1.112770 3.000193 2.9e-06
    ## 3-1 4.049627 3.105915 4.993338 0.0e+00
    ## 3-2 1.993146 1.049434 2.936857 5.7e-06

------------------------------------------------------------------------

# Within-Subjects ANOVA

Repeated measures ANOVA accounts for correlated observations.  
Key assumptions include **sphericity**, often tested with **Mauchly’s
test**.

### Example Repeated Measures Visualization

``` r
set.seed(3)
time1 <- rnorm(30, 10, 3)
time2 <- time1 + rnorm(30, 2, 2)
time3 <- time1 + rnorm(30, 4, 2)

matplot(cbind(time1,time2,time3), type="l",
        col=c("red","green","blue"), lty=1,
        main="Repeated Measures Across 3 Time Points")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-150-1.png)<!-- -->

------------------------------------------------------------------------

# Statistical Literacy

Students should understand:

- Why ANOVA is superior to repeated t-tests
- How interactions change interpretation
- Importance of model assumptions (normality, homogeneity, sphericity)
- When post-hoc tests are needed

------------------------------------------------------------------------

# Exercises

### **1. What does ANOVA test?**

**Response:**  
ANOVA tests whether three or more group means differ significantly.

------------------------------------------------------------------------

### **2. Use your required R expression method to display the F-ratio.**

``` r
plot.new()
text(0.5,0.5,expression(F == MS[b] / MS[w]), cex=1.7)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-151-1.png)<!-- -->

------------------------------------------------------------------------

### **3. Simulate a one-way ANOVA with three groups and report the F-value.**

``` r
set.seed(4)
x1 <- rnorm(25, 5, 1)
x2 <- rnorm(25, 7, 1)
x3 <- rnorm(25, 9, 1)

dat <- data.frame(
  y=c(x1,x2,x3),
  g=factor(rep(1:3, each=25))
)

summary(aov(y ~ g, data=dat))
```

    ##             Df Sum Sq Mean Sq F value Pr(>F)    
    ## g            2 165.54   82.77     105 <2e-16 ***
    ## Residuals   72  56.76    0.79                   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

------------------------------------------------------------------------

### **4. Why do we use post-hoc tests after a significant ANOVA?**

**Response:**  
Because ANOVA only tells us that *at least one* difference exists—it
does not identify *which specific means* differ.

------------------------------------------------------------------------

### **5. Create an interaction plot for a 2x2 factorial design.**

``` r
set.seed(5)
A <- factor(rep(c("A1","A2"), each=40))
B <- factor(rep(c("B1","B2"), times=40))
Y <- 10 + ifelse(A=="A2", 3, 0) +
          ifelse(B=="B2", 2, 0) +
          ifelse(A=="A2" & B=="B2", 4, 0) +
          rnorm(80,0,2)

interaction.plot(A,B,Y, col=c("purple","orange"), lwd=2)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-153-1.png)<!-- -->

------------------------------------------------------------------------

# Chapter 16. Transformations

Transformations help meet statistical assumptions such as:

- Linearity  
- Homogeneity of variance  
- Normality  
- Reducing skew

Common transformations include **log**, **square root**, **reciprocal**,
and the **Box–Cox family**.  
All mathematical notation is plain text, and formal expressions use the
required R plotting method.

------------------------------------------------------------------------

# Log Transformations

A log transformation reduces right skew and stabilizes variance.  
Applied as:

Y_transformed = log(Y)

### Formula Visualization

``` r
plot.new()
text(0.5,0.5, expression(Y[t] == log(Y)), cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-154-1.png)<!-- -->

### Example Plot

``` r
set.seed(1)
y <- rexp(200, rate=0.5)
par(mfrow=c(1,2))
hist(y, main="Original Data", col="skyblue", breaks=30)
hist(log(y), main="Log-Transformed Data", col="lightgreen", breaks=30)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-155-1.png)<!-- -->

``` r
par(mfrow=c(1,1))
```

------------------------------------------------------------------------

# Tukey Ladder of Powers

The ladder includes transformations of the form:

Y^p where p ranges from −2 to +2.

Common examples:

- p = 2 (square)
- p = 1 (identity)
- p = 1/2 (square root)
- p = 0 (log)
- p = −1 (reciprocal)

### Formula Visualization

``` r
plot.new()
text(0.5,0.5, expression(Y[t] == Y^p), cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-156-1.png)<!-- -->

### Example Ladder Comparison

``` r
powers <- c(2,1,0.5,0,-1)
par(mfrow=c(2,3))
for(p in powers){
  yt <- if(p==0) log(y) else y^p
  hist(yt, main=paste("p =", p), col="orange", breaks=25)
}
par(mfrow=c(1,1))
```

![](stats0_md_files/figure-gfm/unnamed-chunk-157-1.png)<!-- -->

------------------------------------------------------------------------

# Box–Cox Transformations

The Box–Cox transformation generalizes the ladder:

If p ≠ 0:  
Y_trans = (Y^p – 1) / p  
If p = 0:  
Y_trans = log(Y)

### Visualization of Box–Cox Formula

``` r
plot.new()
text(0.5,0.5,
     expression(Y[t] == (Y^p - 1) / p),
     cex=1.5)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-158-1.png)<!-- -->

### Example: Estimating Optimal p

``` r
library(MASS)
bc <- boxcox(y ~ 1, lambda=seq(-2,2,0.1))
```

![](stats0_md_files/figure-gfm/unnamed-chunk-159-1.png)<!-- -->

------------------------------------------------------------------------

# Statistical Literacy

Students should understand:

- Transformations do **not** change the underlying order of data
- They modify scale, not relationships
- They improve modeling assumptions without altering study design
- Transformation choice should be guided by diagnostic plots

------------------------------------------------------------------------

# Exercises

### **1. Explain why log transformations reduce skew.**

**Response:**  
Because taking logs compresses large values more than small ones,
pulling long right tails closer to the center.

------------------------------------------------------------------------

### **2. Use the required R expression method to display the ladder of powers.**

``` r
plot.new()
text(0.5,0.5, expression(Y[t] == Y^p), cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-160-1.png)<!-- -->

------------------------------------------------------------------------

### **3. Simulate data with strong right skew and compare square-root and log transforms.**

``` r
set.seed(2)
x <- rgamma(300, shape=1, scale=4)

par(mfrow=c(1,3))
hist(x, main="Original", col="pink", breaks=30)
hist(sqrt(x), main="Square Root", col="lightblue", breaks=30)
hist(log(x), main="Log", col="lightgreen", breaks=30)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-161-1.png)<!-- -->

``` r
par(mfrow=c(1,1))
```

------------------------------------------------------------------------

### **4. When is p = 0 used in the Box–Cox family?**

**Response:**  
When p = 0, the Box–Cox transformation becomes the natural log
transformation.

------------------------------------------------------------------------

### **5. Fit a simple model before and after a transformation and compare residuals.**

``` r
set.seed(3)
x <- rnorm(100)
y <- exp(0.5*x + rnorm(100, 0, 0.2))

model_raw <- lm(y ~ x)
model_log <- lm(log(y) ~ x)

par(mfrow=c(1,2))
plot(fitted(model_raw), resid(model_raw),
     main="Residuals: Raw", pch=19)
plot(fitted(model_log), resid(model_log),
     main="Residuals: Log-Transformed", pch=19)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-162-1.png)<!-- -->

``` r
par(mfrow=c(1,1))
```

**Response:**  
Residuals usually appear more homoscedastic after log transformation.

------------------------------------------------------------------------

# Chapter 17. Chi Square

The chi-square (χ²) family of tests evaluates whether observed
frequencies differ from expected frequencies.  
It applies to **categorical** variables and is widely used for:

- Goodness-of-fit tests  
- Tests of independence in contingency tables  
- Tests of association

Mathematical notation is given in plain text, and all formal expressions
use your required R plotting style.

------------------------------------------------------------------------

# Chi Square Distribution

The chi-square distribution arises from the sum of squared standard
normal variables.  
It is right-skewed, with the shape depending on the degrees of freedom.

### Formula Visualization

χ² = Σ( (O − E)² / E )

``` r
plot.new()
text(0.5,0.5,
     expression(chi^2 == sum((O - E)^2 / E)),
     cex=1.7)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-163-1.png)<!-- -->

### Example Distribution Plot

``` r
curve(dchisq(x, df=4), from=0, to=20,
      col="blue", lwd=3,
      main="Chi-Square Distribution (df = 4)")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-164-1.png)<!-- -->

------------------------------------------------------------------------

# One-Way Tables (Testing Goodness of Fit)

Goodness-of-fit tests compare observed frequencies to expected
frequencies under a theoretical distribution.

Steps:

1.  Specify expected proportions.
2.  Compute expected counts: E = N \* p.
3.  Compute χ² statistic.
4.  Determine p-value from χ² distribution.

### Example: Rolling a Die

``` r
obs <- c(18,14,17,20,15,16)
exp <- rep(sum(obs)/6, 6)

chisq.test(obs, p=rep(1/6,6))
```

    ## 
    ##  Chi-squared test for given probabilities
    ## 
    ## data:  obs
    ## X-squared = 1.4, df = 5, p-value = 0.9243

------------------------------------------------------------------------

# Contingency Tables

Used to assess independence between two categorical variables.

### Example 2×2 Table

``` r
tbl <- matrix(c(30,20,10,40), nrow=2)
chisq.test(tbl)
```

    ## 
    ##  Pearson's Chi-squared test with Yates' continuity correction
    ## 
    ## data:  tbl
    ## X-squared = 15.042, df = 1, p-value = 0.0001052

Plot of counts:

``` r
barplot(tbl, beside=TRUE, col=c("red","blue"),
        main="Contingency Table Counts")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-167-1.png)<!-- -->

------------------------------------------------------------------------

# Statistical Literacy

Students should understand:

- Chi-square tests require sufficiently large expected counts
- χ² tests cannot be used for continuous data
- Independence does not imply causation
- Standardized residuals help diagnose model fit

------------------------------------------------------------------------

# Exercises

### **1. What is the chi-square test used for?**

**Response:**  
To test whether observed categorical frequencies differ from expected
frequencies.

------------------------------------------------------------------------

### **2. Display the chi-square formula using your required plotting method.**

``` r
plot.new()
text(0.5,0.5,
     expression(chi^2 == sum((O - E)^2 / E)),
     cex=1.7)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-168-1.png)<!-- -->

------------------------------------------------------------------------

### **3. Run a 3×3 contingency table test and plot the results.**

``` r
set.seed(1)
tbl <- matrix(sample(1:50, 9), nrow=3)
chisq.test(tbl)
```

    ## 
    ##  Pearson's Chi-squared test
    ## 
    ## data:  tbl
    ## X-squared = 63.919, df = 4, p-value = 4.347e-13

``` r
barplot(tbl, beside=TRUE,
        col=c("red","green","blue"),
        main="3x3 Contingency Table")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-169-1.png)<!-- -->

------------------------------------------------------------------------

### **4. Explain what standardized residuals indicate.**

**Response:**  
They show how far observed frequencies deviate from expected ones in
standard deviation units. Large residuals indicate cells contributing
heavily to the chi-square statistic.

------------------------------------------------------------------------

### **5. Simulate 200 chi-square statistics under H0 and plot the distribution.**

``` r
set.seed(2)
sim_vals <- replicate(200, {
  obs <- rmultinom(1, size=60, prob=c(.3,.3,.4))
  exp <- c(18,18,24)
  sum((obs - exp)^2 / exp)
})

hist(sim_vals, breaks=25, col="lightblue",
     main="Simulated Chi-Square Statistics")
curve(dchisq(x, df=2) * length(sim_vals) * diff(range(sim_vals))/25,
      add=TRUE, col="red", lwd=2)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-170-1.png)<!-- -->

------------------------------------------------------------------------

# Chapter 18. Distribution-Free Tests

Distribution-free (nonparametric) tests do not assume normality or other
specific distributions.  
They are especially useful for:

- Ranked data  
- Ordinal outcomes  
- Skewed distributions  
- Small sample sizes

All mathematical expressions are provided in plain text; all formula
blocks use your required R plotting method.

------------------------------------------------------------------------

# Benefits

Distribution-free tests:

- Avoid strict parametric assumptions  
- Are robust to outliers  
- Allow valid inference for ranks  
- Often require fewer assumptions about variance equality

------------------------------------------------------------------------

# Randomization Tests: Two Conditions

Randomization (or permutation) tests compare two groups by resampling
data under the null hypothesis.

### Example Permutation Distribution

``` r
set.seed(1)
x <- rnorm(20, 5, 1)
y <- rnorm(20, 6, 1)

obs_diff <- mean(x) - mean(y)

perm_diffs <- replicate(2000, {
  pooled <- sample(c(x,y))
  mean(pooled[1:20]) - mean(pooled[21:40])
})

hist(perm_diffs, col="lightblue", main="Permutation Distribution")
abline(v=obs_diff, col="red", lwd=3)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-171-1.png)<!-- -->

------------------------------------------------------------------------

# Randomization Tests: Two or More Conditions

Used to compare multiple groups by permuting group labels.

### Example with Three Groups

``` r
set.seed(2)
g1 <- rnorm(10, 10, 2)
g2 <- rnorm(10, 12, 2)
g3 <- rnorm(10, 13, 2)
```

------------------------------------------------------------------------

# Randomization Tests: Association (Pearson’s r)

Permutation tests evaluate correlations by randomly shuffling one
variable and recomputing r.

### Formula Visualization

``` r
plot.new()
text(0.5,0.5,
     expression(r == sum((X - bar(X))*(Y - bar(Y))) /
                   sqrt(sum((X - bar(X))^2) * sum((Y - bar(Y))^2))),
     cex=1.2)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-173-1.png)<!-- -->

------------------------------------------------------------------------

# Randomization Tests: Contingency Tables (Fisher’s Exact Test)

Fisher’s test computes exact probabilities for small contingency tables
without large-sample assumptions.

### Example:

``` r
matrix(c(8,2,1,9), nrow=2) |> fisher.test()
```

    ## 
    ##  Fisher's Exact Test for Count Data
    ## 
    ## data:  matrix(c(8, 2, 1, 9), nrow = 2)
    ## p-value = 0.005477
    ## alternative hypothesis: true odds ratio is not equal to 1
    ## 95 percent confidence interval:
    ##     2.057999 1740.081669
    ## sample estimates:
    ## odds ratio 
    ##   27.32632

------------------------------------------------------------------------

# Rank Randomization: Two Conditions (Mann‑Whitney U / Wilcoxon Rank Sum)

The Mann‑Whitney U test compares ranks from two independent groups.

### U-formula Visualization

``` r
plot.new()
text(0.5,0.5,
     expression(U == n[1]*n[2] + n[1]*(n[1]+1)/2 - sum(R[1])),
     cex=1.4)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-175-1.png)<!-- -->

### Example Plot

``` r
set.seed(3)
a <- rnorm(25, 5, 1)
b <- rnorm(25, 6, 1)
boxplot(list(A=a,B=b), main="Rank Comparison")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-176-1.png)<!-- -->

------------------------------------------------------------------------

# Rank Randomization: Two or More Conditions (Kruskal–Wallis)

Rank-based alternative to one-way ANOVA.

### Example

``` r
kruskal.test(list(g1,g2,g3))
```

    ## 
    ##  Kruskal-Wallis rank sum test
    ## 
    ## data:  list(g1, g2, g3)
    ## Kruskal-Wallis chi-squared = 6.9058, df = 2, p-value = 0.03165

------------------------------------------------------------------------

# Rank Randomization for Association (Spearman’s ρ)

Spearman’s rho is Pearson’s correlation on ranked data.

### Formula Visualization

``` r
plot.new()
text(0.5,0.5,
     expression(rho == 1 - (6*sum(d[i]^2)) / (n*(n^2 - 1))),
     cex=1.3)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-178-1.png)<!-- -->

------------------------------------------------------------------------

# Statistical Literacy

Students should know:

- Why nonparametric tests sacrifice power for robustness
- When ranks are more meaningful than raw values
- Why permutation tests approximate sampling distributions directly
- Why Fisher’s test is exact for small samples

------------------------------------------------------------------------

# Exercises

### **1. What is the main advantage of distribution‑free tests?**

**Response:**  
They do not rely on strict distributional assumptions and remain valid
under a wide range of conditions.

------------------------------------------------------------------------

### **2. Display the formula for Spearman’s rho using the required R method.**

``` r
plot.new()
text(0.5,0.5,
     expression(rho == 1 - (6*sum(d[i]^2)) / (n*(n^2 - 1))),
     cex=1.3)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-179-1.png)<!-- -->

------------------------------------------------------------------------

### **3. Perform a Mann‑Whitney test on two generated samples.**

``` r
set.seed(4)
x <- rnorm(20, 5, 1)
y <- rnorm(20, 6, 1)
wilcox.test(x, y)
```

    ## 
    ##  Wilcoxon rank sum exact test
    ## 
    ## data:  x and y
    ## W = 83, p-value = 0.00116
    ## alternative hypothesis: true location shift is not equal to 0

------------------------------------------------------------------------

### **4. Why are permutation tests considered exact?**

**Response:**  
They compute the sampling distribution under the null by evaluating all
(or many) possible rearrangements of the data.

------------------------------------------------------------------------

### **5. Simulate a permutation distribution for Pearson’s r.**

``` r
set.seed(5)
X <- rnorm(30)
Y <- X*0.5 + rnorm(30)

obs_r <- cor(X,Y)

perm_r <- replicate(1000, {
  Yperm <- sample(Y)
  cor(X, Yperm)
})

hist(perm_r, col="lightgreen",
     main="Permutation Distribution for r")
abline(v=obs_r, col="red", lwd=3)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-181-1.png)<!-- -->

**Response:**  
The observed correlation’s extremity relative to the permutation
distribution indicates significance.

------------------------------------------------------------------------

# Chapter 19. Effect Size

Effect size quantifies the **magnitude** of an observed effect,
independent of sample size.  
Statistical significance only indicates whether an effect exists; effect
size shows **how large** it is.

This chapter covers:

- Proportions  
- Differences between means  
- Proportion of variance explained (e.g., r², η²)

Formulas appear in plain text; formal expressions use your required
graphical R method.

------------------------------------------------------------------------

# Proportions

For proportions, the effect size for two groups is often expressed as:

d = (p1 – p2) / sqrt( p \* (1 – p) )

where p = pooled proportion.

### Visualization Using Required Method

``` r
plot.new()
text(0.5,0.5,
     expression(d == (p[1] - p[2]) / sqrt(p*(1-p))),
     cex=1.5)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-182-1.png)<!-- -->

### Example Simulation

``` r
set.seed(1)
p1 <- rbinom(1000,1,0.6)
p2 <- rbinom(1000,1,0.4)

prop.test(c(sum(p1),sum(p2)), c(1000,1000))
```

    ## 
    ##  2-sample test for equality of proportions with continuity correction
    ## 
    ## data:  c(sum(p1), sum(p2)) out of c(1000, 1000)
    ## X-squared = 93.314, df = 1, p-value < 2.2e-16
    ## alternative hypothesis: two.sided
    ## 95 percent confidence interval:
    ##  0.1732187 0.2607813
    ## sample estimates:
    ## prop 1 prop 2 
    ##  0.606  0.389

------------------------------------------------------------------------

# Difference Between Two Means

Cohen’s d quantifies standardized mean differences:

d = (xbar1 – xbar2) / s_pooled

### Visualization

``` r
plot.new()
text(0.5,0.5,
     expression(d == (bar(x)[1] - bar(x)[2]) / s[p]),
     cex=1.5)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-184-1.png)<!-- -->

### Example Plot

``` r
set.seed(2)
g1 <- rnorm(200,10,2)
g2 <- rnorm(200,12,2)
boxplot(list(G1=g1,G2=g2), col=c("skyblue","pink"),
        main="Two-Group Comparison")
```

![](stats0_md_files/figure-gfm/unnamed-chunk-185-1.png)<!-- -->

------------------------------------------------------------------------

# Proportion of Variance Explained

The proportion of variance explained by a predictor is commonly
expressed as:

r² = variance_explained / total_variance

In ANOVA:

η² = SS_between / SS_total

### Visualization

``` r
plot.new()
text(0.5,0.5,
     expression(eta^2 == SS[b] / SS[t]),
     cex=1.6)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-186-1.png)<!-- -->

### Example Regression Output

``` r
set.seed(3)
x <- rnorm(100)
y <- 0.5*x + rnorm(100)
summary(lm(y~x))$r.squared
```

    ## [1] 0.09297026

------------------------------------------------------------------------

# Statistical Literacy

Students should understand:

- Effect sizes complement p-values
- They allow meaningful comparison across studies
- Larger samples make significance easier, but do not enlarge effects
- Reporting effect size is essential for practical interpretation

------------------------------------------------------------------------

# Exercises

### **1. Why is effect size important?**

**Response:**  
Because it indicates the practical magnitude of an effect, not just
statistical significance.

------------------------------------------------------------------------

### **2. Display Cohen’s d formula using the required R method.**

``` r
plot.new()
text(0.5,0.5,
     expression(d == (bar(x)[1] - bar(x)[2]) / s[p]),
     cex=1.5)
```

![](stats0_md_files/figure-gfm/unnamed-chunk-188-1.png)<!-- -->

------------------------------------------------------------------------

### **3. Compute Cohen’s d for simulated data.**

``` r
set.seed(4)
a <- rnorm(50,10,2)
b <- rnorm(50,13,2)
sp <- sqrt(((49*var(a)) + (49*var(b))) / 98)
d <- (mean(a) - mean(b)) / sp
d
```

    ## [1] -1.347617

------------------------------------------------------------------------

### **4. What does r² represent?**

**Response:**  
It represents the proportion of the variance in the dependent variable
explained by the predictor.

------------------------------------------------------------------------

### **5. Plot group differences and calculate η² in ANOVA.**

``` r
set.seed(5)
g1 <- rnorm(40, 5, 1)
g2 <- rnorm(40, 6, 1)
g3 <- rnorm(40, 8, 1)

df <- data.frame(
  y=c(g1,g2,g3),
  g=factor(rep(1:3, each=40))
)

model <- aov(y~g, data=df)
ss_total <- sum((df$y - mean(df$y))^2)
ss_between <- sum(tapply(df$y, df$g, function(x) length(x)*(mean(x)-mean(df$y))^2))
eta2 <- ss_between / ss_total
eta2
```

    ## [1] 0.6236981
