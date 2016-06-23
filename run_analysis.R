## Merges the training and test sets to create one data set

features_train <- read.table("train/X_train.txt")
activities_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

features_test <- read.table("test/X_test.txt")
activities_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

features_all <- rbind(features_train, features_test)
activities_all <- rbind(activities_train, activities_test)
subjects_all <- rbind(subject_train, subject_test)

features_names <- read.table("features.txt",head=FALSE)
names(features_all) <- features_names$V2
names(activities_all) <- "Activity"
names(subjects_all) <- "Subject"

combined <- cbind(subjects_all, activities_all, features_all)

## Extracts only the measurements on the mean and standard deviation for each
## measurement.

match <- grep("-(mean|std)\\(\\)", features_names$V2)
match_names <- as.character(features_names$V2[match])

combined2 <- cbind(subset(combined, select = c("Subject", "Activity")),
                   subset(combined, select = match_names))

## Uses descriptive activity names to name the activities in the data set

activities_names <- read.table("activity_labels.txt")

combined2[,2] <- activities_names[combined2[,2], 2]

## Appropriately labels the data set with descriptive variable names.

names(combined2)<-gsub("^t", "TimeOf", names(combined2))
names(combined2)<-gsub("^f", "FrequencyOf", names(combined2))
names(combined2)<-gsub("Acc", "Accelerometer", names(combined2))
names(combined2)<-gsub("Gyro", "Gyroscope", names(combined2))
names(combined2)<-gsub("Mag", "Magnitude", names(combined2))
names(combined2)<-gsub("BodyBody", "Body", names(combined2))
names(combined2)<-gsub("-mean\\()", "Mean", names(combined2))
names(combined2)<-gsub("-std\\()", "StdDev", names(combined2))

data <- combined2
rm(combined2)

## Creates a second, independent tidy data set with the average of each
## variable for each activity and each subject.

library(plyr)
data_average <- ddply(data, .(Subject, Activity),
                      function(x) colMeans(x[,3:68]))

write.table(data_average, "data_average.txt", row.name=FALSE)