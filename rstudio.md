# RStudio, What and Why

## Overview

* **Teaching** 5 minutes
* **Exercises** 2 minutes

## Questions

* What is RStudio?
* Why should I use RStudio?
* What features should I change?

## Objectives

* Get familiarised with RStudio, get set up with not storing session info
* Download the course materials for the workshop

## What is RStudio, and why should I use it?

If R is the engine and bare bones of your car, then RStudio is like _the rest of the car_. The engine is super critical part of your car. But in order to make things properly functional, you need to have a steering wheel, comfy seats, a radio, rear and side view mirrors, storage, and seatbelts. 

The RStudio layout has the following features:

- On the upper left, the Rmarkdown script
- On the lower left  The R console
- On the lower right the view for files, plots, packages, help, and viewer.
- On the upper right, the environment / history pane


<div class="figure">
<img src="figs/rstudio-screenshot.png" alt="A screenshot of the RStudio working environment."  />
<p class="caption">(\#fig:rstudio-screenshot)A screenshot of the RStudio working environment.</p>
</div>

We saw a bit of what an rmarkdown script does.

The R console is the bit where you can run your code. This is where the R code in your rmarkdown document gets sent to run. 

The file/plot/pkg viewer is a handy browser for your current files, like finder, or file explorer, plots are where your plots appear, you can view packages, see the help files.
And the environment / history pain contains the list of things you have created, and the past commands that you have run.

## Exercise: RStudio default options {.exercise}

To first get set up, I highly recommend changing the following setting

Tools > Global Options (Or `Cmd + ,`)

Under the **General** tab:

- For **workspace**
    - Uncheck restore .RData into workspace at startup
    - Save workspace to .RData on exit : "Never"
- For **History**
    - Uncheck "Always save history (even when not saving .RData)
    - Uncheck "Remove duplicate entries in history"

<div class="figure">
<img src="figs/rstudio-remove-data.png" alt="Setting the options right for rstudio, so you don't restore previous sessions work, and don't save it either." width="50%" />
<p class="caption">(\#fig:fig-rstudio-workspace-options)Setting the options right for rstudio, so you don't restore previous sessions work, and don't save it either.</p>
</div>

This means that you won't save the objects and other things that you create in your R session and reload them. This is important for two reasons

1. **Reproducibility**: you don't want to have objects from last week cluttering your session
2. **Privacy**: you don't want to save private date or other things to your session. You only want to read these in.

Your "history" is the commands that you have entered into R.

Additionally, not saving your history means that you won't be relying on things that you typed in the last session, which is a good habit to get into!

## Learning more

- [rstudio IDE cheatsheet](https://github.com/rstudio/cheatsheets/raw/master/rstudio-ide.pdf)
