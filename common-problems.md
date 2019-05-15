# Common Problems with rmarkdown (and some solutions)

There are some things that I run into fairly frequently (and some not so much) when I'm rendering my rmarkdown documents. This section details some the common problems, and the solution that I have found works for me.

If you want to practice on fixing broken rmarkdown documents, check out some pathologically broken examples on github at [njtierney/rmd-errors](https://github.com/njtierney/rmd-errors).

## Avoiding problems

To avoid problems in the first place, I try and do the following:

- Develop code in chunks and execute the chunks until they work, then move on.
- knit the document regularly to check for errors.

Then, if there is an error:

- recreate the error in an interactive session:
    - restart R
    - run all chunks below
    - find the chunk that did not work, fix until it does
    - run all chunks below
    - explore working directory issues
      - remember that the rmarkdown directory is where the .Rmd file lives

## The errors

What follows from here are all the errors you might in an rmarkdown document, with the following structure:

- What they might look like
- What the error message might appear to be, and 
- How to solve them

## "Duplication": Duplicated chunk names

**What it might look like**

Chunks like this:

````markdown

```{r title-one}
```

```{r title-one}
```

````

**The error message**

This is caught before the document compiles with a warning like:

```
processing file: common-problems.Rmd
Error in parse_block(g[-1], g[1], params.src) : 
  duplicate label 'title-one'
Calls: local ... process_file -> split_file -> lapply -> FUN -> parse_block
Execution halted
Error in Rscript_render(f, render_args, render_meta) : 
  Failed to compile common-problems.Rmd
Calls: <Anonymous> ... render_book -> render_new_session -> Rscript_render
Execution halted
```

The important part to note is the start:

```
.
.
.
Error in parse_block(g[-1], g[1], params.src) : 
  duplicate label 'title-one'
.
.
.
```

**How to solve**

* In our case we have the same chunk name twice: 'title-one'. Change the chunk name of one of them!

## "Not what I ordered": Objects not created in the right order

**What it might look like**

```r
plot(my_table)

my_table <- table(mtcars$cyl)
```


**The error message**

**How to solve**

## "Forgotten Trails I":  Missing ",", or "(", "}", or "'"

**What it might look like**

**The error message**

**How to solve**


## "Forgotten Trails II": Chunk option with trailing ", or not input

**What it might look like**

**The error message**

```
processing file: rstudio.Rmd
(*) NOTE: I saw chunk options "fig-rstudio-workspace-options, fig.cap = "Setting the options right for rstudio, so you don't restore previous sessions work, and don't save it either."
 please go to https://yihui.name/knitr/options
 (it is likely that you forgot to quote "character" options)
Error in parse(text = code, keep.source = FALSE) : 
  <text>:1:51: unexpected INCOMPLETE_STRING
1: alist( 'fig-rstudio-workspace-options', fig.cap = "Setting the options right for rstudio, so you don't restore previous sessions work, and don't save it either. )
```

**How to solve it?**

* The easiest way is to do Cmd+Shift+F, which opens up a global search in your rstudio project, and then type in the offending string mentioned in the NOTE. In this case, I would search for the partial string `"fig.cap = "Setting the options right for rstudio, so you don't restore previous sessions work, and`. I search for the partial string because there might be parts at the end of the error message that aren't in the text.

## "Forgotten Trail III": 

**What it might look like**

**The error message**

```
processing file: figures-tables-captions.Rmd
(*) NOTE: I saw chunk options "read-gapminder include = FALSE, echo = FALSe"
 please go to https://yihui.name/knitr/options
 (it is likely that you forgot to quote "character" options)
Error in parse(text = code, keep.source = FALSE) : 
  <text>:1:23: unexpected symbol
1: alist( read-gapminder include
                          ^
```

**How to solve**

This error message is pretty good, I needed to add a comma after my chunk name. 

So, go from:

````markdown
``{r read-gapminder include = FALSE, echo = FALSE}
gapminder <- readr::read_csv(here::here("data", "gapminder.csv"))
```
````

to 

````markdown
``{r read-gapminder, include = FALSE, echo = FALSE}
gapminder <- readr::read_csv(here::here("data", "gapminder.csv"))
```
````


## "The Path Not Taken" File path incorrect

**What it might look like**

**The error message**

**How to solve**

## "Spolling I" Incorrectly spelled chunk options

These are often not an error, but you just won't get the behaviour that you expect.

**What it might look like**

* `fig.caption` instead of `fig.cap`. This once caused me to rewrite a lot of code and an entire section of a paper until I realised the problem.

**The error message**

**How to solve**

* There might be a switch you can flick to ask `knitr` to solve

## "Spolling II" Incorrectly spelled chunk option inputs

So this is when you provide the wrong input to your chunk options. Like something that requires `TRUE` gets "yes", or something that needs `"100%"` instead gets `100`

**What it might look like**

**The error message**

```
Quitting from lines 31-32 (figures-tables-captions.Rmd) 
Error in eval(x, envir = envir) : object 'FALSe' not found
Calls: local ... process_group.block -> call_block -> eval_lang -> eval -> eval
Execution halted
Error in Rscript_render(f, render_args, render_meta) : 
  Failed to compile figures-tables-captions.Rmd
Calls: <Anonymous> ... render_book -> render_new_session -> Rscript_render
Execution halted
```

**How to solve**

What was the problem? Turns out I provided the option `FALSe` instead of `FALSE`.


Go from:

````markdown
``{r read-gapminder include = FALSE, echo = FALSe}
gapminder <- readr::read_csv(here::here("data", "gapminder.csv"))
```
````

to 

````markdown
``{r read-gapminder, include = FALSE, echo = FALSE}
gapminder <- readr::read_csv(here::here("data", "gapminder.csv"))
```
````

## "The Legend of Link I": Your images in `![]()` don't work.

I often forget that it is `![](path/to/image)`, and note `![]("path/to/image")`. There are no quote marks!

## LaTeX errors

There is no panacea for LaTeX errors, but if you aren't familiar with "what that error message" might look like, here are some details.

**What it might look like**

**The error message**

**How to solve**

## I want to include inline R code verbatim to show an example

... Like for a book on using rmarkdown or something.

Check out this great [blog post by T. Hovorka from R Views](https://rviews.rstudio.com/2017/12/04/how-to-show-r-inline-code-blocks-in-r-markdown/)

It boils down to this:

<span style="color:blue">``` `` `r "\u0060r expression\u0060"` `` ```</span>.

## My Figure or Table isn't being cited

**What it might look like**

You create a figure, 

**The error message**

There isn't one - you just get `\@ref(fig:figure-chunk-name)` printed.

**How to solve**

You need to make sure that you actually print the table or plot. If you create the plot and save it, but do not print it in the document, then you will not be able to reference the plot or table.

## Your Turn {.exercise}

1. Go to this repo [njtierney/rmd-errors](https://github.com/njtierney/rmd-errors), and give debugging some of these common rmarkdown errors a go.
