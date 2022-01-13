**1: ActivityType** - character
    The type of activity the subject was performing during measurement from the following list:  
    WALKING  
    WALKING_UPSTAIRS  
    WALKING_DOWNSTAIRS  
    SITTING  
    STANDING  
    LAYING  
  
  
**2: SubjectNumber** - numeric  
    The numeric identifier for the subject.  
    30 subjects in total, so identified in order 1 through 30.  
  
  
**3-81: Naming convention explained below** - numeric  
    Format: "Avg: measurement-function()-direction"  
    
   'Avg:' - indicates that this value is the average grouped by the activity type and subject number.  
    
   'measurement'-'direction'(if applicable): - indicates which measurement is manipulated and whether it has any direction.  
    tBodyAcc-XYZ  
    tGravityAcc-XYZ  
    tBodyAccJerk-XYZ  
    tBodyGyro-XYZ  
    tBodyGyroJerk-XYZ  
    tBodyAccMag  
    tGravityAccMag  
    tBodyAccJerkMag  
    tBodyGyroMag  
    tBodyGyroJerkMag  
    fBodyAcc-XYZ  
    fBodyAccJerk-XYZ  
    fBodyGyro-XYZ  
    fBodyAccMag  
    fBodyAccJerkMag  
    fBodyGyroMag  
    fBodyGyroJerkMag  
    
   'function': - indicates which function was used  on the original measurement before being grouped and averaged.  
    mean(): Mean value  
    std(): Standard deviation  


**Measurement Breakdown**  
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
