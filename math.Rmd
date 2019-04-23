# Math

Want to include equations in your writing? Easy. rmarkdown supports
LaTeX style equation writing. This section introduces the two types equations, inline, and display form, and how to number equations.

## Overview

* **Teaching**: 10 minutes
* **Exercises**: 10 minutes

## Questions

- How to I create an equation?
- LaTeX is funky, what are the basic math commands?

## Objectives

## Some history {.history}

Equation editing was first made available in TeX, which later become LaTeX, named after Leslie Lamport.

## Anatomy of Equations

This section shows you some basic equations types that you want to be familiar with.

Inline equations are referenced by a pair of dollar signs: `$`.

```
So this text would have an equation here $ E = mc^2$
```

Generates:

So this text would have an equation here $ E = mc^2$

Display equations are referenced by two pairs of dollar signs:

```
$$
E = mc^2
$$
```

$$
E = mc^2
$$

#### Viewing equations

Understanding whether or not you have created the right equation can be difficult. Rstudio provides previews of your equations in text (**demo**).

## Example math commands

LaTeX is an amazing language, but understanding how to create the equations can be (more than) a bit confusing at times. This section demonstrates some example equations that you might be familiar with.


#### Fractions

$$
\frac{1}{2}
$$

#### Sub and Super Scripts

$$
Y = X_1 + X_2
$$

$$
a^2 + b^2 = c^
$$

#### Square roots

$$
\sqrt{p}
$$
$$
x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
$$

#### Summations

$$
\sum_{i = 1}^{n}{(\bar{x} - x_i)^2}
$$
#### Bayes Rule

$$
Pr(\theta | y) = \frac{Pr(y | \theta) Pr(\theta)}{Pr(y)}
$$

$$
Pr(\theta | y) \propto Pr(y | \theta) Pr(\theta)
$$

#### Linear Model

$$
Y \sim X\beta_0 + X\beta_1 + \epsilon
$$

$$
\epsilon \sim N(0,\sigma^2)
$$


## Exercise

1. Add some math to your example document

## Further Reading:

https://bookdown.org/yihui/bookdown/markdown-extensions-by-bookdown.html#equations
https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols

