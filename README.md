# Getting Cleaning Data Assignment

This repo for the Getting and Cleaning Data Course Project has been completed by Matthew Chan.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

## run_analysis.R

This script will take the above data and perform the following tasks:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject titled "data_average.txt".

Please note: set the working directory to be the main folder containing the data files before executing the r_analysis.R script.

## CodeBook.md

This markdown document describes the variables, the data, and all transformations and work that the run_analysis.R script performs to clean up the data.