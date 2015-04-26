##loading the data sets of test and train
X_train <- read.table("C:/Users/admin/Desktop/coursera/UCI HAR Dataset/train/X_train.txt", quote="\"")
X_test <- read.table("C:/Users/admin/Desktop/coursera/UCI HAR Dataset/test/X_test.txt", quote="\"")

##combine two sets and assign the result to q1
q1 <- rbind(X_test, X_train)

##load features.txt
features <- read.table("C:/Users/admin/Desktop/coursera/UCI HAR Dataset/features.txt", quote="\"")
##to find out the columns numbers have to do with mean or std
col <- c(grep("mean",features$V2),grep("std",features$V2))
##subset data set  
q2 <- q1[,col]

#rename the columns
colnames(q1) <- as.character(features$V2)

##step 4
activity_labels <- read.table("C:/Users/admin/Desktop/coursera/UCI HAR Dataset/activity_labels.txt", quote="\"")

y_train <- read.table("C:/Users/admin/Desktop/coursera/UCI HAR Dataset/train/y_train.txt", quote="\"")

y_test <- read.table("C:/Users/admin/Desktop/coursera/UCI HAR Dataset/test/y_test.txt", quote="\"")


##combine data set with corresponding activities and then combine test and train together
q4 <- rbind(cbind(y_test, X_test),cbind(y_train,X_train))
colnames(q4) <- c("labels",as.character(features$V2))

q4[,1] <- activity_labels$V2[q4$labels]

##step 5
##load  subject data
subject_train <- read.table("C:/Users/admin/Desktop/coursera/UCI HAR Dataset/train/subject_train.txt", quote="\"")
subject_test <- read.table("C:/Users/admin/Desktop/coursera/UCI HAR Dataset/test/subject_test.txt", quote="\"")


##combine subjects data to the full data set
q5 <- cbind(rbind(subject_test,subject_train),q4)
##rename the column names
colnames(q5) <- c("subjects",colnames(q4))

##according to "labels" column calculate each column's mean in groups of activity 
mean_act <- aggregate(q5[,3:563],list(q5[,2]),mean)
## each subject's every column average
mean_subject <- aggregate(q5[,3:563],list(q5[,1]),mean)

##output
write.table(mean_act ,"strp5output.txt",row.names= FALSE)
write.table(mean_subject ,"subjectoutput.txt",row.names= FALSE)
