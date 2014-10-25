# run_analysis.R - main script for the Getting and Cleaning data course.
#
# Some debugging code is ccommented out. It was used to check row counts and various other things.
#
# Steps:
#	1. Retrieve the data from the remote server. (Manual)
#	2. Unzip the data into the "data" directory.  (Manual)
#	3. Merges the training and the test sets to create one data set.
#	4. Extracts only the measurements on the mean and standard deviation for each measurement. 
#	5. Uses descriptive activity names to name the activities in the data set
#	6. Appropriately labels the data set with descriptive variable names. 
#	7. From the data set in step 6, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#
# Read the data from the "train" Directory
#
# Read the Training subject IDs
fn_TrainingSubectIDs <- './data/UCI HAR Dataset/train/subject_train.txt'
ds_TrainingSubjects <- read.fwf(fn_TrainingSubectIDs , skip=0, widths=c(2), 
	col.names=c("Subject_ID"))

# Read the Activity IDs
fn_TrainingActivityIDs <- './data/UCI HAR Dataset/train/y_train.txt'
ds_TrainingActivities <- read.fwf(fn_TrainingActivityIDs , skip=0, widths=c(1), 
				col.names=c("Activity_ID"))
#head(ds_TrainingActivities )

fn_TrainingSampleSet <- './data/UCI HAR Dataset/train/X_train.txt'
ds_TrainingSampleSet <- read.fwf(fn_TrainingSampleSet, skip=0, widths=c(16,16,16,16,16,16), 
				col.names=c("tBodyAcc-mean-X","tBodyAcc-mean-Y","tBodyAcc-mean-Z",
						"tBodyAcc-std-X","tBodyAcc-std-Y","tBodyAcc-std-Z"))

#head(ds_TrainingSampleSet)
#nrow(ds_TrainingSampleSet)

# Combine ds_TrainingSubjects, ds_TrainingActivities, ds_TrainingSampleSet by column
ds_Training <- cbind(ds_TrainingSubjects,ds_TrainingActivities , ds_TrainingSampleSet)
#head(ds_Training )

# Read the data from the "test" Directory.
# Read the test subject IDs
fn_TestSubectIDs <- './data/UCI HAR Dataset/test/subject_test.txt'
ds_TestSubjects <- read.fwf(fn_TestSubectIDs , skip=0, widths=c(2), 
				col.names=c("Subject_ID"))
#head(ds_TestSubjects)

fn_TestActivityIDs <- './data/UCI HAR Dataset/test/y_test.txt'
ds_TestActivities <- read.fwf(fn_TestActivityIDs , skip=0, widths=c(1), 
				col.names=c("Activity_ID"))
#head(ds_TestActivities)

fn_TestSampleSet <- './data/UCI HAR Dataset/test/X_test.txt'
ds_TestSampleSet <- read.fwf(fn_TestSampleSet, skip=0, widths=c(16,16,16,16,16,16), 
				col.names=c("tBodyAcc-mean-X","tBodyAcc-mean-Y","tBodyAcc-mean-Z",
						"tBodyAcc-std-X","tBodyAcc-std-Y","tBodyAcc-std-Z"))
#head(ds_TestSampleSet )
# nrow(ds_TestSampleSet )

# Combine ds_TestSubjects, ds_TestActivities, ds_TestSampleSet by column
ds_Test <- cbind(ds_TestSubjects, ds_TestActivities,ds_TestSampleSet) 
#head(ds_Test)
#nrow(ds_Test)
ds_AllInputData <- rbind(ds_Training,ds_Test )

#head(ds_AllInputData)
#nrow(ds_AllInputData)

ds_Rollup <- aggregate(cbind(tBodyAcc.mean.X, tBodyAcc.mean.Y, tBodyAcc.mean.Z, tBodyAcc.std.X, tBodyAcc.std.Y, tBodyAcc.std.Z) ~  Subject_ID + Activity_ID, 
ds_AllInputData, mean)
#head(ds_Rollup)
# Sort this in a meanful order just for viewing purposes.
#
ds_FinalResults <- ds_Rollup[order(ds_Rollup$Subject_ID,ds_Rollup$Activity_ID ), ]
# head(ds_FinalResults, 40)

# Save the final results to disk.
write.table(ds_FinalResults, './data/ProjectTidyData.txt', row.names = FALSE)
