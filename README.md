# CourseProject-Samsung

This repo contains the run_analysis.R file and the CodeBook.md file

The CodeBook.md file explains the run_analysis.R file and explains all the variables in the tidy data set that is generated by the run_analysis.R file

The run_analysis.R file completes the steps necessary for the Course Project:

* Combines the training and test data sets into a combined data set(frame)
* Extracts the measurements that are the mean and standard deviations for each measurement
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels each column in the dataset to be meaningful
* Creates a tidy data set from the previous step with the average of each variable for each activity and each subject
* The tidy data set is written to tidyData.txt file and written in the working directory

IMPORTANT: The working directory must contain the run_analysis.R script as well as the "UCI HAR Dataset" directory

##Information on the Original Data Set

The "UCI HAR Dataset" directory contains the following txt files
* activity_labels.txt : Labels on the various activities recorded
* features.txt : The features in the test and training data sets (561 features)
* features_info.txt : Information on the features recorded
* README.txt
* Training directory called "train" which contains the training data (and additional directory not needed for this analysis)
* Test directory called "test" which contains the test data (and additional directory not needed for this analysis)

More information on this dataset can be obtained from [Samsung Data Set Info](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data set in a zip file is available from [Samsung Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )


The dplyr package is needed for the analysis. The run_analysis.R file checks if this is available and loaded.




