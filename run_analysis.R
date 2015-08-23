# Check if dplyr is installed

if(!require(dplyr)){
  install.packages("dplyr")
  library(dplyr)
}

# The working directory shhould contain the "UCI HAR Dataset" directory
dirLoc = "UCI HAR Dataset"
setwd(dirLoc)

# Get the feature list and feature names
featureList <- read.delim("features.txt",sep="", header=FALSE, stringsAsFactors = FALSE)
featureNames <- featureList[,2]

# Read the training and test data, training and test activity labels, training and test subject IDs
trainData <- read.table("train/X_train.txt")
trainActivity <- read.table("train/y_train.txt")
trainSubject <- read.table("train/subject_train.txt")
testData <- read.table("test/X_test.txt")
testActivity <- read.table("test/y_test.txt")
testSubject <- read.table("test/subject_test.txt")

# Rename the training and test activity columns, training and test subject ID columns to something understandable (otherwise just V1)
trainActivity <- rename(trainActivity, Activity = V1)
testActivity <- rename(testActivity, Activity = V1)
trainSubject <- rename(trainSubject, SubjectID = V1)
testSubject <- rename(testSubject, SubjectID = V1)

# Combine the test and training activity and subject IDs for use later
allActivity <- rbind(trainActivity,testActivity)
allSubject <- rbind(trainSubject,testSubject)

allData <- rbind(trainData,testData) #This dataset does not have any subject ID or activity label

# Adds names to the columns of the dataset
names(allData) <- featureNames

# This is the combined data set for step 1
mergedData <- cbind(allSubject,allActivity,allData)

# Select the columns that containg mean or std in their names
meanC <- grep("mean",names(allData))
stdC <- grep("std",names(allData))
selColumn <- c(meanC,stdC)
selData <- allData[,selColumn]    # Select only those columns

#allActivity <- rbind(trainActivity,testActivity)
#allSubject <- rbind(trainSubject,testSubject)

# This is the slimmed down dataset that only contains the means and std. deviations (Step # 2)
allData <- cbind(allSubject,allActivity,selData)

# Convert the Activity into a factor with labels (Step # 3)
allData$Activity <- factor(allData$Activity,levels=c(1,2,3,4,5,6), 
                           labels = c("WALKING","WALK UP", "WALK DOWN", "SITTING", "STANDING", "LAYING"))

# Get the feature names & give meaningfull names (Step # 4)
featureNames <- names(allData)  # Keep in temporary vector for text processing 


txt <- sub("\\(","",featureNames)     # Remove Left Bracket
txt <- sub("\\)","",txt)              # Remove Right Bracket
txt <- sub("-mean-X",".Mean.X",txt)   
txt <- sub("-mean-Y",".Mean.Y",txt)
txt <- sub("-mean-Z",".Mean.Z",txt)
txt <- sub("-std-X",".Std.X",txt)
txt <- sub("-std-Y",".Std.Y",txt)
txt <- sub("-std-Z",".Std.Z",txt)
txt <- sub("-meanFreq",".MeanFreq",txt)
txt <- sub("-std",".Std",txt)
txt <- sub("-X",".X",txt)
txt <- sub("-Y",".Y",txt)
txt <- sub("-Z",".Z",txt)
txt <- sub("-mean",".Mean",txt)
txt <- sub("BodyBody","Body",txt)
txt <- sub("^t","Time", txt)
txt <- sub("^f","Freq", txt)

names(allData) <- txt


# Create the Tidy Data Set (Step #5)

a1 <- group_by(allData, SubjectID, Activity)  # Group Data by SubjectID and Actvity
a2 <- summarise_each(a1,funs(mean))           # Take the mean of this grouped data set

# Add Mean. to all the Column names
txt <- names(a2)
for (i in 3:length(txt)){
  txt[i] <- paste("Mean.",txt[i],sep="")
}

# Rename the columns
names(a2) <- txt

setwd("../")

# Write Tidy Data Set
write.table(a2, "tidyData.txt",row.name=FALSE)






