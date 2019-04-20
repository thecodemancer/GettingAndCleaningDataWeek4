Final Project Submission
---------------------------

This file describes how I structured the run_analysis.R script. Please note that I followed the instructions directly as per the "Getting and Cleaning Data" course description on Cousera

0. set wd correctly and Load packages
--------------------------------------
In the first step I set the working directory and load the dplyr package

1. Load data
--------------------------------------
In this step I load the data into R by reading the files

2. Change the name of the variables
--------------------------------------
I use descriptive activity names to name the activities and the features in the data set

3. Extracts only the measurements on the mean and standard deviation for each measurement
-----------------------------------------------------------------------------------------
By using grep function I identify only the variables that has the name 'mean' and 'STD' on it

4. Merge the datasets
---------------------
I use the functions merge, cbind and rbind

5. Calculate the means
----------------------
I create a second, independent tidy data set with the average of each variable for each activity and each subject.