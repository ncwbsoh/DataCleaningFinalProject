#---------------------------------Part 1----------------------------------------
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
act_labels = read.table("UCI HAR Dataset/activity_labels.txt") #Label definitions

#Since the numbers for the activities are also the indices of that dataframe, I
#decided to just enter in the activities column as the x value to return a 
#vector of correct activity labels
activityVector = act_labels[extractedData$activities,]$V2

#Then simply bind this new vector with the extracted data, replacing first
#column with these new more descriptive labels
activityData = cbind(activityVector, extractedData[,2:87]) #End of part 3


#---------------------------------Part 4----------------------------------------




#---------------------------------Part 5----------------------------------------




