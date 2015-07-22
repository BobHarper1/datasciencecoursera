# datasciencecoursera
## Getting and Cleaning Data course project

The requirements of the project were to:
Create one R script called run_analysis.R that does the following:  
  1. Merges the training and the test sets to create one data set.  
  2. Extracts only the measurements on the mean and standard deviation for each measurement.   
  3. Uses descriptive activity names to name the activities in the data set.  
  4. Appropriately labels the data set with descriptive variable names.  
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

The script in this respository 'run_analysis.R' contains the code meeting the requirements of the [Course Project](https://class.coursera.org/getdata-030/human_grading/view/courses/975114/assessments/3/submissions) though not necessarily in the order given above!

There are 2 output files from the script: 
* merged_dataset (as in step 4); and,
* tidy_summary_dataset (the required final output).

The merged dataset brings together the disparate files in the UCI Human Activity Recognition (HAR) Dataset:
* x_test: test set
* y_test: test labels
* subject_test: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* x_train: training set
* y_train: training labels
* subject_train: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* activity_labels: these link the test and training labels to activity names (e.g. sitting, standing etc.)
* features: list of all the features. These are time and frequency domain signals from the 3-axial accelerometer and gyroscope.

The script performs the following:  
  1. Reads in the x_test, x_train, y_test, y_train text files. The test and training sets are respectively merged into two datasets: x for the data and y for the labels.   
  2. Changes the label numbers in y to the activity names.  
  3. Reads in "features.txt" (the variables) and transforms these strings to a vector to be applied to x, the data.  
  4. Reads in the subject names and aligns these with the datasets, which are merged.  
  5. Identifies and removes the variables which are not the mean or standard deviation for each measurement (denoted in the    columns by "mean" and "std" respectively).  
  6. Saves this version of the data as merged_dataset.txt.  
  7. Summarises the the average of each variable for each activity and each subject using the dplyr package functions.  
  8. Saves this final dataset as tidy_summary_data.txt.  
