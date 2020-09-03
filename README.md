# Project for Coursera Data Cleaning Course

This repository was built for the course project of the "Getting and Cleaning Data" course at Coursera.

## Project Summary

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The `run_analysis.R` script should be run on the [data] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and it will complete the following steps to transform the data into something that we are able to glean information out of.

 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Repository Information

This repository contains 3 main files:

 - `run_analysis.R` - This script is used to build up and perform the analysis on the required sample data.
 - `tidy_data_average.txt` - This is the final output from the `run_analysis.R` script.  It contains a cleansed version of the sample data.
 - `CodeBook.md` - Contains the definitions of each of the columns in our generated `tidy_data_average.txt` file.