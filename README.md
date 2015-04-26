##variable: q1 combine test and train data sets
##            col column numbers having to do with mean and std
##           q2 columns extracted from q1 which are about mean and std
##         q4  activity and measurments data sets combined together
##           q5  activity subjects and measurements combined
##          mean_act each measurements' average grouped by activities
##          mean_subject   each measurements' average grouped by activities

##step 1 using rbind to combine 2 sets(X_test and X_train) for they have some column numbers and assign the result to q1

##step 2 read the column names from features.txt and using grep() to find out the columns have to do with mean and std 
##assign those column numbers to col and subset q1, and get q2 which includes the columns have to do with mean and std

##step 3 feature$V2 are the column names and use  colnames(q1) <- as.character(features$V2) to change the original column names

##step 4 combine activities  with data sets ,change the col name of activity into "label"
##use q4[,1] <- activity_labels$V2[q4$labels] to change ativity number into cativity labels


##combine subjects to the data set
##use aggregate() to analyse data by groups of activity and subject seperately