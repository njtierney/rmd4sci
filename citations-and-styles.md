# Citating Articles & Bibliography Styles

Now that you are near the end of your data analysis, you want to make sure that you've ~~plugged in the gaps of REF1 REF2 and so on~~ correctly cited the articles and software you wanted to mention.

## Overview

* **Teaching**
* **Exercises**

## Questions

* What sort of things can I cite?
* How do I manage my `.bib` file?
* How do I change the citation style?

## Objectives

* Provide a bibliography at the end of the document
* Cite articles and packages during the document
* learn how to manage citation styles

## How to cite things

Citing things in an rmarkdown document is straightforward, you refer to articles you want to cite using `[@article-handle]`. Here, `article-handle` matches the article handle in your `.bib` file.

This `.bib` file is referred to in the YAML of your document, under the option `bibliography: filename.bib`:

```YAML
---
title: 
author:
output: html_document
bibliography: references.bib
---
```

### What is a .bib file?

Good question. `.bib` is a format for storing references from the haydey of LaTeX. It contains scripts with reference information for the article. Here's an example one

```
  @Book{ggplot2,
    author = {Hadley Wickham},
    title = {ggplot2: Elegant Graphics for Data Analysis},
    publisher = {Springer-Verlag New York},
    year = {2016},
    isbn = {978-3-319-24277-4},
    url = {http://ggplot2.org},
  }
```

### And how do I generate these .bib files?

You can use the `citation` function in R for R itself, and for specific R packages.

We can get the citation for R with:


```r
citation()
```

```
## 
## To cite R in publications use:
## 
##   R Core Team (2017). R: A language and environment for
##   statistical computing. R Foundation for Statistical Computing,
##   Vienna, Austria. URL https://www.R-project.org/.
## 
## A BibTeX entry for LaTeX users is
## 
##   @Manual{,
##     title = {R: A Language and Environment for Statistical Computing},
##     author = {{R Core Team}},
##     organization = {R Foundation for Statistical Computing},
##     address = {Vienna, Austria},
##     year = {2017},
##     url = {https://www.R-project.org/},
##   }
## 
## We have invested a lot of time and effort in creating R, please
## cite it when using it for data analysis. See also
## 'citation("pkgname")' for citing R packages.
```

And for ggplot2 with


```r
citation("ggplot2")
```

```
## 
## To cite ggplot2 in publications, please use:
## 
##   H. Wickham. ggplot2: Elegant Graphics for Data Analysis.
##   Springer-Verlag New York, 2016.
## 
## A BibTeX entry for LaTeX users is
## 
##   @Book{,
##     author = {Hadley Wickham},
##     title = {ggplot2: Elegant Graphics for Data Analysis},
##     publisher = {Springer-Verlag New York},
##     year = {2016},
##     isbn = {978-3-319-24277-4},
##     url = {https://ggplot2.tidyverse.org},
##   }
```

For journals or books, you'll need to get a specific .bib file. Yes, this can be a bit of a pain, but this is where you need to use a reference management software like [Zotero](https://www.zotero.org/), [Mendeley](https://www.mendeley.com/download-desktop/), [papers](https://www.papersapp.com/), or my personal preference [paperpile](https://paperpile.com/). The important thing to to **use something**. These all allow you to get .bib files of your articles, which you can then placec in your `references.bib` file.
  
### ## Your Turn {.exercise}

1. Generate a references.bib file to place your citations
1. Using the `citation()` function, generate citations for the packages we have used, "dplyr", "ggplot2", "gapminder", and for the R software, place these in your `references.bib` file
1. Reference these in your document
1. Add a final heading in your file called `#bibliography`
1. Render the document

## How to change the bibliography style

OK so now you've got your bibliography, but you now need to change it to _a specific journal format_. Luckily, this is now pretty easy. You can change your citation style from the [citation style language](https://citationstyles.org/)

Similar to how you referred to your `.bib` file with `bibliography: ref.bib`, you do something similar:

```YAML
---
title:
author:
output: html_document
bibliography: references.bib
csl: my_journal.csl
---
```

### ## Your Turn {.exercise}

1. select your bibliography style to be one from your favourite journal at the CSL github repo here: https://github.com/citation-style-language/styles (> 1800 citations and counting)
1. place this in your rstudio project
1. refer to it in the YAML
1. Render your document and observe your greatness

## How to move the bibliography location

The bibliography is typically placed at the end of the document, so your last heading should be something like `# References`. However, if you want to move it, you need to use the `bookdown::html_document2()` output option, and then in your document, place the following piece of text in the reference section. For example.

```
# Introduction

# References {-}

<div id="refs"></div>

# Appendix
```

Note the reference section, the code: `<div id="refs"></div>`


This is taken from [this SO thread](https://stackoverflow.com/questions/51335125/adding-figures-and-tables-after-bibliography-in-rmarkdown?noredirect=1&lq=1). Note that the answer also states: 

> Note: this will only work if you use pandoc's built-in citation package and won't work if you set citation_package: natbib in the YAML

### ## Your Turn {.exercise}

1. Generate a bibliography and an appendix that follows it
