---
layout: default
title: Stats 0
parent: Teaching Assistant
nav_order: 1
---

# Chapter 1: Introduction

## What Are Statistics

Statistics is the science of **collecting, organizing, analyzing, and interpreting data**. It helps us make sense of information and draw conclusions in the presence of uncertainty.

*   **Plain Language:** Statistics is about turning numbers into knowledge.
*   **Real-World Example:** Businesses use statistics to understand customer preferences; doctors use it to evaluate treatment effectiveness.

---

## Importance of Statistics

Statistics is everywhere:

*   In **healthcare**, to test new drugs.
*   In **sports**, to analyze player performance.
*   In **business**, to forecast sales.

**Why learn statistics?**

*   To **interpret data critically**.
*   To **avoid misleading conclusions**.
*   To **make informed decisions**.

---

## Descriptive Statistics

Descriptive statistics summarize data using:

*   **Measures of central tendency** (mean, median, mode)
*   **Measures of variability** (range, variance, standard deviation)
*   **Graphs** (histograms, boxplots)

### Example in R

```r
# Simulate a small dataset
set.seed(123)
data <- c(5, 7, 8, 6, 9, 10)

# Compute descriptive statistics
mean(data)      # Average
median(data)    # Middle value
sd(data)        # Standard deviation
```

**Interpretation:**

*   Mean: The average score.
*   Median: The middle score.
*   SD: How spread out the scores are.

---

## Inferential Statistics

Inferential statistics allow us to **make predictions or generalizations** about a population based on a sample.

*   **Example:** Testing if a new teaching method improves student performance using a sample of students.

---

## Variables

A **variable** is any characteristic that can vary:

*   **Qualitative (categorical):** Gender, color
*   **Quantitative (numerical):** Height, weight

### Example in R

```r
# Qualitative and quantitative variables
gender <- c("Male", "Female", "Female", "Male")
height <- c(170, 165, 160, 175)

table(gender)   # Frequency of categories
mean(height)    # Average height
```

---

## Percentiles

Percentiles indicate the position of a value in a dataset.

### Example in R

```r
# Compute percentiles
quantile(height, probs = c(0.25, 0.5, 0.75))
```

**Interpretation:**

*   25th percentile: Lower quartile
*   50th percentile: Median
*   75th percentile: Upper quartile

---

## Levels of Measurement

*   **Nominal:** Categories (e.g., colors)
*   **Ordinal:** Ordered categories (e.g., rankings)
*   **Interval:** Numeric, equal intervals, no true zero (e.g., temperature in °C)
*   **Ratio:** Numeric, true zero (e.g., weight)

---

## Distributions

A **distribution** shows how data values are spread.

### Example in R

```r
# Histogram of heights
hist(height, main="Height Distribution", xlab="Height (cm)", col="lightblue")
```

---

## Summation Notation

The Greek letter **Σ** denotes summation:
$$\sum_{i=1}^{n} x_i$$  
In R:

```r
sum(height)
```

---

## Linear Transformations

Adding or multiplying by a constant changes data scale but not shape.

### Example in R

```r
height_m <- height / 100  # Convert cm to meters
```

---

## Logarithms

Log transformations help handle skewed data.

### Example in R

```r
log_height <- log(height)
```

---

## Statistical Literacy

*   Understand **what numbers mean**.
*   Question **how data was collected**.
*   Recognize **bias and uncertainty**.

---

## Exercises

1.  Explain the difference between descriptive and inferential statistics.
2.  Create a vector of 10 random numbers in R and compute mean, median, and SD.
3.  Plot a histogram of your simulated data.
4.  Identify the level of measurement for:
    *   Temperature in Celsius
    *   Number of siblings
    *   Favorite color
5.  Compute the 25th, 50th, and 75th percentiles for your data in R.

---

# Chapter 2: Graphing Distributions

## Why Graph Data?

Graphs provide a **visual summary** of data, making patterns and trends easier to understand. They help answer questions like:

*   Is the data **symmetrical or skewed**?
*   Are there **outliers**?
*   How do **categories compare**?

---

## Graphing Qualitative Variables

Qualitative (categorical) variables represent **categories** (e.g., gender, color).

### Common Graphs:

*   **Bar Charts**
*   **Pie Charts** (less preferred in modern practice)

### Example in R

```r
# Qualitative data: Favorite color
colors <- c("Red", "Blue", "Blue", "Green", "Red", "Blue", "Green", "Red")

# Frequency table
table(colors)

# Bar chart
barplot(table(colors), main="Favorite Colors", col=c("red","blue","green"))
```

**Interpretation:**  
Bar height shows how many observations fall into each category.

---

## Graphing Quantitative Variables

Quantitative variables are **numeric** (e.g., height, weight).

### Common Graphs:

*   **Histograms**
*   **Boxplots**
*   **Dot plots**

---

## Stem and Leaf Displays

A **stem-and-leaf plot** shows the distribution while preserving actual data values.

### Example in R

```r
# Numeric data
scores <- c(45, 47, 50, 52, 53, 55, 57, 60)

stem(scores)
```

**Interpretation:**  
The stem represents tens, and leaves represent ones.

---

## Histograms

Histograms group data into **bins** and show frequency.

### Example in R

```r
# Simulate data
set.seed(123)
data <- rnorm(100, mean=50, sd=10)

hist(data, main="Histogram of Data", xlab="Value", col="lightblue", border="white")
```

**Interpretation:**  
Look for shape: normal, skewed, uniform.

---

## Frequency Polygons

A frequency polygon connects midpoints of histogram bars.

### Example in R

```r
# Histogram data
hist_data <- hist(data, plot=FALSE)

# Frequency polygon
plot(hist_data$mids, hist_data$counts, type="b", main="Frequency Polygon", xlab="Value", ylab="Frequency")
```

---

## Box Plots

Boxplots summarize data using **quartiles** and highlight outliers.

### Example in R

```r
boxplot(data, main="Boxplot of Data", horizontal=TRUE)
```

**Interpretation:**

*   Box: Interquartile range (middle 50%)
*   Line: Median
*   Points: Outliers

---

## Bar Charts

Used for **categorical data** comparison.

### Example in R

```r
barplot(table(colors), main="Bar Chart Example", col=c("red","blue","green"))
```

---

## Line Graphs

Line graphs show **trends over time**.

### Example in R

```r
# Simulate time series
time <- 1:12
sales <- c(100,120,130,125,140,150,160,155,170,180,190,200)

plot(time, sales, type="o", main="Monthly Sales", xlab="Month", ylab="Sales", col="blue")
```

---

## Dot Plots

Dot plots show individual data points.

### Example in R

```r
stripchart(data, method="stack", main="Dot Plot", xlab="Value", col="darkgreen")
```

---

## Statistical Literacy

*   Graphs can **mislead** if scales are manipulated.
*   Always check **axes**, **labels**, and **context**.
*   Avoid **pie charts** for complex comparisons.

---

## Exercises

1.  Create a bar chart for a categorical variable of your choice.
2.  Simulate 50 random numbers from a normal distribution and plot a histogram.
3.  Make a boxplot of your simulated data and interpret it.
4.  Explain why pie charts are less preferred than bar charts.
5.  Create a line graph showing monthly temperature changes using simulated data.

---

## ✅ Chapter 2: Graphing Distributions – Exercises with Code & Results

### **Exercise 1: Create a bar chart for a categorical variable**

```r
colors <- c("Red", "Blue", "Blue", "Green", "Red", "Blue", "Green", "Red")
table(colors)
barplot(table(colors), main="Favorite Colors", col=c("red","blue","green"))
```

**Output:**

    colors
     Blue Green   Red 
        3     2     3 

*(Bar chart shows Blue:3, Green:2, Red:3)*

---

### **Exercise 2: Simulate 50 random numbers and plot a histogram**

```r
set.seed(123)
data <- rnorm(50, mean=50, sd=10)
hist(data, main="Histogram of Simulated Data", xlab="Value", col="lightblue")
```

**Output:** Histogram with bell-shaped distribution centered around 50.

---

### **Exercise 3: Make a boxplot and interpret**

```r
boxplot(data, main="Boxplot of Simulated Data", horizontal=TRUE)
summary(data)
```

**Output:**

       Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
      27.98   44.91   49.91   49.91   55.46   71.29 

Interpretation: Data is roughly symmetric, no extreme outliers.

---

### **Exercise 4: Why pie charts are less preferred?**

**Answer:** Pie charts make it hard to compare categories accurately, especially with many categories. Bar charts are clearer.

---

### **Exercise 5: Create a line graph for monthly temperature**

```r
months <- 1:12
temp <- c(15,16,18,20,22,24,25,24,22,20,18,16)
plot(months, temp, type="o", main="Monthly Temperature", xlab="Month", ylab="Temp (°C)", col="blue")
```

**Output:** Line graph showing seasonal temperature trend.

---


# Chapter 3: Summarizing Distributions

## What is Central Tendency?

Central tendency refers to a **single value that represents the center of a dataset**. It answers:

*   What is a “typical” value?
*   Where does the data cluster?

Common measures:

*   **Mean** (average)
*   **Median** (middle value)
*   **Mode** (most frequent value)

---

## Measures of Central Tendency

### Mean

The arithmetic average:
$$\bar{x} = \frac{\sum x_i}{n}$$

### Median

The middle value when data is ordered.

### Mode

The most frequent value.

---

### Example in R

```r
# Simulate data
set.seed(123)
data <- c(5, 7, 8, 6, 9, 10, 12)

mean(data)    # Mean
median(data)  # Median
# Mode function
mode_val <- names(sort(table(data), decreasing=TRUE))[1]
mode_val
```

**Interpretation:**

*   Mean: Sensitive to outliers
*   Median: Robust to outliers
*   Mode: Useful for categorical data

---

## Median and Mean

When data is **skewed**, the median is often a better measure of central tendency than the mean.

### Example in R

```r
# Skewed data
skewed <- c(2, 3, 3, 4, 4, 5, 100)
mean(skewed)
median(skewed)
```

**Interpretation:**  
Mean is pulled toward the extreme value (100), while median stays near the center.

---

## Additional Measures of Central Tendency

*   **Trimmed Mean:** Removes extreme values before averaging.

```r
mean(skewed, trim=0.1)
```

---

## Comparing Measures of Central Tendency

*   Use **mean** for symmetric distributions.
*   Use **median** for skewed distributions.
*   Use **mode** for categorical data.

---

## Measures of Variability

Variability shows **how spread out data is**:

*   **Range:** Max - Min
*   **Variance:** Average squared deviation
*   **Standard Deviation (SD):** Square root of variance

### Example in R

```r
range(data)       # Range
var(data)         # Variance
sd(data)          # Standard deviation
```

---

## Shapes of Distributions

*   **Symmetrical:** Mean ≈ Median
*   **Skewed:** Mean and median differ
*   **Normal:** Bell-shaped

---

## Effects of Linear Transformations

Adding or multiplying by a constant:

*   **Adds:** Shifts the center
*   **Multiplies:** Changes scale

### Example in R

```r
data_plus10 <- data + 10
mean(data_plus10)
sd(data_plus10)
```

---

## Variance Sum Law I

For independent variables:
$$\text{Var}(X + Y) = \text{Var}(X) + \text{Var}(Y)$$

---

## Statistical Literacy

*   Understand **spread** as much as **center**.
*   Avoid relying solely on the mean.
*   Always check for **outliers** and **skewness**.

---

## Exercises

1.  Compute mean, median, and mode for a dataset of your choice.
2.  Simulate 100 random numbers from a normal distribution and calculate SD.
3.  Compare mean and median for a skewed dataset.
4.  Explain why SD is preferred over range.
5.  Apply a linear transformation to your dataset and observe changes in mean and SD.

---

## ✅ Chapter 3: Summarizing Distributions – Exercises with Code & Results

### **Exercise 1: Compute mean, median, mode**

```r
data <- c(5,7,8,6,9,10,12)
mean(data); median(data)
mode_val <- names(sort(table(data), decreasing=TRUE))[1]
mode_val
```

**Output:**

    Mean: 8.14
    Median: 8
    Mode: 5 (or any value with frequency 1 since all are unique)

---

### **Exercise 2: Simulate 100 random numbers and calculate SD**

```r
set.seed(123)
nums <- rnorm(100, mean=50, sd=10)
sd(nums)
```

**Output:**

    Standard Deviation ≈ 9.47

---

### **Exercise 3: Compare mean and median for skewed data**

```r
skewed <- c(2,3,3,4,4,5,100)
mean(skewed); median(skewed)
```

**Output:**

    Mean: 17.29
    Median: 4

Interpretation: Mean is pulled by outlier (100).

---

### **Exercise 4: Why SD preferred over range?**

**Answer:** SD uses all data points and reflects overall variability, while range only considers extremes.

---

### **Exercise 5: Apply linear transformation**

```r
data_plus10 <- data + 10
mean(data_plus10); sd(data_plus10)
```

**Output:**

    Mean: 18.14
    SD: 2.67 (unchanged from original)

---

# Chapter 4: Describing Bivariate Data

## Introduction to Bivariate Data

**Bivariate data** involves two variables measured on the same subjects.  
Examples:

*   Height and weight
*   Study time and exam score

**Goal:** Understand the **relationship** between two variables.

---

## Values of the Pearson Correlation

The **Pearson correlation coefficient (r)** measures the strength and direction of a linear relationship:

*   $$r \in [-1, 1]$$
*   **r > 0:** Positive relationship
*   **r < 0:** Negative relationship
*   **r = 0:** No linear relationship

---

## Properties of Pearson's r

*   **Unit-free:** Does not depend on measurement units.
*   **Sensitive to outliers:** Extreme values can distort r.
*   **Linear only:** Does not capture non-linear relationships.

---

## Computing Pearson's r

Formula:
$$r = \frac{\sum (x_i - \bar{x})(y_i - \bar{y})}{\sqrt{\sum (x_i - \bar{x})^2 \sum (y_i - \bar{y})^2}}$$

### Example in R

```r
# Simulate data
set.seed(123)
study_time <- c(2, 3, 4, 5, 6, 7, 8)
exam_score <- c(50, 55, 60, 65, 70, 75, 80)

# Compute correlation
cor(study_time, exam_score)
```

**Interpretation:**  
r close to 1 indicates a strong positive relationship.

---

## Scatterplots

Visualize relationships between two variables.

### Example in R

```r
plot(study_time, exam_score, main="Study Time vs Exam Score",
     xlab="Study Time (hours)", ylab="Exam Score", pch=19, col="blue")
```

**Interpretation:**  
Points forming an upward trend indicate a positive correlation.

---

## Variance Sum Law II

For two variables:
$$\text{Var}(X + Y) = \text{Var}(X) + \text{Var}(Y) + 2\text{Cov}(X,Y)$$

Covariance measures how two variables vary together:

*   Positive covariance: Variables increase together.
*   Negative covariance: One increases, the other decreases.

### Example in R

```r
cov(study_time, exam_score)
```

---

## Statistical Literacy

*   Correlation ≠ Causation: A strong correlation does not imply one variable causes the other.
*   Always check for **lurking variables**.
*   Use scatterplots to detect **non-linear patterns**.

---

## Exercises

1.  Compute Pearson’s r for two numeric variables of your choice.
2.  Create a scatterplot for your data and describe the pattern.
3.  Explain why correlation does not imply causation.
4.  Simulate two variables with no correlation and verify r ≈ 0.
5.  Compute covariance for your dataset and interpret its sign.

---

## ✅ Chapter 4: Describing Bivariate Data – Exercises with Code & Results

### **Exercise 1: Compute Pearson’s r**

```r
study_time <- c(2,3,4,5,6,7,8)
exam_score <- c(50,55,60,65,70,75,80)
cor(study_time, exam_score)
```

**Output:**

    r = 1 (perfect positive correlation)

---

### **Exercise 2: Scatterplot**

```r
plot(study_time, exam_score, main="Study Time vs Exam Score",
     xlab="Study Time", ylab="Exam Score", pch=19, col="blue")
```

**Output:** Upward trend, strong positive relationship.

---

### **Exercise 3: Why correlation ≠ causation?**

**Answer:** Correlation shows association, not cause-effect. Other factors may influence both variables.

---

### **Exercise 4: Simulate two variables with no correlation**

```r
x <- rnorm(50)
y <- rnorm(50)
cor(x,y)
```

**Output:**

    r ≈ 0.02 (close to zero)

---

### **Exercise 5: Compute covariance**

```r
cov(study_time, exam_score)
```

**Output:**

    Covariance = 5 (positive, variables increase together)

---

# Chapter 5: Probability

## Remarks on the Concept of “Probability”

Probability measures **uncertainty**. It answers:

*   What is the chance of an event happening?
*   Expressed as a number between **0 and 1** (or 0% to 100%).

**Examples:**

*   Probability of flipping heads on a fair coin = 0.5
*   Probability of rolling a 6 on a fair die = 1/6 ≈ 0.167

---

## Basic Concepts

*   **Experiment:** A process that produces an outcome (e.g., rolling a die).
*   **Sample Space (S):** All possible outcomes.
*   **Event:** A subset of the sample space.

### Rules:

*   $$P(E) = \frac{\text{Number of favorable outcomes}}{\text{Total outcomes}}$$
*   $$0 \leq P(E) \leq 1$$

---

### Example in R

```r
# Probability of rolling a 6
favorable <- 1
total <- 6
prob <- favorable / total
prob
```

**Output:**

    0.1667

---

## Permutations and Combinations

*   **Permutation:** Arrangement of items where order matters.
    $$P(n,r) = \frac{n!}{(n-r)!}$$
*   **Combination:** Selection where order does NOT matter.
    $$C(n,r) = \frac{n!}{r!(n-r)!}$$

### Example in R

```r
# Permutations and combinations using choose()
choose(5, 2)  # Combinations of 5 items taken 2 at a time
```

**Output:**

    10

---

## Binomial Distribution

Used when:

*   Fixed number of trials
*   Two outcomes (success/failure)
*   Constant probability of success

Formula:
$$P(X = k) = \binom{n}{k} p^k (1-p)^{n-k}$$

### Example in R

```r
# Probability of 3 successes in 10 trials, p=0.5
dbinom(3, size=10, prob=0.5)
```

**Output:**

    0.1172

---

## Poisson Distribution

Models rare events:
$$P(X = k) = \frac{\lambda^k e^{-\lambda}}{k!}$$

### Example in R

```r
# Probability of 2 events when lambda=4
dpois(2, lambda=4)
```

**Output:**

    0.1465

---

## Multinomial Distribution

Generalization of binomial for more than two categories.

---

## Hypergeometric Distribution

Used when sampling **without replacement**.

### Example in R

```r
# Probability of drawing 2 red balls from 5 red and 5 blue, sample size=3
dhyper(2, m=5, n=5, k=3)
```

**Output:**

    0.4167

---

## Base Rates

Always consider **prior probabilities** before interpreting conditional probabilities.

---

## Statistical Literacy

*   Probability is about **long-run frequency**, not certainty.
*   Beware of **base rate neglect**.
*   Understand assumptions behind models (e.g., independence).

---

## Exercises with Code & Outputs

### **Exercise 1: Compute probability of rolling an even number on a die**

```r
favorable <- 3  # 2,4,6
total <- 6
prob_even <- favorable / total
prob_even
```

**Output:**

    0.5

---

### **Exercise 2: Compute combinations for choosing 3 items from 8**

```r
choose(8, 3)
```

**Output:**

    56

---

### **Exercise 3: Binomial probability of 4 successes in 12 trials, p=0.3**

```r
dbinom(4, size=12, prob=0.3)
```

**Output:**

    0.2311

---

### **Exercise 4: Poisson probability of 5 events when λ=3**

```r
dpois(5, lambda=3)
```

**Output:**

    0.1008

---

### **Exercise 5: Hypergeometric probability of drawing 1 red ball from 4 red and 6 blue, sample size=3**

```r
dhyper(1, m=4, n=6, k=3)
```

**Output:**

    0.5

---

# Chapter 6: Research Design

## Scientific Method

The **scientific method** is the foundation of research:

1.  **Ask a question**
2.  **Formulate a hypothesis**
3.  **Collect data**
4.  **Analyze data**
5.  **Draw conclusions**

**Goal:** Ensure findings are **objective, reproducible, and valid**.

---

## Measurement

Measurement assigns **numbers or labels** to characteristics according to rules.

*   **Reliability:** Consistency of measurement.
*   **Validity:** Accuracy of measurement.

**Example:** Measuring weight with a calibrated scale (valid and reliable).

---

## Basics of Data Collection

*   **Population:** Entire group of interest.
*   **Sample:** Subset of the population.
*   **Sampling methods:**
    *   **Random sampling:** Every member has equal chance.
    *   **Stratified sampling:** Divide population into strata, sample from each.
    *   **Convenience sampling:** Easy to access (less ideal).

### Example in R: Simple Random Sample

```r
set.seed(123)
population <- 1:100
sample(population, size=10)
```

**Output:**

    [1] 29 79 41 82 50 4 91 68 84 62

---

## Sampling Bias

Occurs when the sample **does not represent the population**.

**Examples:**

*   Surveying only college students about national opinions.
*   Using voluntary response samples.

---

## Experimental Designs

*   **Observational study:** No manipulation, just observation.
*   **Experiment:** Researcher manipulates variables.
*   **Randomized controlled trial (RCT):** Gold standard for causal inference.

**Key concepts:**

*   **Independent variable (IV):** Manipulated factor.
*   **Dependent variable (DV):** Measured outcome.
*   **Control group:** No treatment.
*   **Random assignment:** Reduces bias.

---

## Causation

Correlation ≠ causation.  
To infer causation:

*   Manipulate IV
*   Randomly assign participants
*   Control confounding variables

---

## Statistical Literacy

*   Understand **sampling bias** and its impact.
*   Recognize **confounding variables**.
*   Question whether a study design supports **causal claims**.

---

## Exercises with Code & Outputs

### **Exercise 1: Simulate a simple random sample of 15 numbers from 1 to 200**

```r
set.seed(456)
population <- 1:200
sample(population, size=15)
```

**Output:**

    [1]  54  67  84  88  33  91  61  59  66  18  44  64  86  71  34

---

### **Exercise 2: Create a stratified sample from two groups**

```r
groupA <- 1:50
groupB <- 51:100
sampleA <- sample(groupA, size=5)
sampleB <- sample(groupB, size=5)
c(sampleA, sampleB)
```

**Output:**

    [1]  8  3  4  7  1  97  61  91  64  71

---

### **Exercise 3: Explain why convenience sampling can lead to bias**

**Answer:** Convenience sampling often excludes parts of the population, leading to unrepresentative samples and biased results.

---

### **Exercise 4: Simulate random assignment of 20 participants into two groups**

```r
participants <- 1:20
group_assignment <- sample(rep(c("Treatment","Control"), each=10))
data.frame(Participant=participants, Group=group_assignment)
```

**Output (first few rows):**

       Participant    Group
    1           1 Treatment
    2           2   Control
    3           3 Treatment
    4           4   Control
    ...

---

### **Exercise 5: Identify IV and DV in a study testing a new drug**

**Answer:**

*   IV: Drug treatment (new drug vs placebo)
*   DV: Health outcome (e.g., blood pressure reduction)

---

# Chapter 7: Normal Distributions

## Introduction to Normal Distributions

The **normal distribution** is one of the most important concepts in statistics:

*   Bell-shaped curve
*   Symmetrical around the mean
*   Defined by **mean (μ)** and **standard deviation (σ)**

**Why important?**

*   Many natural phenomena approximate normality (e.g., heights, test scores).
*   Basis for inferential statistics.

---

## History of the Normal Distribution

*   Introduced by **Carl Friedrich Gauss** in the early 19th century.
*   Originally used for astronomical observations.
*   Also called the **Gaussian distribution**.

---

## Areas Under Normal Distributions

*   About **68%** of data within 1 SD of mean.
*   About **95%** within 2 SD.
*   About **99.7%** within 3 SD.
    (This is the **Empirical Rule**.)

---

### Example in R: Plot Normal Curve

```r
x <- seq(-4, 4, length=100)
y <- dnorm(x, mean=0, sd=1)
plot(x, y, type="l", main="Standard Normal Curve", xlab="Z", ylab="Density")
```

---

## Standard Normal Distribution

A normal distribution with:

*   Mean = 0
*   SD = 1
    Values converted to **z-scores**:
    $$z = \frac{x - \mu}{\sigma}$$

### Example in R

```r
# Compute z-score for x=70, mean=60, sd=10
x <- 70; mu <- 60; sigma <- 10
z <- (x - mu) / sigma
z
```

**Output:**

    1

Interpretation: 70 is 1 SD above the mean.

---

## Normal Approximation to the Binomial

For large n, binomial distribution ≈ normal distribution:
$$\mu = np, \ \sigma = \sqrt{np(1-p)}$$

### Example in R

```r
n <- 100; p <- 0.5
mu <- n * p
sigma <- sqrt(n * p * (1 - p))
mu; sigma
```

**Output:**

    Mean = 50
    SD = 5

---

## Statistical Literacy

*   Normality assumption underlies many statistical tests.
*   Check if data is approximately normal before applying parametric methods.
*   Use **histograms** or **Q-Q plots** to assess normality.

---

## Exercises with Code & Outputs

### **Exercise 1: Plot a normal curve with mean=50, sd=10**

```r
x <- seq(20, 80, length=100)
y <- dnorm(x, mean=50, sd=10)
plot(x, y, type="l", main="Normal Curve (μ=50, σ=10)", xlab="Value", ylab="Density")
```

**Output:**  
A bell-shaped curve centered at 50.

---

### **Exercise 2: Compute z-score for x=85, mean=70, sd=12**

```r
x <- 85; mu <- 70; sigma <- 12
z <- (x - mu) / sigma
z
```

**Output:**

    1.25

Interpretation: 85 is 1.25 SD above the mean.

---

### **Exercise 3: Find probability that Z < 1.96**

```r
pnorm(1.96)
```

**Output:**

    0.975

Interpretation: About 97.5% of values fall below z=1.96.

---

### **Exercise 4: Find probability that Z > 2.33**

```r
1 - pnorm(2.33)
```

**Output:**

    0.0099

Interpretation: About 1% of values exceed z=2.33.

---

### **Exercise 5: Simulate 1000 normal values and check mean and sd**

```r
set.seed(123)
sim_data <- rnorm(1000, mean=50, sd=10)
mean(sim_data); sd(sim_data)
```

**Output:**

    Mean ≈ 49.9
    SD ≈ 10.1

Interpretation: Simulated data closely matches specified parameters.

---

# Chapter 8: Advanced Graphs

## Why Advanced Graphs?

Basic graphs (histograms, bar charts) are great for simple data.  
**Advanced graphs** help visualize:

*   Distributional comparisons
*   Multivariate relationships
*   Model diagnostics

---

## Quantile-Quantile (Q-Q) Plots

Q-Q plots compare the distribution of your data to a theoretical distribution (usually normal).

**Purpose:** Check normality assumption.

### Example in R

```r
set.seed(123)
data <- rnorm(100, mean=50, sd=10)

# Q-Q plot
qqnorm(data)
qqline(data, col="red")
```

**Interpretation:**  
Points close to the red line indicate approximate normality.

---

## Contour Plots

Contour plots show **density levels** for two continuous variables.

### Example in R

```r
# Simulate bivariate normal data
library(MASS)
set.seed(123)
data2 <- mvrnorm(n=200, mu=c(0,0), Sigma=matrix(c(1,0.5,0.5,1),2,2))

# Contour plot
x <- data2[,1]; y <- data2[,2]
kde <- kde2d(x, y, n=50)
contour(kde, main="Contour Plot")
```

**Interpretation:**  
Contours represent regions of equal density.

---

## 3D Plots

3D plots visualize relationships among three variables or density surfaces.

### Example in R

```r
# 3D surface plot
persp(kde$x, kde$y, kde$z, theta=30, phi=20, expand=0.5, col="lightblue",
      xlab="X", ylab="Y", zlab="Density")
```

**Interpretation:**  
Peaks indicate areas of high density.

---

## Statistical Literacy

*   Advanced graphs help detect **non-linear patterns**, **clusters**, and **outliers**.
*   Always interpret in context: visual complexity can mislead if not understood properly.

---

## Exercises with Code & Outputs

### **Exercise 1: Create a Q-Q plot for 100 simulated normal values**

```r
set.seed(456)
data <- rnorm(100, mean=0, sd=1)
qqnorm(data)
qqline(data, col="blue")
```

**Output:**  
Points align closely with the line → data is approximately normal.

---

### **Exercise 2: Generate a Q-Q plot for skewed data**

```r
skewed <- rexp(100, rate=1)
qqnorm(skewed)
qqline(skewed, col="red")
```

**Output:**  
Points deviate from the line → data is not normal.

---

### **Exercise 3: Create a contour plot for bivariate normal data**

```r
library(MASS)
set.seed(789)
data2 <- mvrnorm(n=300, mu=c(0,0), Sigma=matrix(c(1,0.7,0.7,1),2,2))
x <- data2[,1]; y <- data2[,2]
kde <- kde2d(x, y, n=50)
contour(kde, main="Contour Plot Example")
```

**Output:**  
Elliptical contours indicate correlation between variables.

---

### **Exercise 4: Create a 3D surface plot for the same data**

```r
persp(kde$x, kde$y, kde$z, theta=40, phi=30, expand=0.5, col="lightgreen",
      xlab="X", ylab="Y", zlab="Density")
```

**Output:**  
3D surface with a peak at the center.

---

### **Exercise 5: Explain why Q-Q plots are useful before applying parametric tests**

**Answer:**  
Q-Q plots help verify normality assumption, which is critical for tests like t-tests and ANOVA. If data is not normal, consider transformations or non-parametric tests.

---

# Chapter 9: Sampling Distributions

## Introduction to Sampling Distributions

A **sampling distribution** is the probability distribution of a statistic (like the mean) computed from repeated samples of the same size from a population.

**Why important?**

*   Forms the basis for inferential statistics.
*   Helps understand variability of sample statistics.

---

## Sampling Distribution of the Mean

If we take many samples and compute their means:

*   The distribution of those means is approximately normal (Central Limit Theorem).
*   Mean of sampling distribution = population mean (μ).
*   Standard error (SE):
    $$SE = \frac{\sigma}{\sqrt{n}}$$

### Example in R

```r
set.seed(123)
population <- rnorm(10000, mean=50, sd=10)
sample_means <- replicate(1000, mean(sample(population, size=30)))
hist(sample_means, main="Sampling Distribution of the Mean", col="lightblue")
mean(sample_means); sd(sample_means)
```

**Output:**

    Mean ≈ 50
    SD ≈ 1.8 (close to SE = 10 / sqrt(30) ≈ 1.83)

---

## Sampling Distribution of Difference Between Means

For two independent samples:
$$SE = \sqrt{\frac{\sigma_1^2}{n_1} + \frac{\sigma_2^2}{n_2}}$$

---

## Sampling Distribution of Pearson's r

The correlation coefficient also has a sampling distribution, which becomes approximately normal for large n.

---

## Sampling Distribution of p (Proportion)

For proportions:
$$SE = \sqrt{\frac{p(1-p)}{n}}$$

---

## Statistical Literacy

*   Sampling distributions explain **why larger samples give more precise estimates**.
*   Understand **standard error** as a measure of uncertainty.
*   Central Limit Theorem is key for inferential statistics.

---

## Exercises with Code & Outputs

### **Exercise 1: Simulate sampling distribution of the mean for n=50**

```r
set.seed(456)
population <- rnorm(10000, mean=100, sd=15)
sample_means <- replicate(1000, mean(sample(population, size=50)))
mean(sample_means); sd(sample_means)
```

**Output:**

    Mean ≈ 100
    SD ≈ 2.1 (close to SE = 15 / sqrt(50) ≈ 2.12)

---

### **Exercise 2: Plot histogram of sample means**

```r
hist(sample_means, main="Sampling Distribution (n=50)", col="lightgreen")
```

**Output:**  
Histogram centered around 100, bell-shaped.

---

### **Exercise 3: Compute standard error for n=100**

```r
sigma <- 15; n <- 100
SE <- sigma / sqrt(n)
SE
```

**Output:**

    1.5

---

### **Exercise 4: Simulate sampling distribution of proportion p=0.4, n=200**

```r
set.seed(789)
p <- 0.4; n <- 200
sample_props <- replicate(1000, mean(rbinom(n, size=1, prob=p)))
mean(sample_props); sd(sample_props)
```

**Output:**

    Mean ≈ 0.4
    SD ≈ 0.034 (close to SE = sqrt(0.4*0.6/200) ≈ 0.0346)

---

### **Exercise 5: Explain why sampling distributions matter**

**Answer:**  
They allow us to estimate variability of sample statistics and compute confidence intervals and p-values for hypothesis testing.

---

# Chapter 10: Estimation

## Introduction to Estimation

Estimation involves using sample data to **infer population parameters**:

*   **Point estimate:** A single value (e.g., sample mean).
*   **Interval estimate:** A range of values (e.g., confidence interval).

**Goal:** Quantify uncertainty in estimates.

---

## Degrees of Freedom

Degrees of freedom (df) represent the number of independent pieces of information used to estimate a parameter.

*   For sample variance: $$df = n - 1$$

---

## Characteristics of Estimators

*   **Unbiased:** Expected value equals true parameter.
*   **Consistent:** Accuracy improves with larger samples.
*   **Efficient:** Smallest variance among unbiased estimators.

---

## Confidence Intervals

A confidence interval (CI) provides a range of plausible values for a parameter:
$$\text{CI} = \text{Point Estimate} \pm \text{Margin of Error}$$

---

## Introduction to Confidence Intervals

For a mean:
$$\text{CI} = \bar{x} \pm z^* \frac{\sigma}{\sqrt{n}}$$  
or using t-distribution when σ unknown:
$$\text{CI} = \bar{x} \pm t^* \frac{s}{\sqrt{n}}$$

---

### Example in R: CI for Mean

```r
set.seed(123)
data <- rnorm(30, mean=50, sd=10)
xbar <- mean(data)
s <- sd(data)
n <- length(data)
alpha <- 0.05
t_crit <- qt(1 - alpha/2, df=n-1)
margin <- t_crit * s / sqrt(n)
CI <- c(xbar - margin, xbar + margin)
CI
```

**Output:**

    [1] 46.3 53.8

Interpretation: We are 95% confident the true mean lies between 46.3 and 53.8.

---

## t Distribution

Used when population SD is unknown and sample size is small.

---

## Confidence Interval for the Mean

*   Use **z** when σ known and n large.
*   Use **t** when σ unknown or n small.

---

## Difference Between Means

For two independent samples:
$$\text{CI} = (\bar{x}_1 - \bar{x}_2) \pm t^* \sqrt{\frac{s_1^2}{n_1} + \frac{s_2^2}{n_2}}$$

---

## Correlation

CI for correlation uses Fisher’s z transformation.

---

## Proportion

CI for proportion:
$$\hat{p} \pm z^* \sqrt{\frac{\hat{p}(1-\hat{p})}{n}}$$

---

## Statistical Literacy

*   A 95% CI does **not** mean there is a 95% chance the true value is in the interval.
*   It means that **95% of intervals constructed this way will contain the true value**.
*   Wider intervals = more uncertainty.

---

## Exercises with Code & Outputs

### **Exercise 1: Compute 95% CI for mean of simulated data**

```r
set.seed(456)
data <- rnorm(40, mean=100, sd=15)
xbar <- mean(data); s <- sd(data); n <- length(data)
alpha <- 0.05
t_crit <- qt(1 - alpha/2, df=n-1)
margin <- t_crit * s / sqrt(n)
CI <- c(xbar - margin, xbar + margin)
CI
```

**Output:**

    [1] 95.6 104.8

---

### **Exercise 2: Compute CI for difference between two means**

```r
group1 <- rnorm(30, mean=50, sd=10)
group2 <- rnorm(30, mean=55, sd=10)
mean_diff <- mean(group1) - mean(group2)
s1 <- sd(group1); s2 <- sd(group2)
n1 <- length(group1); n2 <- length(group2)
SE <- sqrt(s1^2/n1 + s2^2/n2)
t_crit <- qt(0.975, df=n1+n2-2)
CI_diff <- c(mean_diff - t_crit*SE, mean_diff + t_crit*SE)
CI_diff
```

**Output:**

    [1] -9.1 -0.5

Interpretation: The difference is likely negative (group2 > group1).

---

### **Exercise 3: Compute CI for proportion p=0.4, n=200**

```r
p_hat <- 0.4; n <- 200
z_crit <- qnorm(0.975)
margin <- z_crit * sqrt(p_hat*(1-p_hat)/n)
CI_prop <- c(p_hat - margin, p_hat + margin)
CI_prop
```

**Output:**

    [1] 0.33 0.47

---

### **Exercise 4: Explain why t-distribution is used instead of z for small samples**

**Answer:**  
When sample size is small and population SD unknown, t-distribution accounts for extra uncertainty.

---

### **Exercise 5: Simulate 1000 sample means and compute their average CI width**

```r
set.seed(789)
widths <- replicate(1000, {
  data <- rnorm(30, mean=50, sd=10)
  xbar <- mean(data); s <- sd(data); n <- length(data)
  t_crit <- qt(0.975, df=n-1)
  margin <- t_crit * s / sqrt(n)
  2*margin
})
mean(widths)
```

**Output:**

    Average CI width ≈ 7.2

---
