# Data preperation for Coursera Getting and Cleaning Data course project


ASSUMPTION
=========================================================================================
1. There was little information about how the data would be used for analysis
        so I made the assumption to create the most "tidy" data possible following
        "Hadley Wickham's Tidy Data" that was referenced in the lectures
2. While I leaned toward creating a melted dataset where each variable was "stacked"
        in one column, I felt the variables were of multiple types
        and would violate section 3.4 of a single column for each type.
3. I elected to return the "Activity" and include the translation in this CodeBook
        instead of supplying the "Activity Name" in the output.  My rational was to
        create the smallest data set possible and to make use of the data dictionary
        found in teh section below.
4. The user must install the following libraries for the script to work
        (reshape2, plyr, Hmisc)


PROCESS
=========================================================================================
By running the "run_analysis.R" script, the following actions are executed:

        1. Download and unzip the source data, if the source data doesn't 
                already exist
        2. Call the relevant files into data frames
        3. Merge all relevant data from the test and train sources
        4. Subset the data to only include mean and std measures
        5. Include proper titles and descriptions for measures
        6. Export a wide tab delimited text file, UCI_HAR_meanstd_summary.txt,
                were the source data is summarized by subject, activity_name 
                and a average of all the mean and std measures subset in step #4
        7. The unzipped file will be cleaned after completion


OUTPUT
=========================================================================================
The source zip file "UCI HAR Dataset.zip" is 61,091 KB.
The output file, "UCI_HAR_meanstd_summary.txt", is 218 KB.


RUNTIMES
=========================================================================================
Download time: varies based on internet connection (61 MB)
Unzip time:    ~10 seconds elapsed, 6 seconds user
Analysis:      ~21 seconds elapsed, 21 seconds user
TOTAL:         ~31 seconds elapsed + download time


DATA DICTIONARY
=========================================================================================

Subject                         2
        This is the number assigned to each subject (1-30)

Activity                        1
        The activity observed
        1 .WALKING
        2 .WALKING_UPSTAIRS
        3 .WALKING_DOWNSTAIRS
        4 .SITTING
        5 .STANDING
        6 .LAYING        

LIST OF VARIABLES MEASURED 
Format:
        variable name, max length 
        description
        min/max value

tBodyAcc-mean()-X   		6
	Average of tBodyAcc-mean()-X provided in source data, grouped by Subject and Activity
	0.2216..0.3015
	
tBodyAcc-mean()-Y   		9
	Average of tBodyAcc-mean()-Y provided in source data, grouped by Subject and Activity
	-0.040514..-0.001308
	
tBodyAcc-mean()-Z   		8
	Average of tBodyAcc-mean()-Z provided in source data, grouped by Subject and Activity
	-0.15251..-0.07538
	
tBodyAcc-std()-X   		7
	Average of tBodyAcc-std()-X provided in source data, grouped by Subject and Activity
	-0.9961.. 0.6269
	
tBodyAcc-std()-Y   		8
	Average of tBodyAcc-std()-Y provided in source data, grouped by Subject and Activity
	-0.99024.. 0.61694
	
tBodyAcc-std()-Z   		7
	Average of tBodyAcc-std()-Z provided in source data, grouped by Subject and Activity
	-0.9877.. 0.6090
	
tGravityAcc-mean()-X   		7
	Average of tGravityAcc-mean()-X provided in source data, grouped by Subject and Activity
	-0.6800.. 0.9745
	
tGravityAcc-mean()-Y   		8
	Average of tGravityAcc-mean()-Y provided in source data, grouped by Subject and Activity
	-0.47989.. 0.95659
	
tGravityAcc-mean()-Z   		8
	Average of tGravityAcc-mean()-Z provided in source data, grouped by Subject and Activity
	-0.49509.. 0.95787
	
tGravityAcc-std()-X   		7
	Average of tGravityAcc-std()-X provided in source data, grouped by Subject and Activity
	-0.9968..-0.8296
	
tGravityAcc-std()-Y   		7
	Average of tGravityAcc-std()-Y provided in source data, grouped by Subject and Activity
	-0.9942..-0.6436
	
tGravityAcc-std()-Z   		7
	Average of tGravityAcc-std()-Z provided in source data, grouped by Subject and Activity
	-0.9910..-0.6102
	
tBodyAccJerk-mean()-X   	7
	Average of tBodyAccJerk-mean()-X provided in source data, grouped by Subject and Activity
	0.04269..0.13019
	
tBodyAccJerk-mean()-Y   	10
	Average of tBodyAccJerk-mean()-Y provided in source data, grouped by Subject and Activity
	-0.0386872.. 0.0568186
	
tBodyAccJerk-mean()-Z   	9
	Average of tBodyAccJerk-mean()-Z provided in source data, grouped by Subject and Activity
	-0.067458.. 0.038053
	
tBodyAccJerk-std()-X   		7
	Average of tBodyAccJerk-std()-X provided in source data, grouped by Subject and Activity
	-0.9946.. 0.5443
	
tBodyAccJerk-std()-Y   		7
	Average of tBodyAccJerk-std()-Y provided in source data, grouped by Subject and Activity
	-0.9895.. 0.3553
	
tBodyAccJerk-std()-Z   		8
	Average of tBodyAccJerk-std()-Z provided in source data, grouped by Subject and Activity
	-0.99329.. 0.03102
	
tBodyGyro-mean()-X   		8
	Average of tBodyGyro-mean()-X provided in source data, grouped by Subject and Activity
	-0.20578.. 0.19270
	
tBodyGyro-mean()-Y   		8
	Average of tBodyGyro-mean()-Y provided in source data, grouped by Subject and Activity
	-0.20421.. 0.02747
	
tBodyGyro-mean()-Z   		8
	Average of tBodyGyro-mean()-Z provided in source data, grouped by Subject and Activity
	-0.07245.. 0.17910
	
tBodyGyro-std()-X   		7
	Average of tBodyGyro-std()-X provided in source data, grouped by Subject and Activity
	-0.9943.. 0.2677
	
tBodyGyro-std()-Y   		7
	Average of tBodyGyro-std()-Y provided in source data, grouped by Subject and Activity
	-0.9942.. 0.4765
	
tBodyGyro-std()-Z   		7
	Average of tBodyGyro-std()-Z provided in source data, grouped by Subject and Activity
	-0.9855.. 0.5649
	
tBodyGyroJerk-mean()-X   	8
	Average of tBodyGyroJerk-mean()-X provided in source data, grouped by Subject and Activity
	-0.15721..-0.02209
	
tBodyGyroJerk-mean()-Y   	8
	Average of tBodyGyroJerk-mean()-Y provided in source data, grouped by Subject and Activity
	-0.07681..-0.01320
	
tBodyGyroJerk-mean()-Z   	9
	Average of tBodyGyroJerk-mean()-Z provided in source data, grouped by Subject and Activity
	-0.092500..-0.006941
	
tBodyGyroJerk-std()-X   	7
	Average of tBodyGyroJerk-std()-X provided in source data, grouped by Subject and Activity
	-0.9965.. 0.1791
	
tBodyGyroJerk-std()-Y   	7
	Average of tBodyGyroJerk-std()-Y provided in source data, grouped by Subject and Activity
	-0.9971.. 0.2959
	
tBodyGyroJerk-std()-Z   	7
	Average of tBodyGyroJerk-std()-Z provided in source data, grouped by Subject and Activity
	-0.9954.. 0.1932
	
tBodyAccMag-mean()   		7
	Average of tBodyAccMag-mean() provided in source data, grouped by Subject and Activity
	-0.9865.. 0.6446
	
tBodyAccMag-std()   		7
	Average of tBodyAccMag-std() provided in source data, grouped by Subject and Activity
	-0.9865.. 0.4284
	
tGravityAccMag-mean()   	7
	Average of tGravityAccMag-mean() provided in source data, grouped by Subject and Activity
	-0.9865.. 0.6446
	
tGravityAccMag-std()   		7
	Average of tGravityAccMag-std() provided in source data, grouped by Subject and Activity
	-0.9865.. 0.4284
	
tBodyAccJerkMag-mean()   	7
	Average of tBodyAccJerkMag-mean() provided in source data, grouped by Subject and Activity
	-0.9928.. 0.4345
	
tBodyAccJerkMag-std()   	7
	Average of tBodyAccJerkMag-std() provided in source data, grouped by Subject and Activity
	-0.9946.. 0.4506
	
tBodyGyroMag-mean()   		7
	Average of tBodyGyroMag-mean() provided in source data, grouped by Subject and Activity
	-0.9807.. 0.4180
	
tBodyGyroMag-std()   		7
	Average of tBodyGyroMag-std() provided in source data, grouped by Subject and Activity
	-0.9814.. 0.3000
	
tBodyGyroJerkMag-mean()   	8
	Average of tBodyGyroJerkMag-mean() provided in source data, grouped by Subject and Activity
	-0.99732.. 0.08758
	
tBodyGyroJerkMag-std()   	7
	Average of tBodyGyroJerkMag-std() provided in source data, grouped by Subject and Activity
	-0.9977.. 0.2502
	
fBodyAcc-mean()-X   		7
	Average of fBodyAcc-mean()-X provided in source data, grouped by Subject and Activity
	-0.9952.. 0.5370
	
fBodyAcc-mean()-Y   		8
	Average of fBodyAcc-mean()-Y provided in source data, grouped by Subject and Activity
	-0.98903.. 0.52419
	
fBodyAcc-mean()-Z   		7
	Average of fBodyAcc-mean()-Z provided in source data, grouped by Subject and Activity
	-0.9895.. 0.2807
	
fBodyAcc-std()-X   		7
	Average of fBodyAcc-std()-X provided in source data, grouped by Subject and Activity
	-0.9966.. 0.6585
	
fBodyAcc-std()-Y   		8
	Average of fBodyAcc-std()-Y provided in source data, grouped by Subject and Activity
	-0.99068.. 0.56019
	
fBodyAcc-std()-Z   		7
	Average of fBodyAcc-std()-Z provided in source data, grouped by Subject and Activity
	-0.9872.. 0.6871
	
fBodyAccJerk-mean()-X   	7
	Average of fBodyAccJerk-mean()-X provided in source data, grouped by Subject and Activity
	-0.9946.. 0.4743
	
fBodyAccJerk-mean()-Y   	7
	Average of fBodyAccJerk-mean()-Y provided in source data, grouped by Subject and Activity
	-0.9894.. 0.2767
	
fBodyAccJerk-mean()-Z   	7
	Average of fBodyAccJerk-mean()-Z provided in source data, grouped by Subject and Activity
	-0.9920.. 0.1578
	
fBodyAccJerk-std()-X   		7
	Average of fBodyAccJerk-std()-X provided in source data, grouped by Subject and Activity
	-0.9951.. 0.4768
	
fBodyAccJerk-std()-Y   		7
	Average of fBodyAccJerk-std()-Y provided in source data, grouped by Subject and Activity
	-0.9905.. 0.3498
	
fBodyAccJerk-std()-Z   		9
	Average of fBodyAccJerk-std()-Z provided in source data, grouped by Subject and Activity
	-0.993108..-0.006236
	
fBodyGyro-mean()-X   		7
	Average of fBodyGyro-mean()-X provided in source data, grouped by Subject and Activity
	-0.9931.. 0.4750
	
fBodyGyro-mean()-Y   		7
	Average of fBodyGyro-mean()-Y provided in source data, grouped by Subject and Activity
	-0.9940.. 0.3288
	
fBodyGyro-mean()-Z   		7
	Average of fBodyGyro-mean()-Z provided in source data, grouped by Subject and Activity
	-0.9860.. 0.4924
	
fBodyGyro-std()-X   		7
	Average of fBodyGyro-std()-X provided in source data, grouped by Subject and Activity
	-0.9947.. 0.1966
	
fBodyGyro-std()-Y   		7
	Average of fBodyGyro-std()-Y provided in source data, grouped by Subject and Activity
	-0.9944.. 0.6462
	
fBodyGyro-std()-Z   		7
	Average of fBodyGyro-std()-Z provided in source data, grouped by Subject and Activity
	-0.9867.. 0.5225
	
fBodyAccMag-mean()   		7
	Average of fBodyAccMag-mean() provided in source data, grouped by Subject and Activity
	-0.9868.. 0.5866
	
fBodyAccMag-std()   		7
	Average of fBodyAccMag-std() provided in source data, grouped by Subject and Activity
	-0.9876.. 0.1787
	
fBodyBodyAccJerkMag-mean()   	7
	Average of fBodyBodyAccJerkMag-mean() provided in source data, grouped by Subject and Activity
	-0.9940.. 0.5384
	
fBodyBodyAccJerkMag-std()   	7
	Average of fBodyBodyAccJerkMag-std() provided in source data, grouped by Subject and Activity
	-0.9944.. 0.3163
	
fBodyBodyGyroMag-mean()   	7
	Average of fBodyBodyGyroMag-mean() provided in source data, grouped by Subject and Activity
	-0.9865.. 0.2040
	
fBodyBodyGyroMag-std()   	7
	Average of fBodyBodyGyroMag-std() provided in source data, grouped by Subject and Activity
	-0.9815.. 0.2367
	
fBodyBodyGyroJerkMag-mean()   	7
	Average of fBodyBodyGyroJerkMag-mean() provided in source data, grouped by Subject and Activity
	-0.9976.. 0.1466
	
fBodyBodyGyroJerkMag-std()   	7
	Average of fBodyBodyGyroJerkMag-std() provided in source data, grouped by Subject and Activity
	-0.9976.. 0.2878
	


Notes and References:
========

The course project can be found at:
https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project

Hadley Wickham's Tidy Data
http://vita.had.co.nz/papers/tidy-data.pdf

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
