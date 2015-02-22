# Code Book

for course project of Coursera Data Science specialization by Johns Hopkins University, Course 3, Getting and Cleaning Data, 2nd Feb 2015.


## Summary

This file provides detailed description of dataset produced by ```run_analysis.R``` script. The detailed description of input data for this script is provided with the input data and therefore it is not repeated here. Input data can be obtained at [[2]].

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED",  "MAY", and "OPTIONAL" in this document are to be interpreted as described in RFC 2119 [[4]].


## Data

After successfully running the ```run_analysis.R``` script, the dataset set should be stored by default in file ```./output/averages.txt```. See ```README.md``` file [[6]], section **Configuration** for details on configuring location of this file.

According to point 5. of the assignment requirements [[5]], the dataset contains the average of mean and average of standard deviation for each activity and each subject from the input dataset.

Assignment requirements [[5]] provide a freedom to choose between "wide" and "long" format of the dataset. "Wide" format has been chosen.

Assignment requirements [[5]] do not specify any particular ordering of the dataset, nor is it part of data tidiness requirements. The dataset is therefore not explicitly sorted by any particular criteria. Any resulting ordering is only circumstantial by-product of current implementation, is not guaranteed, is subject to change without any warning, and therefore MUST NOT be relied upon.


### Variables

The dataset contains following values for each measurement:


#### ```"Subject"```

The identification number of a volunteer in range 1 through 30. See documentation of the input dataset [[2]] [[3]] for more details.

Sources of ```"Subject"``` values in original data are the following files:
* ```UCI HAR Dataset/train/subject_train.txt```
* ```UCI HAR Dataset/test/subject_test.txt```

These values has not been modified and therefore there is exact 1:1 mapping between input data and the dataset described by this code book.


####  ```"Activity"```

Measured activities, performed by volunteers. See documentation of the input dataset [[2]] [[3]] for more details.

Sources of ```"Activity"``` values in original data are the following files:
* ```UCI HAR Dataset/activity_labels.txt```
* ```UCI HAR Dataset/train/y_train.txt```
* ```UCI HAR Dataset/test/y_test.txt```


Activity names has been modified to match the overall naming scheme of the dataset in order to fulfill tidy data requirements. Mapping of the original and modified values is provided in the following table:


Activity Id|Original name|Converted name
---|---|---
```1```|```WALKING```|```Walking```
```2```|```WALKING_UPSTAIRS```|```WalkingUpstairs```
```3```|```WALKING_DOWNSTAIRS```|```WalkingDownstairs```
```4```|```SITTING```|```Sitting```
```5```|```STANDING```|```Standing```
```6```|```LAYING```|```Laying```


This mapping mapping table can be optionally stored into a file. See ```README.md``` file [[6]], section **Configuration** for details.


#### Averages

The rest of the columns in the dataset contain values of averages of mean and averages of standard deviation of individual features contained in original dataset for each ```"Subject"``` and ```"Activity"```.  See documentation of the input dataset [[2]] [[3]] for more details. Since the original feature values are normalized and bounded within [-1,1], the same applies to their averages.

Sources of these values in original data are the following files:
* ```UCI HAR Dataset/features.txt```
* ```UCI HAR Dataset/train/X_train.txt```
* ```UCI HAR Dataset/test/X_test.txt```

Original column names denoting features has been modified to match the overall naming scheme of the dataset in order to fulfill tidy data requirements. Mapping of the original feature names and names of the columns containing corresponding average is provided in the following table:

Original column|Original name|Converted name
---|---|---
```1```|```tBodyAcc-mean()-X```|```tBodyAccXMean```
```2```|```tBodyAcc-mean()-Y```|```tBodyAccYMean```
```3```|```tBodyAcc-mean()-Z```|```tBodyAccZMean```
```4```|```tBodyAcc-std()-X```|```tBodyAccXStd```
```5```|```tBodyAcc-std()-Y```|```tBodyAccYStd```
```6```|```tBodyAcc-std()-Z```|```tBodyAccZStd```
```41```|```tGravityAcc-mean()-X```|```tGravityAccXMean```
```42```|```tGravityAcc-mean()-Y```|```tGravityAccYMean```
```43```|```tGravityAcc-mean()-Z```|```tGravityAccZMean```
```44```|```tGravityAcc-std()-X```|```tGravityAccXStd```
```45```|```tGravityAcc-std()-Y```|```tGravityAccYStd```
```46```|```tGravityAcc-std()-Z```|```tGravityAccZStd```
```81```|```tBodyAccJerk-mean()-X```|```tBodyAccJerkXMean```
```82```|```tBodyAccJerk-mean()-Y```|```tBodyAccJerkYMean```
```83```|```tBodyAccJerk-mean()-Z```|```tBodyAccJerkZMean```
```84```|```tBodyAccJerk-std()-X```|```tBodyAccJerkXStd```
```85```|```tBodyAccJerk-std()-Y```|```tBodyAccJerkYStd```
```86```|```tBodyAccJerk-std()-Z```|```tBodyAccJerkZStd```
```121```|```tBodyGyro-mean()-X```|```tBodyGyroXMean```
```122```|```tBodyGyro-mean()-Y```|```tBodyGyroYMean```
```123```|```tBodyGyro-mean()-Z```|```tBodyGyroZMean```
```124```|```tBodyGyro-std()-X```|```tBodyGyroXStd```
```125```|```tBodyGyro-std()-Y```|```tBodyGyroYStd```
```126```|```tBodyGyro-std()-Z```|```tBodyGyroZStd```
```161```|```tBodyGyroJerk-mean()-X```|```tBodyGyroJerkXMean```
```162```|```tBodyGyroJerk-mean()-Y```|```tBodyGyroJerkYMean```
```163```|```tBodyGyroJerk-mean()-Z```|```tBodyGyroJerkZMean```
```164```|```tBodyGyroJerk-std()-X```|```tBodyGyroJerkXStd```
```165```|```tBodyGyroJerk-std()-Y```|```tBodyGyroJerkYStd```
```166```|```tBodyGyroJerk-std()-Z```|```tBodyGyroJerkZStd```
```201```|```tBodyAccMag-mean()```|```tBodyAccMagMean```
```202```|```tBodyAccMag-std()```|```tBodyAccMagStd```
```214```|```tGravityAccMag-mean()```|```tGravityAccMagMean```
```215```|```tGravityAccMag-std()```|```tGravityAccMagStd```
```227```|```tBodyAccJerkMag-mean()```|```tBodyAccJerkMagMean```
```228```|```tBodyAccJerkMag-std()```|```tBodyAccJerkMagStd```
```240```|```tBodyGyroMag-mean()```|```tBodyGyroMagMean```
```241```|```tBodyGyroMag-std()```|```tBodyGyroMagStd```
```253```|```tBodyGyroJerkMag-mean()```|```tBodyGyroJerkMagMean```
```254```|```tBodyGyroJerkMag-std()```|```tBodyGyroJerkMagStd```
```266```|```fBodyAcc-mean()-X```|```fBodyAccXMean```
```267```|```fBodyAcc-mean()-Y```|```fBodyAccYMean```
```268```|```fBodyAcc-mean()-Z```|```fBodyAccZMean```
```269```|```fBodyAcc-std()-X```|```fBodyAccXStd```
```270```|```fBodyAcc-std()-Y```|```fBodyAccYStd```
```271```|```fBodyAcc-std()-Z```|```fBodyAccZStd```
```345```|```fBodyAccJerk-mean()-X```|```fBodyAccJerkXMean```
```346```|```fBodyAccJerk-mean()-Y```|```fBodyAccJerkYMean```
```347```|```fBodyAccJerk-mean()-Z```|```fBodyAccJerkZMean```
```348```|```fBodyAccJerk-std()-X```|```fBodyAccJerkXStd```
```349```|```fBodyAccJerk-std()-Y```|```fBodyAccJerkYStd```
```350```|```fBodyAccJerk-std()-Z```|```fBodyAccJerkZStd```
```424```|```fBodyGyro-mean()-X```|```fBodyGyroXMean```
```425```|```fBodyGyro-mean()-Y```|```fBodyGyroYMean```
```426```|```fBodyGyro-mean()-Z```|```fBodyGyroZMean```
```427```|```fBodyGyro-std()-X```|```fBodyGyroXStd```
```428```|```fBodyGyro-std()-Y```|```fBodyGyroYStd```
```429```|```fBodyGyro-std()-Z```|```fBodyGyroZStd```
```503```|```fBodyAccMag-mean()```|```fBodyAccMagMean```
```504```|```fBodyAccMag-std()```|```fBodyAccMagStd```
```516```|```fBodyBodyAccJerkMag-mean()```|```fBodyBodyAccJerkMagMean```
```517```|```fBodyBodyAccJerkMag-std()```|```fBodyBodyAccJerkMagStd```
```529```|```fBodyBodyGyroMag-mean()```|```fBodyBodyGyroMagMean```
```530```|```fBodyBodyGyroMag-std()```|```fBodyBodyGyroMagStd```
```542```|```fBodyBodyGyroJerkMag-mean()```|```fBodyBodyGyroJerkMagMean```
```543```|```fBodyBodyGyroJerkMag-std()```|```fBodyBodyGyroJerkMagStd```

This mapping table can be optionally stored into a file. See ```README.md``` file [[6]], section **Configuration** for details.


## References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

[[2]] UCI Machine Learning Repository: Human Activity Recognition Using Smartphones Data Set

[[3]] UCI Machine Learning Repository: Human Activity Recognition Using Smartphones Data Set Description

[[4]] RFC 2119

[[5]] Course project of Coursera Data Science specialization by Johns Hopkins University, Course 3, Getting and Cleaning Data, 2nd Feb 2015

[[6]] README.md




[2]:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
[3]:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
[4]:https://www.ietf.org/rfc/rfc2119.txt
[5]:https://class.coursera.org/getdata-011/human_grading/view/courses/973498/assessments/3/submissions
[6]:https://github.com/mareq/coursera_data-science_03-getting-and-cleaning-data_project/blob/master/README.md


