library(dplyr)

fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists("./wearables")) { dir.create("./wearables") ; print("new directory created") }

download.file(fileURL,"./wearables/file.zip")

unzip("./wearables/file.zip", overwrite=TRUE, exdir="./wearables")

setwd("./wearables/UCI HAR dataset")

x_test<-read.table("./test/X_test.txt", sep="", colClasses="numeric")
y_test<-read.table("./test/y_test.txt", sep="", colClasses="numeric")
x_train<-read.table("./train/X_train.txt", sep="", colClasses="numeric")
y_train<-read.table("./train/y_train.txt", sep="", colClasses="numeric")

  ##  Replace activity numbers with descriptors in y_test and x_test
y_test[y_test==1]<-"WALKING";
  y_test[y_test==2]<-"WALKING_UPSTAIRS";
  y_test[y_test==3]<-"WALKING_DOWNSTAIRS";
  y_test[y_test==4]<-"SITTING";
  y_test[y_test==5]<-"STANDING";
  y_test[y_test==6]<-"LAYING"

y_train[y_train==1]<-"WALKING";
  y_train[y_train==2]<-"WALKING_UPSTAIRS";
  y_train[y_train==3]<-"WALKING_DOWNSTAIRS";
  y_train[y_train==4]<-"SITTING";
  y_train[y_train==5]<-"STANDING";
  y_train[y_train==6]<-"LAYING"

colnames(y_test)<-"ACTIVITY"
colnames(y_train)<-"ACTIVITY"

  ## Read in column names from 'features' file and apply to datasets
features<-read.table("./features.txt")
fvector<-features[,2]
fvector<-as.vector(fvector)

colnames(x_test)<-fvector
colnames(x_train)<-fvector

  ## Read in subject identifiers (1-30) from .txt files and append to datasets
subject_test<-read.table("./test/subject_test.txt")
colnames(subject_test)<-"ID"

subject_train<-read.table("./train/subject_train.txt")
colnames(subject_train)<-"ID"

y_test2<-cbind(subject_test,y_test)
y_train2<-cbind(subject_train,y_train)

rm("subject_test","subject_train", "y_test","y_train")

  ## Merge datasets y_test and x_test, y_train and x_train, putting 
  ## activity names in first column, and remove redundant data frames
test <- cbind(y_test2,x_test)
train <- cbind(y_train2,x_train)
rm("x_test","x_train", "y_test2", "y_train2")

  ## Merge 'test' and 'train' datasets
combo <- rbind(test,train)

  ## Select columns which are  measurements of mean() or std() and coerce into a new table
split1<-combo[grep("mean()",names(combo),fixed=TRUE)] 
split2<-combo[grep("std()",names(combo),fixed=TRUE)]
split3<-combo[grep("ID|ACTIVITY",names(combo))]
table<-cbind(split3,split1,split2)

rm("split1","split2","split3")

write.csv(table, file=file.choose(), na="NA", quote=TRUE, row.names=FALSE) 
