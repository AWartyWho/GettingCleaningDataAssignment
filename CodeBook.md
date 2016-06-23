# Getting Cleaning Data Assignment

This repo for the Getting and Cleaning Data Course Project has been completed by Matthew Chan.

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This document contains additional information describing the data, the variables, and all transformations and work that the run_analysis.R script performs to clean up the data.

## Information about the data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

## For each record in the dataset it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment.

## Transformations/Variables

1. Merges the training and the test sets to create one data set (*combined*) from the following files in the train & test folders:
      * X_train.txt
      * X_test.txt
      * y_train.txt
      * y_test.txt
      * subject_train.txt
      * subject_test.txt
2. Extracts only the measurements on the mean and standard deviation for each measurement into the *combined2* data frame
3. Uses descriptive activity names to name the activities in the *combined2* data set
      * Names from activity_labels.txt
4. Appropriately labels the *combined2* (renamed to *data*) data set with descriptive variable names by replacing strings as follows:
      * *t* at the beginning of the name -> *TimeOf*
      * *f* at the beginning of the name -> *FrequencyOf*
      * *Acc* -> *Accelerometer*
      * *Gyro* -> *Gyroscope*
      * *Mag* -> *Magnitude*
      * *BodyBody* -> *Body*
      * *mean()* -> *Mean*
      * *std()* -> *StdDev*
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject titled *data_average.txt*.