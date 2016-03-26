# This analysis will download the data required for Coursera's Getting and Cleaning
# Data course project.

# The following analysis will perform the following actions
# 1. Download and unzip the source data, if it doesn't already exist
# 2. Call the relevant files into data frames
# 3. Merge all relevant data from the test and train sources
# 4. Subset the data to only include mean and std measures
# 5. Include proper titles and descriptions for measures
# 6. Export a historical csv, UCI_HAR_meanstd_summary.csv, were the source data is summarized
#       by subject, activity_name and a average of all the mean and std measures
#       subset in step #4
# 7. The unzipped file will be cleaned after completion
#
# The source zip file "UCI HAR Dataset.zip" is 61,091 KB.
# The output file, "UCI_HAR_meanstd_summary.csv", is 218 KB.
# 
# Runtimes
# Download time: varies based on internet connection (61 MB)
# Unzip time:    ~10 seconds elapsed, 6 seconds user
# Analysis:      ~21 seconds elapsed, 21 seconds user
# TOTAL:         ~31 seconds elapsed + download time

# Download the required source data if it doesn't exist and unzip the contents in
# the working directory
if (!file.exists("UCI HAR Dataset.zip"))
{
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl,destfile = "UCI HAR Dataset.zip")
}

if (!dir.exists("UCI HAR Dataset"))
{
        unzip("UCI HAR Dataset.zip")
}

# Read in the required files from the analysis
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")   #2 col/6 row
features <- read.table("./UCI HAR Dataset/features.txt")                 #2 col/561 row

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")                #561 col/2947 row
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")                #1 col/2947 row
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")    #1 col/2947 row

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")             #561 col/7352 row
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")             #1 col/7352 row
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") #1 col/7352 row

# Note: I ignored the base data in the "Inertial Signals" folders as the "X_*" files
# appear to be calculated from the files within these folders.


## Merge the training and the test sets to create one data set.

# Use cbind to append the following information to the "X_*" test|train files
# 1) an indicator showing "Test|Train"
# 2) an integer denoting the activity Activity
# 3) the integer denoting the subject
# The column names are then set to allow the rbind
X_test1 <- cbind(X_test,"Test",y_test,subject_test)
colnames(X_test1)[562:564] <- c("Type","Activity","Subject")

X_train1 <- cbind(X_train,"Train",y_train,subject_train)
colnames(X_train1)[562:564] <- c("Type","Activity","Subject")

# UNION the test and train sets of data
X_subset <- rbind(X_test1,X_train1)


## Extracts only the measurements on the mean and standard deviation for each 
## measurement

# Extract only features that include "mean" and "std"
meanstd <- grep("*mean\\(\\)|std\\(\\)*",features$V2)
meanstd <- c(meanstd,562,563,564)

# subset the data by the subset of features
X_meanstd <- X_subset[meanstd]


## Appropriately labels the data set with descriptive variable names.

# Extract only features that include "mean" and "std", pulling the names
meanstdname <- grep("*mean\\(\\)|std\\(\\)*",features$V2, value = TRUE)
meanstdnameall <- c(meanstdname,"Type","Activity","Subject")

# Update the names on the working dataset
colnames(X_meanstd) <- meanstdnameall


## Uses descriptive activity names to name the activities in the data set

# Join the working dataset to the activity_labels to pull proper names 
X_meanstd2 <- merge(X_meanstd,activity_labels,by.x = "Activity",by.y = "V1")
colnames(X_meanstd2)[70] <- c("Activity_Name")


## From the data set in step 4, creates a second, independent tidy data set with
## the average of each variable for each activity and each subject.

library(reshape2)
library(plyr)
library(Hmisc)

# The following steps summarize the data by taking the mean of all the variables
# grouping them on Subject and Activity
# NOTE: I excluded the Activity_Name to make the data as tidy as possible
X_summary_wide <- ddply(X_meanstd2, c("Subject","Activity"), 
                        numcolwise(mean))
X_summary_wide$Activity_Name <- NULL

write.csv(X_summary_wide,file = "UCI_HAR_meanstd_summary.csv", row.names = FALSE)


# Finally I deleted the unzipped file to leave the working directory as clean as possible
unlink("UCI HAR Dataset", recursive = TRUE)


# THIS IS EXTRANIOUS CODE THAT EXPLORED CREEATING A TRANSACTIONAL FILE
# THIS METHOD WAS ABONDONED AS THE DEFITION OF TIDY REQUIRES EACH 
# VARIABLE FORMS A COLUMN AND THIS ATTEMPTED TO CREATE ONE COLUMN
# FOR ALL VARIABLES, WITH AN ADDITIONAL COLUMN FOR THE VARIABLE DESCRIPTION
# THE FILE OUTPUT WAS ALSO THREE TIMES LARGER
# THE CODE WAS COMMENTED OUT BUT SAVED IN CASE FUTURE ANALYSIS WOULD
# REQUIRE AVERAGING ACROSS ALL VARIABLES

# X_melt <- melt(X_meanstd2,id=(c("Subject","Activity_Name")),
#                 measure.vars = c(meanstdname))
# colnames(X_melt)[3] <- c("Variable")
# colnames(X_melt)[4] <- c("Value")
# X_summary <- ddply(X_melt, c("Subject","Activity_Name","Variable"), 
#                         summarise, Value_mean = mean(Value))
# write.csv(X_summary,file = "tidylong.csv", row.names = FALSE)


