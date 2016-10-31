---
title: "README.md"
author: "Jessica Maryott"
date: "October 30, 2016"
output: html_document
---

## Coursera Data Cleaning Course: Week 4 Project

This repo contains 4 files:
README.md - the current README files - contains the explanation of the repo
CodeBook.md - contains a list of the variables created
run_analysis.R - contains the code that does the analysis required in the assignment
tidyMeanData.txt - the output of the file run_analysis.R, a cleaned version of the data found at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. This data can be read back into R with the following command: read.table("tidyMeanData.txt", header=TRUE)

### run_analysis.R
This code assumes that the user has downloaded the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzipped it and has the working directory set to the top level folder of the unzipped file, UCI HAR Dataset

This file accomplishes the 5 steps required of the assignment:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

These steps are not accomplished in order, because I found it easier and it required less code to accomplish those steps in a different order. The code that accomplishes each step is commented to indicate which of the steps above it accomplishes so that the reader does not have to guess.

The final output has one row per unique subject/activity combination, as requested in Step 5 above. The data for each of those rows is the average of all rows in the original dataset for that subject/activity combination. Thus, my output has 180 rows (30 subjects x 6 activities). There was no missing data: each subject performed each activity.

This data is tidy, as it lists each variable (including subject and activity) as a separate column and each observation (in this case the average of the mean/std feature in the original dataset) as a separate row (see http://vita.had.co.nz/papers/tidy-data.pdf, page 4 for this definition of tidy data).

For step 2 above, the code extracts all columns that contain the strings mean(), std(), or meanfreq() (after converting the columns names to lower case to avoid mismatches based on case), but leaves out the ones for angle (though these include the word mean, they are actually angle measurements according to the original authors in features_info.txt). The resulting 79 columns are those that are included in the final dataset.