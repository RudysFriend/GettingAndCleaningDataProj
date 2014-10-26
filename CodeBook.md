The original instructions pertaining to the source of the data and what is intended to be done to the data is as follows:
The source data can be found at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
(End of instructions)

The details for the input  data is described by the *.txt files found in the "./data/UCI HAR Dataset" directory. These contain the orginal descriptions and are a bit difficult to tie back to the raw data. For the purposes of this project you only need to understand the six files found under the "./data/UCI HAR Dataset/train" and "./data/UCI HAR Dataset/test" directories. The download date for the data contained in this repository was October 25, 2014.

The data found in the "train" and "test" directories were part of an original single set of data that was split apart at some point in time.

Each set of three files found in the "test" and "train" directories have the same number of rows and each row coincides with the rows in the other files found in that same directory. Once all three files in each directory are merged by columns the two resulting datasets can be mreged to form one dataset on which the desired work will be performed.

The run_analysis.R script will read the data required for the assignment while filtering out the unwanted columns. People who particiapted in the expereiments are identified by the Subject_ID field. Their actions, or activities, are identified by the Activity_ID field. There were 30 subjects who participated and they performed six activities.

The results of run_analysis.R will calculate mean for each of the six activitites for six unique measurments. The measurements are identified by the columns found in the data: tBodyAcc-mean-X,tBodyAcc-mean-Y,tBodyAcc-mean-Z,tBodyAcc-std-X,tBodyAcc-std-Y,tBodyAcc-std-Z


