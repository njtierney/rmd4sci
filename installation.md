# Installation

In this section, the aim is to have everyone setup with R, RStudio, and RMarkdown.

## Overview

***Duration** 15 minutes

## Questions

* How do I install R?
* How do I install rmarkdown?
* How do I install LaTeX in a sane way?

## Software Setup

### R

#### Windows

https://cloud.r-project.org/bin/windows/

#### MacOS

https://cloud.r-project.org/bin/macosx/

#### Linux

https://cloud.r-project.org/bin/linux/

### RStudio

https://www.rstudio.com/products/rstudio/download/#download

## RMarkdown

To ensure you are up to date, run the following script to install the packages.


```r
install.packages("rmarkdown")
install.packages("knitr")
install.packages("tinytex")
install.packages("here")
install.packages("tidyverse")
install.packages("broom")
install.packages("fs")
```

## A note on PDF

rmarkdown documents can be compiled to PDF, which is a great feature. In order to convert the documents to PDF, they use a software called LaTeX (\LaTeX) (pronounced la-tek or lay-tek). 

Installing LaTeX [can be a pain](https://yihui.name/tinytex/pain/), but thankfully there is an easier way to instlal it - [`tinytex`](https://yihui.name/tinytex/). `tinytex` is an R package that installs a sane, lightweight (<200Mb) version of LaTeX. 


```r
tinytex::install_tinytex()
```

If you get the following error, this is good! As it means that TeX has already been installed:

```
Error: Detected an existing tlmgr at /usr/local/bin/tlmgr. It seems TeX Live has been installed (check tinytex::tinytex_root()). You have to uninstall it, or use install_tinytex(force = TRUE) if you are sure TinyTeX can override it (e.g., you are a PATH expert or installed TinyTeX previously).
```

### Problem solving with LaTeX

If you have any problems with installing `tinytex`, I reccomend you check out the [tinytex FAQ page](https://yihui.name/tinytex/faq/).

## Test Script

You should be able to fun the following code on your machine


```r
library(rmarkdown)
library(knitr)
library(tidyverse)
```
