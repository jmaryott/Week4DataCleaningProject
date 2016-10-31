# This code assumes that the user has downloaded the data from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# and unzipped it and has the working directory set to the top level folder of the unzipped file, 
# UCI HAR Dataset

# Because it is easy to lose which rows match across the 6 files that contain the data of interest
# (X_train.txt, y_train.txt, subject_train.txt, X_test.txt, y_test.txt, subject_test.txt, )
# I chose to bind these all together first thing. This makes it harder to lose which rows in each
# file go together

# First read in each of the six data files
trainingX <- read.table("train\\X_train.txt")
testX <- read.table("test\\X_test.txt")
trainingY <- read.table("train\\y_train.txt", col.names = "ActivityNumber")
testY <- read.table("test\\y_test.txt", col.names = "ActivityNumber")
subjectsTraining <- read.table("train\\subject_train.txt", col.names = "subjectNumber")
subjectsTest <- read.table("test\\subject_test.txt", col.names = "subjectNumber")

# Then, bind each set of 2 data sets (train and test) together in the same order
allX<-rbind(trainingX, testX)
allY<-rbind(trainingY, testY)
allSubjects<-rbind(subjectsTraining, subjectsTest)

# Before binding the three data sets above, remove from allX the non-mean/std values. At the same
# time, make sure to label the columns left over from the file of feature names.

# Assignment step 2: Extract only the measurements on the mean and standard deviation for each 
# measurement.
# Loads the list of variable names (called features) as a dataframe.
featureList<-read.table("features.txt")
# Since this list will be used to label the columns in the dataframe representing the actual data, 
# this needs to be converted to a single dimensional factor vector.
featureNames<-featureList[[2]]
# First, move everything to lower case so that there aren't multiple matches (ie Mean, mean, MEAN)
featureNames<-tolower(featureNames)
# Find the column numbers associated with features that contain the words mean or std
# I chose to include both mean()/std() and meanFreq(), but left out the ones for angle (though
# these include the word mean, they are actually angle measurements)
# Note: Since ( and ) are reserved characters, you ened to escape them (and a \\ is needed since 
# \ is a reserved character too)
columnsWithMeanOrStd<-grep(pattern="*mean\\(\\)*|*std\\(\\)*|*meanfreq\\(\\)*", x = featureNames)
# Then, use these numbers to pull those columns out of the dataset
meansAndStds<-allX[columnsWithMeanOrStd]

# Assignment step 4: Appropriately label the data set with descriptive variable names. 
# I chose to put in the column labels before adding the y and subject values to make combining the x and y 
# labels easier. This should have no effect on the final output.

# Add the list of just the column names for the means and std that were taken out of the datase
# as the column names of meansAndStds (the data for the aggregate means and stds)
names(meansAndStds)<-featureNames[columnsWithMeanOrStd]

# Assignment step 1: Merge the training and the test sets to create one data set.
# Then, bind each of the 3 sets of data (for which we have ensured that the rows are in the same
# order) together. 
# Note: Four files (y and subject versions for test and training) contain factor data, so make sure
# that factor information makes it into the final data frame.
# Note: allY contains both the number and the name of the activity. I will use just the name, per
# bullet #3 in the assignment.
# cbind also allows you add column names, so add names for subject and activity. The variables
# in meansAndStds are already named (in the steps above)
meansAndStds<-cbind(subject=as.factor(allSubjects[[1]]), activity=allY[[1]], meansAndStds)

# Assignment step 3: Use descriptive activity names to name the activities in the data set
# This data lives in a combination of activity_labels.txt (lookup table for the number to activity
# mapping) and y_train/y_test (the activity numbers for each row in the x data)

# Read in the lookup table, so that it can be used to match the activity names and numbers
activitiesLookup <- read.table("activity_labels.txt", col.names = c("ActivityNumber", 
                                                                    "ActivityName"))
# Convert the numbers to their descriptive text equivalents
# Note: Since merge automatically sorts the output (even if sort is = FALSE, which just changes
# what it sorts on), this step must be done after the data from subject, y and x are already bound.
meansAndStds<-merge(activitiesLookup, meansAndStds, by.x="ActivityNumber", by.y = "activity", 
                    sort=FALSE)

# Assignment step 5: Create an independent tidy data set with the average of each variable for 
# each activity and each subject.

# To get the average for each variable for a specific combination of activity and subject, 
# collapse across unqiue combinations of those 2 variables. The output is thus one row per
# subject/activity conbination, with the average for each of the mean/std variables in the 
# original dataset.
# Note: From everything I could read on this assignment, this step is not clearly worded and 
# can be interpreted either this way or skipping the final step of collapsing the data. See
# https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
# as linked by the course TA. I chose to collapse the data to include only a single average 
# for each subject/activity combination.
# To do this, first subset the data by each unique combination of subject/activity.
# This uses the dplyr library because it is much easier to use and its output is much cleaner than
# native R functions
library(dplyr)
# Get the mean for each column, when grouped by both subject and activity
averageTidyMeansStds<-meansAndStds %>%   group_by(subject, ActivityName)   %>%   summarise_each(funs(mean))

# Output the tidy data into a text file
write.table(x=averageTidyMeansStds, file = "tidyMeanData.txt", row.names = FALSE)
