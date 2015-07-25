# datasciencecoursera
## Getting and Cleaning Data course project

The requirements of the project were to:
Create one R script called run_analysis.R that does the following:  
  1. Merges the training and the test sets to create one data set.  
  2. Extracts only the measurements on the mean and standard deviation for each measurement.   
  3. Uses descriptive activity names to name the activities in the data set.  
  4. Appropriately labels the data set with descriptive variable names.  
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

The data is sourced from UCI's Human Activity Recognition (HAR) Using Smartphones Dataset: [source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  

The script in this respository ['run_analysis.R'](/run_analysis.R) contains the code meeting the requirements of the [Course Project](https://class.coursera.org/getdata-030/human_grading/view/courses/975114/assessments/3/submissions) (though not necessarily in the order given above!) and generates a tidy data text file that meets the principles of:  
  1. Each variable forms a column.
  2. Each observation forms a row.
  3. Each type of observational unit forms a table.

There are 2 output files from the script: 
* 'merged_dataset.txt' (as in step 4); and,
* 'tidy_summary_dataset.txt' (the required output for the project).

The merged dataset brings together the disparate files in the UCI Human Activity Recognition (HAR) Dataset:
* x_test: test set
* y_test: test labels
* subject_test: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* x_train: training set
* y_train: training labels
* subject_train: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* activity_labels: these link the test and training labels to activity names (e.g. sitting, standing etc.)
* features: list of all the features. These are time and frequency domain signals from the 3-axial accelerometer and gyroscope.  
Cleaning is performed on these files to extract only the required information, render in lowercase and remove extraneous punctuation.

The script performs the following:  
  1. Downloads and unzips the original dataset from the server.
  2. Reads in the 'x_test', 'x_train', 'y_test', 'y_train' text files from the download. The test and training sets are respectively merged into *two* data.frames: i.e. 'x' for the data and 'y' for the labels.   
  3. Changes the label *numbers* in 'y' to the *activity* names.  
  4. Reads in 'features.txt' (the *variables*) and transforms these strings (in lowercase) to a vector to be applied to 'x', the *data*.  
  5. Reads in the subject identifiers (from 'subject_test' and 'subject_train' and combines them into a vector 'subjects', which is then combined to the respective activity labels from 'y', which is in turn combined with the data in 'x'.  The dataset therefore has the subject, the activity and the data.
  6. Identifies and removes the variables which are not the mean or standard deviation for each measurement (denoted in columns by "mean" and "std" respectively), and then removes the unnecessary punctuation '()' from the column headings. There are 66 of these variables.  
  7. Saves this version of the data as 'merged_dataset.txt'.  There are 10299 observations and 68 variables (including the subject and the activity).
  8. Calculates the mean of each variable summarised for each *activity* and each *subject* using the 'dplyr' package functions 'group_by' and 'summarise'. There are 30 subjects and 6 activities for each: therefore there are 180 observations for each of the 66 activity means (total dataset size 180x68).  
  9. Saves this final dataset as 'tidy_summary_data.txt'.

## Codebook
There is a codebook available for help in understanding the variables in the dataset. [Click here](https://github.com/BobHarper1/datasciencecoursera/blob/master/CODEBOOK.md).
