fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists("~/wearables")) { dir.create("~/wearables") ; print("new directory created") }

download.file(fileURL,"./wearables/file.zip")

## Start from here if you don't wish to download the original data (it's 60Mb)

unzip("~/wearables/file.zip", overwrite=TRUE, exdir="~/wearables")

setwd("~/wearables/UCI HAR dataset")

library(dplyr)

  ## 1. Merges the training and the test sets to create one data set (for x and y)
x_test<-read.table("test/X_test.txt", sep="", colClasses="numeric")
y_test<-read.table("test/y_test.txt", sep="", colClasses="numeric")
x_train<-read.table("train/X_train.txt", sep="", colClasses="numeric")
y_train<-read.table("train/y_train.txt", sep="", colClasses="numeric")
x<-rbind(x_test,x_train)
y<-rbind(y_test,y_train)

  ##  3. Uses descriptive activity names to name the activities in the data set
y[y==1]<-"WALKING";
  y[y==2]<-"WALKING_UPSTAIRS";
  y[y==3]<-"WALKING_DOWNSTAIRS";
  y[y==4]<-"SITTING";
  y[y==5]<-"STANDING";
  y[y==6]<-"LAYING"
colnames(y)<-"ACTIVITY"

  ## 4. Appropriately labels the data set with descriptive variable names. 
features<-read.table("features.txt")
fvector<-features[,2]
fvector<-as.vector(fvector)

colnames(x)<-fvector

  ## Read in subject identifiers (1-30) from .txt files and append to datasets (via y)
subject_test<-read.table("test/subject_test.txt")
  colnames(subject_test)<-"SUBJECT"

subject_train<-read.table("train/subject_train.txt")
  colnames(subject_train)<-"SUBJECT"

subjects<-rbind(subject_test,subject_train)
  y<-cbind(subjects,y)

combo<-cbind(y,x)

  ## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
split1 <- combo[grep("-mean\\(\\)|-std\\(\\)", names(combo))]
split2 <- combo[grep("SUBJECT|ACTIVITY",names(combo))]

merged_dataset <- cbind(split2,split1)
rm(split1,split2,y,x,subject_test,subject_train,subjects,features,combo,x_test,x_train,y_test,y_train)

write.table(merged_dataset, "merged_dataset.txt", row.names=FALSE)

 ## 5. From the data set in step 4, creates a second, independent tidy data set 
 ##    with the average of each variable for each activity and each subject.

summary_dataset<-tbl_df(merged_dataset) %>%
  group_by(SUBJECT,ACTIVITY) %>%
  summarise_each(funs(mean))

write.table(summary_dataset, "tidy_summary_dataset.txt", row.names=FALSE)
