
#Coursera Project: Human Activity Recognition Using Smartphones Dataset


* The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
* Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
on the waist. 
* Raw data containing testing and training sets was downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* An R script called run_analysis.R merges train and test datasets and processes this raw data to produce 2 output data files: output.tidy.dataset1.txt, output.tidy.dataset2.txt

##First output dataset: output.tidy.dataset1.txt
R script run_analysis.R  transforms raw dataset downloaded in the following manner:
* Subset the merged data by choosing only feature variables used to measure mean and std
* The result is 10299 obs of 81 variables (subject, activity, 79 selected features for mean and std)

##Second output dataset: output.tidy.dataset2.txt
* Based on first output dataset R script run_analysis.R creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* The result is 180 obs of 81 variables (Average of all 79 selected variables grouped by subject and activity)


##For each record it is provided

* An identifier of the subject who carried out the experiment.
* Its activity description
* subset of 79 variables (from 561-feature vector with time and frequency domain) measuring mean and std


##The dataset includes the following files:

* README.md
* CodeBook.md
* output.tidy.dataset1.txt - 10299 obs of 81 variables (subject, activity, 79 selected features for mean and std)
* output.tidy.dataset2.txt - 180 obs of 81 variables (Average of all 79 selected variables grouped by subject and activity)

For more information about this dataset read CodeBook.md

