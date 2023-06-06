##Downloading and unzipping the dataset was done outside of R
library(dplyr)
library(magrittr)
##Setting working directory
setwd("C:/Users/jonas/Desktop/UKE/Forschung/PhD Programm/Cousera/Data Science Johns Hopkins/Getting and Cleaning Data/Week 4 Assignment")

##1. Merging the training and the test sets to create one data set.

##Read in the data
##Train
xtrain<-read.table('./UCI HAR Dataset/train/X_train.txt', header=FALSE)
ytrain<-read.table('./UCI HAR Dataset/train/y_train.txt', header=FALSE)
##Test
xtest<-read.table('./UCI HAR Dataset/test/X_test.txt', header=FALSE)
ytest<-read.table('./UCI HAR Dataset/test/y_test.txt', header=FALSE)
##Features
features<-read.table('./UCI HAR Dataset/features.txt', header=FALSE)
##Activity
activity<-read.table('./UCI HAR Dataset/activity_labels.txt', header=FALSE)
##Subject train
subtrain<-read.table('./UCI HAR Dataset/train/subject_train.txt', header=FALSE)
subtrain<-subtrain%>%
  rename(subjectID=V1)
##Subject test
subtest<-read.table('./UCI HAR Dataset/test/subject_test.txt', header=FALSE)
subtest<-subtest%>%
  rename(subjectID=V1)

##adding names to the columns of both train and test dataset
features<-features[,2]
featrasp<-t(features)
colnames(xtrain)<-featrasp
colnames(xtest)<-featrasp

##renaming activity columns to id and actions(walk,lay,etc.)
colnames(activity)<-c('id','actions')

##row binding xtrain and xtest 
Xcomb<-rbind(xtrain, xtest)
##row binding ytrain and ytest
Ycomb<-rbind(ytrain, ytest)
##row binding subject train and subject test
combineSubj<-rbind(subtrain,subtest)

##column binding Y and X  
YXdf<-cbind(Ycomb,Xcomb, combineSubj)

##merging the data frame with the activity
df<-merge(YXdf, activity,by.x = 'V1',by.y = 'id')

##2 Extracts only the measurements on the mean and standard deviation for each measurement. 
colNames<-colnames(df)
df2<-df%>%
  select(actions, subjectID, grep("\\bmean\\b|\\bstd\\b",colNames))

##3 Uses descriptive activity names to name the activities in the data set
# see above

# transform activity to a factor variable 
df2$actions<-as.factor(df2$actions)

#4 Appropriately labels the data set with descriptive variable names. 
colnames(df2)<-gsub("^t", "time", colnames(df2))
colnames(df2)<-gsub("^f", "frequency", colnames(df2))
colnames(df2)<-gsub("Acc", "Accelerometer", colnames(df2))
colnames(df2)<-gsub("Gyro", "Gyroscope", colnames(df2))
colnames(df2)<-gsub("Mag", "Magnitude", colnames(df2))
colnames(df2)<-gsub("BodyBody", "Body", colnames(df2))

#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
df2.2<-aggregate(. ~subjectID + actions, df2, mean)

# text file for final output
write.table(df2.2, file = "tidydata.txt",row.name=FALSE)