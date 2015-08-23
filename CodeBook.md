#CodeBook.md

## This describes what the script run_analysis.R is doing

Note: The working directory must contain the "UCI HAR Dataset Directory". This directory is obtained when the Samsung dataset is unzipped.

run_analysis.R takes the Samsung data set does the following things:

* loads the dplyr package which is used later
* The feature names are loaded from the features.txt file
* Reads the training set, the training activity labels and subject ID
* Reads the test set, the test activity labels and the test subject ID
* The second column names in the training and test activity data frames are renamed to Activity
* The second column names in the training and test subject data frames are renamed to SubjectID
* The training set and the test set are combined with rbind to get the combined data set
* The feature names are used to name the combined data set
* The activity and subject Id are added to the combined data set by cbind
* Any variables that contain the word "mean" or "std" are extracted from the feature names
* The original data set is subsetted using these columns to get only those columns that contain either a mean or standard deviation
* The column names in this data frame is then filtered to make the variable names meaningful
   1. Remove the left and right braces
   2. Converts "-mean-X" to ".Mean.X"
   3. Converts "-mean-Y" to ".Mean.Y"
   3. Converts "-mean-Z" to ".Mean.X
   3. Converts "-std-X" to ".Std.X"
   3. Converts "-std-Y" to ".Std.Y"
   3. Converts "-std-Z" to ".Std.Z"
   3. Converts "-meanFreq" to ".MeanFreq"
   3. Converts "-std" to ".Std"
   3. Converts "-X" to ".X"
   3. Converts "-Y" to ".Y"
   3. Converts "-Z" to ".Z"
   3. Converts "-mean" to ".Mean"
   3. Converts "BodyBody" to "Body"
   3. Replaces "t" to "Time"
   3. Converts "f" to "Freq"
   
 * The column names are renamed based on the above reolacements/substitutions
 * uses group_by from the dplyr package to group the new data set by subject ID and Activity
 * uses summarise_each from the dplyr package to get the column means
 * Adds "Mean." each variable name to indicate this is a mean value
 * Write out the tidy data set 
   
 

## This describes the variables in the tidy set

* All features are mean variables and are prefixed by the word Mean
* Time domain measurements and variables are have the word Time after the Mean prefix
* Frequency domain variables have the word Freq after the Mean prefix
* Gyro indicates measurements from the gyroscope
* Acc indicates body acceleration
* Gravity indicates gravitational acceleration
* Jerk indicates the jerk (derivative of the acceleration) either gyroscopic or body
* There are 81 features including the Subject ID and Activity.
* 

*  SubjectID : ID of Test Subject
 * Activity: Factor w/ Six Levels: WALKING, WALK UP, WALK DOWN, SITTING, STANDING, LAYING
 
 * Mean.TimeBodyAcc.Mean.[XYZ] : Mean of the mean of the body acceleration in X, Y and Z directions in the time domain
 * Mean.TimeBodyAccJerk.Mean.[XYZ] : Mean of the mean of the body jerk in X, Y and Z directions in the time domain
 * Mean.TimeGravityAcc.Mean.[XYZ]: Mean of the mean of the gravitational acceleration in X, Y and Z directions in the time domain
 * Mean.TimeBodyGyro.Mean.[XYZ]: Mean of the mean of the body gyroscopic measurement in X, Y and Z directions in the time domain
 * Mean.TimeBodyGyroJerk.Mean.[XYZ]: Mean of the mean of the body gyroscopic jerk in X, Y and Z directions in the time domain
 * Mean.TimeBodyAccMag.Mean: Mean of the mean of the magnitude of the body acceleration in the time domain
 * Mean.TimeGravityAccMag.Mean: Mean of the mean of the magnitude of the gravitational acceleration in the time domain
 * Mean.TimeBodyGyroMag.Mean: Mean of the mean of the maginitude of the gyroscopic measument in the time doimain
 * Mean.TimeBodyGyroJerkMag.Mean: Mean of the mean of magnitude of the body gyroscopic jerk in the time domain 
 
 * Mean.FreqBodyAcc.Mean.[XYZ] : Mean of the mean of the body acceleration in X, Y and Z directions in the frequency domain
 * Mean.FreqBodyAccJerk.Mean.[XYZ] : Mean of the mean of the body jerk in X, Y and Z directions in the frequency domain
 * Mean.FreqGravityAcc.Mean.[XYZ]: Mean of the mean of the gravitational acceleration in X, Y and Z directions in the frequency domain
 * Mean.FreqBodyGyro.Mean.[XYZ]: Mean of the mean of the body gyroscopic measurement in X, Y and Z directions in the frequency domain
 * Mean.FreqBodyGyroJerk.Mean.[XYZ]: Mean of the mean of the body gyroscopic jerk in X, Y and Z directions in the frequency domain
 * Mean.FreqBodyAccMag.Mean: Mean of the mean of the magnitude of the body acceleration in the frequency domain
 * Mean.FreqGravityAccMag.Mean: Mean of the mean of the magnitude of the gravitational acceleration in the frequency domain
 * Mean.FreqBodyGyroMag.Mean: Mean of the mean of the maginitude of the gyroscopic measument in the frequency doimain
 * Mean.FreqBodyGyroJerkMag.Mean: Mean of the mean of magnitude of the body gyroscopic jerk in the frequency domain 
 
 * Mean.TimeBodyAcc.Std.[XYZ] : Mean of the standard deviation of the body acceleration in X, Y and Z directions in the time domain
 * Mean.TimeBodyAccJerk.Std.[XYZ] : Mean of the standard deviation of the body jerk in X, Y and Z directions in the time domain
 * Mean.TimeGravityAcc.Std.[XYZ]: Mean of the standard deviation of the gravitational acceleration in X, Y and Z directions in the time domain
 * Mean.TimeBodyGyro.Std.[XYZ]: Mean of the standard deviation of the body gyroscopic measurement in X, Y and Z directions in the time domain
 * Mean.TimeBodyGyroJerk.Std.[XYZ]: Mean of the standard of the body gyroscopic jerk in X, Y and Z directions in the time domain
 * Mean.TimeBodyAccMag.Std: Mean of the standard deviation of the magnitude of the body acceleration in the time domain
 * Mean.TimeGravityAccMag.Std: Mean of the standard deviation of the magnitude of the gravitational acceleration in the time domain
 * Mean.TimeBodyGyroMag.Std: Mean of the standard deviation of the maginitude of the gyroscopic measument in the time doimain
 * Mean.TimeBodyGyroJerkMag.Std: Mean of the standard devaition of magnitude of the body gyroscopic jerk in the time domain 

 
 * Mean.FreqBodyAcc.Std.[XYZ] : Mean of the standard deviation of the body acceleration in X, Y and Z directions in the frequency domain
 * Mean.FreqBodyAccJerk.Std.[XYZ] : Mean of the standard deviation of the body jerk in X, Y and Z directions in the frequency domain
 * Mean.FreqGravityAcc.Std.[XYZ]: Mean of the standard deviation of the gravitational acceleration in X, Y and Z directions in the frequency domain
 * Mean.FreqBodyGyro.Std.[XYZ]: Mean of the standard deviation of the body gyroscopic measurement in X, Y and Z directions in the frequency domain
 * Mean.FreqBodyGyroJerk.Std.[XYZ]: Mean of the standard of the body gyroscopic jerk in X, Y and Z directions in the frequency domain
 * Mean.FreqBodyAccMag.Std: Mean of the standard deviation of the magnitude of the body acceleration in the frequency domain
 * Mean.FreqGravityAccMag.Std: Mean of the standard deviation of the magnitude of the gravitational acceleration in the frequency domain
 * Mean.FreqBodyGyroMag.Std: Mean of the standard deviation of the maginitude of the gyroscopic measument in the frequency doimain
 * Mean.FreqBodyGyroJerkMag.Std: Mean of the standard devaition of magnitude of the body gyroscopic jerk in the frequency domain 
 * 
 *
 
 
 

*  