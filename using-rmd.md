# Using Rmarkdown

Now that we've covered how to organise your project, have some data, and talked a bit about what rmarkdown is, let's talk about using it.

## Overview

* **Teaching** 10 minutes
* **Exercises** 10 minutes

## Questions

* How should I start an rmarkdown document?
* What do I put in the YAML metadata?
* How do I create a code chunk?
* What sort of options to I need to worry about for my code?

## Objectives

* Create an rmarkdown document, do some basic exploration

## The anatomy of an rmarkdown document

This is an rmarkdown document (demo). It has three parts:

* Metadata (YAML)
* Text (markdown formatting)
* Code (code formatting)

### Metadata

The metadata of the document tells you how it is formed - what the title is, what date to put, and other control information.  If you're familiar with LaTeX, this is kind of like how you specify the many options, what sort of document it is, what styles to use, etc at the front matter.

Rmarkdown documents use YAML (Yet Another Markup Language) to provide the metadata. It looks like this.

```YAML
---
title: "An example document"
author: "Nicholas Tierney"
output: html_document
---
```

It starts an ends with three dashes `---`, and has fields like the following: `title`, `author`, and `output`.

The options in the YAML are actually passed down into the `render` function under the hood.

This means that:

```YAML
output:
  html_document:
    toc: true
    toc_depth: 2
```

is the same as:

```r
html_document(toc = TRUE, toc_depth = 2)
```

### Text

Is markdown, as we discussed in the earlier section,

It provides a simple way to mark up text

```
- bullet list
- bullet list
- bullet list

1. numbered list
2. numbered list
3. numbered list

__bold__, **bold**, _italic_, *italic*

> quote of something profound 
```

````
```r
# computer code goes in three back ticks
1 + 1
2 + 2
```
````

Would be converted to:


- bullet list
- bullet list
- bullet list

1. numbered list
2. numbered list
3. numbered list

__bold__, **bold**, _italic_, *italic*

> quote of something profound 


```r
# computer code goes in three back ticks
1 + 1
```

```
## [1] 2
```

```r
2 + 2
```

```
## [1] 4
```


### Code

We refer to code in an rmarkdown document in two ways, code chunks, and inline code.

#### Code chunks

Code chunks are marked by three backticks and curly braces with `r` inside them:

````markdown
```{r chunk-name}
# a code chunk
```
````

**a backtick** is a special character you might not have seen before, it is typically located under the tilde key (`~`). On USA / Australia keyboards, is under the escape key:

<div class="figure">
<img src="figs/ansi-keyboard.png" alt="image from https://commons.wikimedia.org/wiki/File:ANSI_Keyboard_Layout_Diagram_with_Form_Factor.svg" width="100%" />
<p class="caption">(\#fig:show-backtick)image from https://commons.wikimedia.org/wiki/File:ANSI_Keyboard_Layout_Diagram_with_Form_Factor.svg</p>
</div>

### Chunk names

Every chunk should ideally have a name. As I've mentioned earlier, naming things is hard, but follow these rules and you'll be fine:

* one word that describes the action (e.g., "read")
* one word that describes the thing inside the code (e.g, "gapminder")
* separate words with "-" or "_" (e.g., `read-gapminder`)

## Code chunk options

You can control how the code is output by changing the code chunk options which follow the title. 

````markdown
```{r read-gapminder, eval = FALSE, echo = TRUE}
gap <- read_csv("gapminder.csv")
```
````

The ones that you need to know about right now are:

  * `cache`: TRUE / FALSE. Do you want to save the output of the chunk so it doesn't have to run next time?
  * `eval`: Do you want to evaluate the code?
  * `echo`: Do you want to print the code?
  * `include`: Do you want to include code output in the final output document? Setting to `FALSE` means nothing is put into the output document, but the code is still run.
  
<!-- What are messages, warnings, errors, results? -->

  <!-- * error: If you want R to stop on errors, set to `FALSE` -->
  <!-- * warning: preserve warnings (produced by `warning()`). IF `FALSE`, all warnings will be printed in the console instead of the output document  -->
  <!-- * message: Similar to warning, do you want to preserve messages provided by `message()`.  -->


<!--   * results: option 'hold' will wait until the code chunk is complete and then  -->
  
You can read more about the options at the official documentation: https://yihui.name/knitr/options/#code-evaluation

### Inline code

Sometimes you want to run the code inside a sentence. When the code is run inside the sentence, it is called running the code "inline".

You might want to run the code inline to name the number of variables or rows in a dataset in a sentence like:

> There are XXX observations in the airquality dataset, and XXX variables.

You can call code "inline"  like so:

````markdown

There are `r nrow(airquality) ` observations in the airquality dataset, 
and `r 'ncol(airquality) ` variables.

````

Which gives you the following sentence

> There are 153 observations in the airquality dataset, and 6 variables.

What's great about this is that if your data changes upstream, then you don't need to work out where you mentioned your data, you just update the document.

## Creating an rmarkdown document

* Rstudio menu system
* Explore the template provided by rstudio
* Compile an rmarkdown document

## Working with an rmarkdown document

**Demo: Create an rmarkdown document in rstudio.**

### Your Turn {.exercise}

1. Use the rstudio project you previously created, `rmd4sci-materials`, and create an rmarkdown document
1. Run some brief summaries of the data in the rmarkdown document inside the `
    - hist(data$)
    - How big is the data?
    - How many countries are there?
    - What was the lowest life expectancy in Australia's History?
    - How about the lowest GDP for Australia?
    - Where does Australia rank in GDP in 1999?

<!-- # My philosophy on Rmarkdown -->

<!-- - Keep it simple -->
<!-- - focus on content -->

## Nick's rmarkdown hygiene reccommendations

I highly recommend that each document you write has three chunks at the top.


````markdown

```{r setup , include=FALSE}
knitr::opts_chunk$set(echo = FALSE, 
                      fig.align = "center",
                      fig.width = 4, 
                      fig.height = 4, 
                      dev = "png",
                      cache = TRUE)
```

```{r library}
library(tidyverse)
```

```{r functions}
# A function to scale input to 0-1
scale_01 <- function(x){
  (x - min(x, na.rm = TRUE)) / diff(range(x, na.rm = TRUE))
}
```

```{r read-data}
gapminder <- read_csv(here::here("data", "gapminder.csv"))
```

````

In the `setup` chunk, you set the options that you want to define globally. In this case, I've told rmarkdown:

* `echo = FALSE`: I don't want any code printed by setting `echo = FALSE`.
* `fig.align = "center"` Align my figures in the center
* `fig.width = 4` & `fig.height = 4`. Set the width and height to 4 inches. 
*  `dev = "png"`. Save the images as PNG
* `cache = TRUE`. Save the output results of all my chunks so that they don't need to be run again.

In the `library` chunk, you put all the library calls. This helps make it clearer for anyone else who might read your work what is needed to run this document. I often go through the process of moving these `library` calls to the top of the document when I have a moment, or when I'm done writing. You can also look at Miles McBain's [`packup`](https://github.com/milesMcBain/packup) package to help move these library calls to the top of a document.

In the `functions` chunk, you put any functions that you write in the process of writing your document. Similar to the `library` chunk, I write these functions as I go, as needed, and them move these to the top when I get a moment, or once I'm done. The benefit of this is that all your functions are in one spot, and you might be able to identify ways to make them work better together, or improve them separately. You might even want to move these into a new R package, and putting them here makes that easier to see what you are doing.

In the `readr` chunk, you read in any data you are going to be using in the document.

Now, this is my personal preference, but I find the following benefits:

1. The "top part" of your document contains all the metadata / setup info. Your global options, 
1. It helps another person get oriented with your work - they know the settings, the functions used, and the special things that you wrote (your functions)
1. Remember, "another person" includes yourself in 6 months.

## Your Turn {.exercise}

1. Update your rmarkdown document based on the aforementioned hygiene steps discussed by Nick.
