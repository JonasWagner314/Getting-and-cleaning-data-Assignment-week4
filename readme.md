---
title: "Readme"
author: "Jonas Wagner"
date: "6 6 2023"
output: html_document
---

In this project, we work with data collected from the accelerometers of a Samsung Galaxy S smartphone. The dataset represents human activity recognition using smartphones.

The purpose of this project is to create a tidy dataset from the raw data provided. The tidy dataset will be used for further analysis or modeling.

Files:
run_analysis.R:
This file contains the code to perform the data cleaning and transformation process. It takes the raw dataset as input and produces a tidy dataset as output.

CodeBook.md:
This file provides a  description of the variables, data, and transformations performed to obtain the tidy dataset.

tidydata.txt:
This file contains the output of the project;  the cleaned and aggregated data in a tidy format.

To run the data cleaning script, follow these steps:

Download and extract the raw dataset from the following source:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Place the script file run_analysis.R in the same directory as the extracted dataset.

Open R or RStudio and set the working directory to the location of the script and dataset.

Run the script run_analysis.R. It will read the raw data, perform the necessary cleaning and transformations, and generate the tidy dataset.

Once the script finishes executing, the resulting tidy dataset will be saved as tidydata.txt in the same directory.

