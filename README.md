# DataCleaningFinalProject

Here is a breakdown of run_analysis.R in relation ro each of the 5 steps outlined in the assignment:  

**Part 1**  
 In part 1 I need to load in and properly combine all the existing data into one large data frame. 
 
To achieve this, I simply load in the datasets, bind the X and Y datasets column wise, then bind the testing and training datasets row wise.
Note that I rename the y dataset columns to maintain the numbers in the column names for the X dataset, as I will use it later on.

    X_test = read.table("UCI HAR Dataset/test/X_test.txt") #Testing Data
    y_test = read.table("UCI HAR Dataset/test/y_test.txt") #Testing Labels
    colnames(y_test) = "activities" #Differentiating column names for later
    test = cbind(y_test,X_test) #Combined testing data
    
    X_train = read.table("UCI HAR Dataset/train/X_train.txt") #Training Data
    y_train = read.table("UCI HAR Dataset/train/y_train.txt") #Training Labels
    colnames(y_train) = "activities" #Differentiating column names for later
    train = cbind(y_train,X_train) #Combined training data
    
    data = rbind(test, train) #Total combined data  



**Part 2**  
In part 2 I need to take the complete dataset generated in part 1, and extract only the measurements on the mean and standard deviation from it using the features list.  

To achieve this I use the grepl function to return a list of True or False values depending on if certain keywords determined by a regular expression were present in the features list. I was able to do this because the features are indexed in the same order as the column indices for the original dataset. For the regular expression I explicitly use mean() or std() to ensure I only get the data that was a direct result of these functions.  
I then add an additional True at the start of this list to retain the activities column.  
Finally, I use this list as the y value to extract the correct columns from the original data.

    features = read.table("UCI HAR Dataset/features.txt") #Measurement definitions
    boolStdMean = grepl("mean()|std()", features$V2)
    boolComplete = c(TRUE, boolStdMean)
    extractedData = data[,boolComplete]  


**Part 3**  
In part 3 I need to replace the activity numbers with their respective labels.

Since the numbers for the activities are also the indices of that dataframe, I entered in the activities column as the x value to return a vector of correct activity labels. Then I bind this new vector with the extracted data, replacing the first column with these new more descriptive labels.
    
    act_labels = read.table("UCI HAR Dataset/activity_labels.txt") #Row labels
    activityVector = act_labels[extractedData$activities,]$V2
    labelledData = cbind(activityVector, extractedData[,2:80])  



**Part 4**  
In part 4 I need to label the measurements with their appropriate feature names.  

I first remove V from the non-descriptive columns then transform to numeric to act as indices for the next step. (This was why I renamed some columns in the first step)  
I then use the same process as in Part 3 generate a vector of column labels.  
Finally I assign the numbered columns the feature names and the first column something more descriptive.
            

    indices = as.numeric(gsub("V","",colnames(labelledData)[2:80]))
    columnLabels = features[indices,]$V2
    colnames(labelledData)[2:80] = columnLabels
    colnames(labelledData)[1] = "ActivityType"



**Part 5**  
In part 5 I need to use the data from part 4 to create a tidy dataset with the average of each variable grouped by activity type and subject number

To achieve this, I first load in the subject data, bind it column wise with the labelled data from part 4, then change the column name to "SubjectNumber" to be more descriptive.  
I then use the formula method of the aggregate function to both group the data by activity data and subject, and average the values within those groups all at once.  
Finally I adjust the column names of the measurements to reflect the fact they've been averaged and write the output to a text file (Part5TidyData.txt).


    #Loading and combining subject data
    subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")
    subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")
    subjects = rbind(subject_test,subject_train)
    completeData = cbind(subjects,labelledData)
    #Assigning the column a more descriptive name
    colnames(completeData)[1] = "SubjectNumber"
    
    groupMeanData = aggregate(.~ActivityType+SubjectNumber, completeData, mean)
    colnames(groupMeanData)[3:81] = paste("Avg:", colnames(groupMeanData)[3:81])
    
    write.table(groupMeanData, file = "Part5TidyData.txt") #End of part 5

  
I believe the data within the generated text file is tidy because each column describes only a single named variable and each row describes a single specific observation.
