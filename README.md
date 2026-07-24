# My Bioinformatics Learning

## Introduction

This repo is public, but I wouldn't rely on anything in it yet -- since at this point it's just notes, so it's quite a disorganized mess.  But see the Set Up sections if you're determined.

## Preliminaries

The [Study Plan](StudyPlanBioinformatics.qmd) contains the latest version of what we'll be working on.   How that breaks down by directory:

* biostar - files from explorations done using [The Biostar Handbook](https://www.biostarhandbook.com/)
* alcoholismResearch - some articles, Gemini queries, and notes for a very introductory presentation on The Bioinformatics of Alcohol Dependence.
* [[rAndStatistics]] - Improving R and Statistics.  Currently our main text for this is [Modern Statistics with R](https://www.modernstatisticswithr.com/).  We've foregone Fields et. al on R and Statistics as being too much of a tome.
* hacking -- Just whatever curiosity turds don't quite fit anywhere else.

## Set Up
### To set up an R environment:

- Add the official rig repository tap: `brew tap r-lib/rig`
- Allow the system to trust the tap `brew trust r-lib/rig` 
- Install the app `brew install --cask rig`
- rig add (r version: "release", or "4.3.2" or the like w/o quotes)
- brew install --cask rstudio
### Setting up the Python environment:

Use ```conda activate bio``` to activate the project, or use environment.yml to recreate it.   (TODO:  Show command.)

This step is also needed to use quarto markdown:
  ```
  python3 -m jupyter labextension enable jupyterlab-quarto
  ```



