#---------------------------------Part 1----------------------------------------
#Note: duplicate row names not allowed in a dataframe, so need to add y as
#another column
X_test = read.table("UCI HAR Dataset/test/X_test.txt") #Testing Data
y_test = read.table("UCI HAR Dataset/test/y_test.txt") #Testing Labels
colnames(y_test) = "activities" #Differentiating column names for later
test = cbind(y_test,X_test) #Combined testing data

X_train = read.table("UCI HAR Dataset/train/X_train.txt") #Training Data
y_train = read.table("UCI HAR Dataset/train/y_train.txt") #Training Labels
colnames(y_train) = "activities" #Differentiating column names for later
train = cbind(y_train,X_train) #Combined training data

data = rbind(test, train) #Total combined data, end of part 1


#---------------------------------Part 2----------------------------------------
features = read.table("UCI HAR Dataset/features.txt") #Measurement definitions

#Use regular expression to determine all the features that contain a mean or 
#standard deviation, use grepl to return a vector of TRUE/FALSE values
boolStdMean = grepl("[Mm]ean|std", features$V2)

#add an additional TRUE at the start to account for the activities column
boolComplete = c(TRUE, boolStdMean)

#extract the necessary columns from the original data
extractedData = data[,boolComplete] #End of part 2 


#---------------------------------Part 3----------------------------------------
act_labels = read.table("UCI HAR Dataset/activity_labels.txt") #Row labels

#Since the numbers for the activities are also the indices of that dataframe, I
#decided to just enter in the activities column as the x value to return a 
#vector of correct activity labels
activityVector = act_labels[extractedData$activities,]$V2

#Then simply bind this new vector with the extracted data, replacing first
#column with these new more descriptive labels
labelledData = cbind(activityVector, extractedData[,2:87]) #End of part 3


#---------------------------------Part 4----------------------------------------
features = read.table("UCI HAR Dataset/features.txt") #Column labels

#Removing V from the non-descriptive columns then transform to numeric to act
#as indices for the next step
indices = as.numeric(gsub("V","",colnames(labelledData)[2:87]))

#Use the same process as in Part 3 generate a vector of column labels
columnLabels = features[indices,]$V2

#Assign the numbered columns the feature names
colnames(labelledData)[2:87] = columnLabels
#Assign the first column something more descriptive
colnames(labelledData)[1] = "ActivityType" #End of part 4


#---------------------------------Part 5----------------------------------------
#Loading and combining subject data
subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")
subjects = rbind(subject_test,subject_train)

#combine with existing data, order has been retained up to now, so can directly 
#bind sans issue
completeData = cbind(subjects,labelledData)
#Assigning the column a more descriptive name
colnames(completeData)[1] = "SubjectNumber"

#Use the formula method of the aggregate function to group and average the data
#by activity type and subject
groupMeanData = aggregate(.~ActivityType+SubjectNumber, completeData, mean)
#Adjust the column names to reflect the fact the data's been averaged out
colnames(groupMeanData)[3:88] = paste("Avg:", colnames(groupMeanData)[3:88])
#This dataset is Tidy since each column has a unique, descriptive variable, and 
#each row is composed of an individual observation

write.table(groupMeanData, file = "Part5TidyData.txt") #End of part 5

