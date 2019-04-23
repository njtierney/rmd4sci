# Captioning and referencing equations

This section introduces how to add captions to equations, and reference them in text. Note that when using captioning, you need to use the `bookdown::html_document2` output.

## Overview

* **Teaching**: 5 minutes
* **Exercises**: 5 minutes

## Questions

- How do I caption an equation?
- How do I reference an equation?

### Numbering equations

You can provide a number for an equation by adding `\begin{equation}` along with a label, provided with `(\#eq:label)`

$$
\begin{equation}
  Y \sim X\beta_0 + X\beta_1 + \epsilon
  (\#eq:model)
\end{equation}
$$

You can then refer to the equation in text using `\@ref(eq:model)`:

> Our model is given in \@ref(eq:model)



If you want to provide a specific number to the equation, you can use `\tag{XX.XX}`

$$
Y \sim X\beta_0 + X\beta_1 + \epsilon \tag{1}
$$



## Numbering equations



## Referencing equations

