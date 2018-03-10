# Getting and Cleaning Data Course Project CodeBook
Author:  Cherie Bardsley  
Date:  March 8, 2018  


This code book describes the variables, the data, and any transformations or work that was performed to clean up the data for this project. 


## Data Source Information
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data for this project represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

The original data for this project is loacted here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the data is located here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Transformation Information

The following transformations were performed on the original data:
  * The original data was downloaded and unzipped
  * The training and test data sets were merged together to create a single data set
  * A subset of the data was created containing the mean and standard deviation for each measurement
  * Descriptive activity and variable names were used to name the activities/variables in the data set
  * A second, independent tidy data set was created containing the avaerage of each variable for each activity and each subject

For further information, please see comments in run_analysis.R script file for this project.
