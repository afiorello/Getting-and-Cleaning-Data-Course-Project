#Checks for a data directory and creates it if not exist.
if(!file.exists("pzip")){
    dir.create("pzip")
}
#Downloads file project.zip from the coursera project web site.
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="project.zip",method="curl")
unzip(zipfile="project.zip",exdir="./pzip")
#sets the working directory
setwd("pzip/UCI HAR Dataset")
#reads data tables test
TestSubject<-read.table("./test/subject_test.txt")
TestX<-read.table("./test/X_test.txt")
TestY<-read.table("./test/Y_test.txt")
#reads data tables traing
TrainSubject<-read.table("./train/subject_train.txt")
TrainX<-read.table("./train/X_train.txt")
TrainY<-read.table("./train/Y_train.txt")

#Merges Subject tables
TSubject <- rbind(TestSubject, TrainSubject)
#Merges Features tables
TX<- rbind(TestX, TrainX)
#Merges Activity tables
TY<- rbind(TestY, TrainY)

#Names columns in TSubject, TX, TY and prepares names for dataset with only 
#the measurements of the mean and standard deviation for each measurement.
names(TSubject)<-c("Subject")
names(TY)<- c("Activity")
TXNames <- read.table(("features.txt"))
names(TX)<- TXNames$V2
MSNames<-TXNames$V2[grep("*mean*|*std*",TXNames$V2)]
TYNames<-read.table(("activity_labels.txt"))

#1. Merges the training and the test sets to create one data set.
AllDatax <- cbind(TSubject, TY)
AllData <- cbind(TX, AllDatax)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
OnlyDataMS<-subset(AllData,select=as.character(MSNames))

#Create names for dataset with only the measurements on the mean and standard
#deviation for each measurement and Subject and Activity
FSNames<-factor(names(TSubject))
FYNames<-factor(names(TY))
SetNames<-c(as.character(MSNames),as.character(FSNames),as.character(FYNames))
#Create Dataset with with only the measurements on the mean and standard
#deviation for each measurement and Subject and Activity
OnlyDataSet<-subset(AllData,select=as.character(SetNames))

#3.Uses descriptive activity names to name the activities in the data set
OnlyDataSet$Activity<-sapply(OnlyDataSet$Activity,function(x){
    as.character(TYNames[x,2])
})
#4.Appropriately labels the data set with descriptive variable names. 
names(OnlyDataSet)<-gsub("Acc", "Accelerometer", names(OnlyDataSet))
names(OnlyDataSet)<-gsub("Gyro", "Gyroscope", names(OnlyDataSet))
names(OnlyDataSet)<-gsub("Mag", "Magnitude", names(OnlyDataSet))
names(OnlyDataSet)<-gsub("BodyBody", "Body", names(OnlyDataSet))
names(OnlyDataSet)<-gsub("^t", "Time", names(OnlyDataSet))
names(OnlyDataSet)<-gsub("^f", "Frequency", names(OnlyDataSet))

#5.From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.
result <- aggregate(OnlyDataSet[, 1:(ncol(OnlyDataSet)-2)],
                  by=list(Subject = OnlyDataSet$Subject, 
                          Activity = OnlyDataSet$Activity),
                  mean)
write.table(result,"result.txt",row.name=FALSE)