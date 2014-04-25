
setwd("E:/Coursera/Getting and Cleaning Data/Project/UCI HAR Dataset")

# Reading Training Data

featureTrain<-read.table("./train/X_train.txt")
labelTrain<-read.table("./train/y_train.txt")
subjectTrain<-read.table("./train/subject_train.txt")

#Reading Test Data
featureTest<-read.table("./test/X_test.txt")
labelTest<-read.table("./test/y_test.txt")
subjectTest<-read.table("./test/subject_test.txt")

#Naming Datasets
featureNames<-read.table("features.txt")
colnames(featureTrain)=featureNames[,2]
colnames(featureTest)=featureNames[,2]

colnames(labelTrain)=c("ActivityLabel")
colnames(labelTest)=c("ActivityLabel")

colnames(subjectTrain)=c("Subject")
colnames(subjectTest)=c("Subject")

#Binding the Data Frames
train<-cbind(subjectTrain,featureTrain,labelTrain)
test<-cbind(subjectTest,featureTest, labelTest)

#Merging the Data Frames
master<-rbind(train,test)

#Cleaning the variable names
names(master)<-tolower(names(master))
names(master)<-gsub("-","",names(master))
names(master)<-gsub("_","",names(master))

#Selecting Mean and Standard Deviation of Variables
master2<-master[,colnames(master) %in% grep("mean\\()|std\\()|activitylabel|subject",names(master),value=T)]

#Labeling the Activities
activities<-read.table("activity_labels.txt")
names(activities)=c("activitylabel","activitydescription")
master3=merge(master2,activities)

#Using Descriptive Names for Activities
names(master3)<-gsub("^t","time",names(master3))
names(master3)<-gsub("^f","frequency",names(master3))
names(master3)<-gsub("mag","magnitude",names(master3))
names(master3)<-gsub("\\()","",names(master3))

#Creating independent tidy dataset 
library(reshape2)
meltData=melt(master3, id=c("subject","activitydescription"))
tidyData=dcast(meltData,subject+activitydescription~variable,mean)

#Saving the file
write.csv("tidyData.csv")
