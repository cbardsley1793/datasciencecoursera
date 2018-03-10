# Getting and Cleaning Data
# Course Project
# run_analysis.R
# Cherie Bardsley
# 3/8/2018

# Set working directory
setwd ("/Users/cbardsley/Documents/Getting_and_Cleaning_Data/")

# Download and unzip the data for the project
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "dataset.zip", mode = "wb")
unzip(zipfile = "dataset.zip")

# Prepare the training and testing data for a merge
# Read the training tables
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Read the testing tables
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Read the features
features <- read.table("./UCI HAR Dataset/features.txt")

# Read the activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Set the column names for the training tables
colnames(x_train) <- features[, 2]
colnames(y_train) <- "activityId"
colnames(subject_train) <- "subjectId"

# Set the column names for the testing tables
colnames(x_test) <- features[, 2]
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

# Set the column names for the activity labels table
colnames(activity_labels) <- c("activityId", "activityType")

# Merge the training and test data sets to create one data set
merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)
merge_all <- rbind(merge_train, merge_test)

# Extract only the measurements on the mean and standard deviation for each measurement
# Store the column names from the merged data set in a variable
col_names <- colnames(merge_all)

# Create a variable containing the activity and subject IDs, and the mean and standard deviation
mean_sd <- (grepl("activityId", col_names) |
            grepl("subjectId", col_names) |
            grepl("mean..", col_names) |
            grepl("std..", col_names))

# Create a subset of the merged data set containing the mean and standard deviation
mean_sd_subset <- merge_all[ , mean_sd == TRUE]

# Use descriptive activity names to name the activities in the data set
desc_activity_names <- merge(mean_sd_subset, activity_labels, by = "activityId", all.x=TRUE)

# Create a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_dataset <- aggregate(. ~subjectId + activityType, desc_activity_names, mean)
tidy_dataset <- tidy_dataset[order(tidy_dataset$subjectId, tidy_dataset$activityId),]

# Write the tidy data set to a file
write.table(tidy_dataset, file = "./tidy_data.txt", row.names = FALSE)
write.csv(tidy_dataset, file = "./tidy_data.csv", row.names = FALSE)

