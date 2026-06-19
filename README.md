# Statistical Investigation: Reflective Learning & Academic Performance

A full statistical study conducted in R, investigating whether reflective learning behaviours relate to deeper academic understanding. Group project (team of 4).

## The Question

The study tested the statement: *"Students who reflect on their learning demonstrate deeper understanding."*

Since reflection can't be measured directly from a dataset, we identified five behavioural proxies for reflective learning - study hours, attendance, discussion participation, motivation, and assignment completion - and tested whether they relate to academic understanding, measured through exam score and final grade.

## Approach

Working with a student performance dataset of 14,000+ records (cleaned to 7,813 usable entries), the analysis ran in three stages:

- **Descriptive analysis**: distributions visualised with histograms, bar charts, box plots, and a correlation matrix
- **Inferential analysis**: Pearson and Spearman correlations, a T-Test, and One-Way ANOVA with Tukey HSD
- **Predictive analysis**: Linear Regression and Logistic Regression to test predictive power

## Key Findings

- 4 of 5 reflection proxies showed no significant relationship with understanding
- Only discussion participation was statistically significant, but with a negligible effect size (r = -0.027)
- Regression models confirmed the proxies carried very little predictive power
- The null hypothesis could not be fully rejected - only limited, partial support for the statement

The main takeaway: **statistical significance is not the same as practical significance** - a result can be mathematically real yet practically meaningless, especially with large samples. And measuring the *right* variables matters more than the method: the proxies captured what students *do*, not how deeply they *think*.

## My Role

I led the **inferential and predictive analysis** - implementing the correlation tests, T-Test, One-Way ANOVA with Tukey HSD, and the linear and logistic regression models in R, and interpreting the results. I also reviewed and corrected the team's R code across the data cleaning and descriptive stages to ensure correctness, and authored the **final report** and **presentation** for the study.

## Tech Stack

- **Language:** R
- **Methods:** Descriptive statistics, correlation analysis, hypothesis testing (T-Test, ANOVA), regression (linear & logistic)

## References

The findings aligned with existing research (Lew & Schmidt, 2011; Dahlgren, 2020) showing that reflection's impact on measurable outcomes is subtle.
