---
title: "ReadMe"
output: html_document
date: "2025-01-26"
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Codebook Documentation

## Introduction
This document provides a detailed description of the process used to create the `data` and `means` datasets from the Human Activity Recognition Using Smartphones dataset.

# Script location
The script is located in run_analysis.R in the main dir and it is the only script needed to get the results.

## Loading Libraries
The following libraries are loaded:
- `dplyr`


## Loading the Test and Train Sets
The test and train sets are loaded using the `read.table` function. 
The datasets are coming from UCU HAR Dataset directory, where original ReadMe text file is available describing the data in more detail.

## Loading Subject Information
Subject information is loaded and column names are assigned.

## Loading Feature Names
Feature names are loaded and assigned to the columns of the test and train sets.

## Selecting Mean and Standard Deviation Measurements
Only mean and standard deviation measurements are selected.

## Loading and Renaming Activity Names
Activity names are loaded and renamed.

## Combining Data
The test and train sets are combined with activity and subject information.

## Summarizing Data
The data is summarized by subject and activity and means calculated for each variable. The data is writen to a text file called 'means.txt' sited in the main dir. 
## Units
The data is standardized so it does not have units. 

## Creating Codebooks
Codebooks are created for the `data` and `means` datasets using the `codebook` package.

