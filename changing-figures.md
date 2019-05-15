# Customising your figures

When you produce figures, you usually want to tweak them a little bit. A bit wider, perhaps a bit taller. Perhaps a different image type other than "png", because the journal requires "TIFF" or "EPS". Maybe you need 600dpi because you're going to print it really big. So, how do you control these features?

You can control the size and features of figures with the chunk options. In this section, we are going to talk more specifically about how to customise your figures.

## Overview

* **Teaching** 10 minutes
* **Exercises** 10 minutes

## Questions

* How do I change the height and width of a figure?
* How to I change the type of output of a figure? (e.g., PDF, TIFF, PNG, JPG, SVG)
* Can I set all the figure features globally?
* How do I save the figures?

## Objectives

* Learn how to set individual figure height, width, aspect, and print size
* Learn how to set global parameters for your chunks
* Get a copy of all of your figures

## Which chunk options should you care about for this?

There are many chunk options that control your output, but only a few that you really need to worry about for your figures:

- `fig.align`: How do you want your figure aligned? Takes one of the following inputs: "default", "center", "left", or "right"? (**demo**)
- `fig.cap`: Would you like a caption for your figure? It takes a character vector as input: "My Amazing Graph"
- `fig.height` & `fig.width`: How tall and wide would you like your figure in inches? Takes one number (e.g., `7`, or `9`)
- `out.height` & `out.width`: The height and width of your plot in the final file. This can be handy if you like the current aspect ratio of your plot, but you want to shrink it by say 50% - which you would do with "50%". You can also include LaTeX output or HTML output. Say for example, ".8//linewidth" or "8cm" for LaTeX, or "300px" for HTML.

For demonstration purposes, let's take a plot from earlier and show how it's output can change.

* with `fig.height`, `fig.width`, `out.width`, `dev`

### Your Turn {.exercise}

1. Open exercise `ecercises/02-rmd-figures-chunks/02-rmd-figures-chunks.Rmd` Create three figures, each with the following attributes:
    * 2x2
    * 10x10
    * 4x7
    * "center"
    * "out.width = 50%"

## Setting global options

If we repeat adding the same chunk options for each figure, we might want to consider setting them globally. We can do this with the following code:

```r
knitr::opts_chunk$set(chunk_option1 = TRUE, ...)
```

(As mentioned earlier), I typically set this up in a code chunk at the start of a document.

### Your Turn {.exercise}

1. Set the global options in your document to set:
  * `fig.height`
  * `figh.width`
  * `dev`

## Keeping your figures {.demo}

You can set the options for your figures, which will change how they appear on the page, but this won't save the figures anywhere. In order to save the figures to file, you need to et the YAML option `keep_md: true`:

```YAML
---
title: "Awesome report"
author: "You"
output:
  html_document:
    keep_md: true
---
```

## Your Turn {.exercise}

1. Save your images in your document by setting `keep_md: true`

## Further Reading

- [Official knitr documentation](https://yihui.name/knitr/options/#plots)
