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

The dataset includes the following files:

'README.txt'

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## Transformation Information

The following transformations were performed on the original data:
  * The original data was downloaded and unzipped
  * The training and test data sets were merged together to create a single data set
  * A subset of the data was created containing the mean and standard deviation for each measurement
  * Descriptive activity and variable names were used to name the activities/variables in the data set
  * A second, independent tidy data set was created containing the avaerage of each variable for each activity and each subject

For further information, please see comments in run_analysis.R script file for this project.
