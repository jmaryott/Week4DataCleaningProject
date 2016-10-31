---
title: "CodeBook.md"
author: "Jessica Maryott"
date: "October 30, 2016"
output: html_document
---

## Variables found in tidyMeanData.txt

### Note: These variables are from the original dataset, with modifications as listed. 
Documentation from the original data set authors can be found at:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* subject  
    + subject number from the original data set
    + contains a number from 1-30, indicating which subject the data was collected for  

* ActivityName
    + name of the activity the row was collected for
    + this is a factor, based on the numbered activity code in the original data set and the provided lookup table
    + possiblities are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  
      
* ActivityNumber
    + number identifying the activity, as in the original data
    + the map of number to activity name is:
        - 1 WALKING
        - 2 WALKING_UPSTAIRS
        - 3 WALKING_DOWNSTAIRS
        - 4 SITTING
        - 5 STANDING
        - 6 LAYING
        
* Each of the remaining variables (listed below) are means of the matching variable from the original dataset (called features), across each subject and activity combination. Thus, the tidy data set has one row per unique subject/activity combination (180 rows = 30 subjects x 6 activities. There was no missing data: each subject performed each activity.        
    - tBodyAcc-mean()-X
    - tBodyAcc-mean()-Y
    - tBodyAcc-mean()-Z
    - tBodyAcc-std()-X
    - tBodyAcc-std()-Y
    - tBodyAcc-std()-Z
    - tGravityAcc-mean()-X
    - tGravityAcc-mean()-Y
    - tGravityAcc-mean()-Z
    - tGravityAcc-std()-X
    - tGravityAcc-std()-Y
    - tGravityAcc-std()-Z
    - tBodyAccJerk-mean()-X
    - tBodyAccJerk-mean()-Y
    - tBodyAccJerk-mean()-Z
    - tBodyAccJerk-std()-X
    - tBodyAccJerk-std()-Y
    - tBodyAccJerk-std()-Z
    - tBodyGyro-mean()-X
    - tBodyGyro-mean()-Y
    - tBodyGyro-mean()-Z
    - tBodyGyro-std()-X
    - tBodyGyro-std()-Y
    - tBodyGyro-std()-Z
    - tBodyGyroJerk-mean()-X
    - tBodyGyroJerk-mean()-Y
    - tBodyGyroJerk-mean()-Z
    - tBodyGyroJerk-std()-X
    - tBodyGyroJerk-std()-Y
    - tBodyGyroJerk-std()-Z
    - tBodyAccMag-mean()
    - tBodyAccMag-std()
    - tGravityAccMag-mean()
    - tGravityAccMag-std()
    - tBodyAccJerkMag-mean()
    - tBodyAccJerkMag-std()
    - tBodyGyroMag-mean()
    - tBodyGyroMag-std()
    - tBodyGyroJerkMag-mean()
    - tBodyGyroJerkMag-std()
    - fBodyAcc-mean()-X
    - fBodyAcc-mean()-Y
    - fBodyAcc-mean()-Z
    - fBodyAcc-std()-X
    - fBodyAcc-std()-Y
    - fBodyAcc-std()-Z
    - fBodyAcc-meanFreq()-X
    - fBodyAcc-meanFreq()-Y
    - fBodyAcc-meanFreq()-Z
    - fBodyAccJerk-mean()-X
    - fBodyAccJerk-mean()-Y
    - fBodyAccJerk-mean()-Z
    - fBodyAccJerk-std()-X
    - fBodyAccJerk-std()-Y
    - fBodyAccJerk-std()-Z
    - fBodyAccJerk-meanFreq()-X
    - fBodyAccJerk-meanFreq()-Y
    - fBodyAccJerk-meanFreq()-Z
    - fBodyGyro-mean()-X
    - fBodyGyro-mean()-Y
    - fBodyGyro-mean()-Z
    - fBodyGyro-std()-X
    - fBodyGyro-std()-Y
    - fBodyGyro-std()-Z
    - fBodyGyro-meanFreq()-X
    - fBodyGyro-meanFreq()-Y
    - fBodyGyro-meanFreq()-Z
    - fBodyAccMag-mean()
    - fBodyAccMag-std()
    - fBodyAccMag-meanFreq()
    - fBodyBodyAccJerkMag-mean()
    - fBodyBodyAccJerkMag-std()
    - fBodyBodyAccJerkMag-meanFreq()
    - fBodyBodyGyroMag-mean()
    - fBodyBodyGyroMag-std()
    - fBodyBodyGyroMag-meanFreq()
    - fBodyBodyGyroJerkMag-mean()
    - fBodyBodyGyroJerkMag-std()
    - fBodyBodyGyroJerkMag-meanFreq()