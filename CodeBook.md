---
title: "CodeBook"
author: "Jonas Wagner"
date: "28 5 2023"
output: html_document
---

This is the CodeBook for the Getting and Cleaning Data Project.

The data:
"Human Activity Recognition Using Smartphones Dataset"
According to the readme file the data stems from 30 volunteers with an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). Data was collected using a Samsung Galaxy S II. The dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals were noise filtered.

The variables
For each subject and acitivity the following variables were provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 

Acceleration unit is standard gravity units 'g'.

The angular velocity vector units are radians/second. 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

Transformations

The zip file was unzipped using WinRAR, outside the R environment.

Training and test data sets were merged.
Activity id was replaced with proper names. 
Only mean and std were extracted. 
The data were renamed with descriptive variable names.
A new tidy data set was created with all of the new implemented names and only the mean.