#CodeBook.md

## This describes what the script run_analysis.R is doing

Note 1: The working directory must contain the "UCI HAR Dataset" directory. This directory is obtained when the Samsung dataset is unzipped.

Note 2: Shorter variable names such as Acc for Acceleration, Gyro for Gyroscope etc. were preferred over the longer forms to keep the variable names manageable for subsequent analysis. The Google R StyleGuide has been followed as far as possible. See [google](https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml)

run_analysis.R takes the Samsung data set and does the following things that generates the tidy data file. The tidy data file contains the means of the means and standard deviations of the original measurements grouped by subject ID and by activity

* Checks if dplyr is installed and available, if not it installs and loads the package
* The feature names are loaded from the features.txt file
* Reads the training set, the training activity labels and subject ID
* Reads the test set, the test activity labels and the test subject ID
* The V1 column names in the training and test activity data frames are renamed to Activity
* The V1 column names in the training and test subject data frames are renamed to SubjectID
* The training and test activity labels are combined with rbind
* The training and test subject ID are combined with rbind
* The training set and the test set are combined with rbind to get a combined data set 
* The feature names are used to name the combined data set 
* The activity and subject ID are added to the combined data set by cbind (This completes Step 1 of the assignment)


* Any variables that contain the word "mean" or "std" are extracted from the feature names using grep()
* The original data set is subsetted using these columns to get only those columns that contain either a mean or std (standard deviation) in their name.
* The activity labels are converted into labeled factors from the activity_labels.txt file

* The column names in this data frame is then filtered to make the variable names meaningful using sub()
   1. Remove the left and right braces
   2. Replaces "-mean-X" to ".Mean.X"
   3. Replaces "-mean-Y" to ".Mean.Y"
   4. Replaces "-mean-Z" to ".Mean.X
   5. Replaces "-std-X" to ".Std.X"
   6. Replaces "-std-Y" to ".Std.Y"
   7. Replaces "-std-Z" to ".Std.Z"
   8. Replaces "-meanFreq" to ".MeanFreq"
   9. Replaces "-std" to ".Std"
   10. Replaces "-X" to ".X"
   11. Replaces "-Y" to ".Y"
   12. Replaces "-Z" to ".Z"
   13. Replaces "-mean" to ".Mean"
   14. Replaces "BodyBody" to "Body" since this is a duplicate
   15. Replaces "t" to "Time"
   16. Replaces "f" to "Freq"
   
* The column names are renamed based on the above replacements/substitutions

* Uses group_by() from the dplyr package to group the data set by subject ID and Activity
* uses summarise_each() from the dplyr package to get the column means and puts it in tidyData
* Prefixes "Mean." each variable name to indicate that all variables are means
* Write out the tidy data set using write.table() function (tidyData.txt) in the working directory
* This can be read in using: tidyData <- read.table("tidyData.txt", header = TRUE)

   
 

## This describes the variables in the tidy set

* The tidy data set contains the means of the means and standard deviations of the various measurements in the combined dataset (train + test) grouped by subjectID and activity label

* There are 81 features including the Subject ID and Activity. There are 180 rows in this data set

* All features (other that SubjectID and Activity) are mean variables and are prefixed by the word Mean and are between -1 and +1
* Time domain measurements and variables are have the word Time after the Mean prefix
* Frequency domain variables have the word Freq after the Mean prefix
* Gyro indicates measurements from the gyroscope
* Acc indicates body acceleration
* Gravity indicates gravitational acceleration
* Jerk indicates the jerk (derivative of the acceleration) either gyroscopic or body
* Mag indicates the magnitude of the measured/calculated quantities
* The variables have .Mean or .Std at the end. These indicate either the mean or the standard deviation of the variables as in the original dataset

*  SubjectID : ID of Test Subject: Integer from 1 to 30
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
 
 * Mean.FreqBodyAcc.MeanFreq.[XYZ]: Mean of the mean frequency of the body acceleration in the X,Y, or Z direction in frequency domain 
 * Mean.FreqBodyAccMag.MeanFreq: Mean of the mean of the magnitude of the mean frequency of the Body Acceleration in frequency domain
 
 * Mean.FreqBodyAccJerk.MeanFreq.[XYZ]: Mean of the mean frequency of the Body Jerk in the X,Y or Z direction in frequency domain
 * Mean.FreqBodyAccJerkMag.MeanFreq: Mean of the mean of the magnitude of the mean frequency of the Body Jerk in frequency domain
 
 * Mean.FreqBodyGyro.MeanFreq.[XYZ] : Mean of the mean frequency of the body gyroscopic value  in the X,Y or Z direction in frequency domain
 * Mean.FreqBodyGyroMag.MeanFreq: Mean of the mean frequency of the magnitude of the body gyroscopic value in frequency domain
 
 
