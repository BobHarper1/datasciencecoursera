# Codebook
## Variables

**subject**: number identifying the participating subject. Range 1:30  

**activity**: activity undertaken by subject, as follows:  
* sitting
* standing
* walking
* upstairs
* downstairs
* laying

## Signals
The time domain signals (denoted 't' for time) selected for this dataset originate from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. The acceleration signal has been separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ).  

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).  

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).  

The mean and standard deviations of these processed signals are included in the dataset.   

**tbodyacc-mean-x  
tbodyacc-mean-y  
tbodyacc-mean-z  
tbodyacc-std-x  
tbodyacc-std-y  
tbodyacc-std-z  
tgravityacc-mean-x  
tgravityacc-mean-y  
tgravityacc-mean-z  
tgravityacc-std-x  
tgravityacc-std-y  
tgravityacc-std-z  
tbodyaccjerk-mean-x  
tbodyaccjerk-mean-y  
tbodyaccjerk-mean-z  
tbodyaccjerk-std-x  
tbodyaccjerk-std-y  
tbodyaccjerk-std-z  
tbodygyro-mean-x  
tbodygyro-mean-y  
tbodygyro-mean-z  
tbodygyro-std-x  
tbodygyro-std-y  
tbodygyro-std-z  
tbodygyrojerk-mean-x   
tbodygyrojerk-mean-y   
tbodygyrojerk-mean-z   
tbodygyrojerk-std-x   
tbodygyrojerk-std-y   
tbodygyrojerk-std-z    
tbodyaccmag-mean   
tbodyaccmag-std   
tgravityaccmag-mean  
tgravityaccmag-std  
tbodyaccjerkmag-mean  
tbodyaccjerkmag-std  
tbodygyromag-mean  
tbodygyromag-std  
tbodygyrojerkmag-mean  
tbodygyrojerkmag-std  
fbodyacc-mean-x  
fbodyacc-mean-y  
fbodyacc-mean-z  
fbodyacc-std-x  
fbodyacc-std-y  
fbodyacc-std-z  
fbodyaccjerk-mean-x  
fbodyaccjerk-mean-y  
fbodyaccjerk-mean-z  
fbodyaccjerk-std-x  
fbodyaccjerk-std-y  
fbodyaccjerk-std-z  
fbodygyro-mean-x  
fbodygyro-mean-y  
fbodygyro-mean-z  
fbodygyro-std-x  
fbodygyro-std-y  
fbodygyro-std-z  
fbodyaccmag-mean  
fbodyaccmag-std  
fbodybodyaccjerkmag-mean  
fbodybodyaccjerkmag-std  
fbodybodygyromag-mean  
fbodybodygyromag-std  
fbodybodygyrojerkmag-mean  
fbodybodygyrojerkmag-std**
