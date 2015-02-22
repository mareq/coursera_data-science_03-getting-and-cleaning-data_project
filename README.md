# Getting and Cleaning Data Course Project

## Abstract

Course project for Coursera Data Science specialization by Johns Hopkins University, Course 3, Getting and Cleaning Data, 2nd Feb 2015.

This file describes the overall structure of the project, lists individual files and their purpose. Detailed description of algorithm used is also included.


## Requirements

The purpose of this project is to demonstrate ability to collect, work with, and clean a dataset. Assignment requirements (for discussion on fulfillment of these requirements, see section **Discussion** at the end of this document) [[1]]:

1. Create R script called ```run_analysis.R``` that can be run as long as the Samsung data is in the working directory and does the following:
  1. Merges the training and the test sets to create one dataset.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
2. Crate code book called ```CodeBook.md``` that describes the variables, the data, and any transformations or work performed to clean up the data 
3. Create ```README.md``` file that explains how all of the scripts work and how they are connected.

Input data download link [[2]]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Input data description [[3]]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones



## Usage

In order to run the data transformation implemented by this project, follow these steps:

1. Adjust configuration of the project to your needs by editing values in ```settings.R``` file. **[OPTIONAL]**
1. Run script ```prepare_data.R``` in order to download and unzip the input data. **[OPTIONAL]**
1. Run script ```run_analysis.R``` in order to perform transformations on the input data and produce outputs.
1. Run script ```display_data.R``` in order to display outputs. **[OPTIONAL]**


## Files

This section describes overall structure of the project, lists individual files and provides their short descriptions.

### Documentation

#### ```README.md```

This file required by the assignment requirements, point 3.


#### ```CodeBook.md```

The code book required by the assignment requirements, point 2.

### Scripts

#### ```settings.R```

The script ```./settings.R``` is providing project configuration, such as URLs, filesystem paths and project behaviour flags. See the **Configuration** section for detailed description of configuration options.

This script is sourced by all other R scripts. Even though this file is not directly required by the assignment requirements, it helps to keep all configuration stored at single spot in conscious and simply modifiable manner. Moreover, as some values defined in this file is used by all other scripts, it prevents duplication of those values.


#### ```prepare_data.R```

The script ```./prepare_data.R``` can be used to download and prepare input data. It downloads the zip file [[2]] specified by the assignment requirements and unzips it, thus preparing data for ```run_analysis.R``` script.

After successfully running this script, data directory will contain:
* downloaded zip file (```UCI_HAR_Dataset.zip``` by default)
* unzipped input data (```UCI HAR Dataset``` directory)
* download status file (```download_status.txt``` by default)

This script uses configuration specified by ```settings.R```. See the **Configuration** section for details.

#### ```run_analysis.R```

The script ```./run_analysis.R``` is required by assignment requirements, point 1, and executes all required data transformations. See the **Data Transformation** section for details.

After successfully running this script, output directory will contain:
* file containing output dataset, required by point 1.5 of the assignment requirements, and described in detail in ```CodeBook.md``` (```averages.txt``` by default)
* optionally, file containing tidy dataset produced by points 1.1 through 1.4 of the assignment requirements (```tidy.txt``` by default)
* optionally, file containing mapping of original activity names to converted activity names (```activitymap.txt``` by default)
* optionally, file containing mapping of original feature names to converted feature names (```featuremap.txt``` by default)

This script uses configuration specified by ```settings.R```. See the **Configuration** section for details.

#### ```display_data.R```

The script ```./display_data.R``` is provided for convenience. It displays outputs of the ```run_analysis.R``` script. The file required by the point 1.5 of the assignment requirements is always displayed, displaying all other outputs is optional.

This script uses configuration specified by ```settings.R```. See the **Configuration** section for details.

### Outputs

Names and location of outputs is configurable, see the **Configuration** section for details. The default names are used in this section.

#### ```download_status.txt```

This file contains information about input data download, namely following variables written using ```dump``` function:
* **```url.zip```**: data source URL
* **```file.zip```**: name of the local zip file, input data was downloaded to
* **```tstamp```**: timestamp of the download

#### ```averages.txt```

This file required by point 1.5 of the assignment requirements, and is described in detail in ```CodeBook.md```.

#### ```tidy.txt```

Tidy dataset produced by points 1.1 through 1.4 of the assignment requirements.

As it is not directly required by assignment requirements, this file is not produced by default. See the **Configuration** section for details on enabling output of this file.

#### ```activitymap.txt```

Mapping of original activity names to converted activity names. This file should contain exactly the same table, as displayed in ```CodeBook.md```, section **```"Activity"```**.

As it is not directly required by assignment requirements, this file is not produced by default. See the **Configuration** section for details on enabling output of this file.

#### ```featuremap.txt```

Mapping of original feature names and columns to converted feature names. This file should contain exactly the same table, as displayed in ```CodeBook.md```, section **Averages**.

As it is not directly required by assignment requirements, this file is not produced by default. See the **Configuration** section for details on enabling output of this file.

## Data Transformation

This section describes in detail the data transformations performed on input data, in order to produce outputs.

### Preconditions

In order to successfully run the data transformations, following preconditions must be fulfilled:
* Unzipped, readable and complete input data are pointed to by the configuration variables defined in ```settings.R``` (hint: use ```prepare_data.R``` script to prepare input data).
* Output path specified by the configuration variables defined in ```settings.R``` is writeable. It is not required for output directory to exist.

### Input Data

Following input files are used to obtain the input data:
* **measurement values ("X data")**: Each column of these datasets contains measurements for single feature.
  * ```UCI HAR Dataset/train/X_train.txt```
  * ```UCI HAR Dataset/test/X_test.txt```
* **features**: Each row of this dataset contains feature name and reference to corresponding column of measurement values datasets.
  * ```UCI HAR Dataset/features.txt```
* **activities for measurements ("Y data")**: Specifies activities for corresponding measurements; there is 1:1 correspondence between rows of these datasets and measurement values datasets.
  * ```UCI HAR Dataset/test/y_test.txt```
  * ```UCI HAR Dataset/train/y_train.txt```
* **activity labels**: Provides labels for activity numbers used in "Y data".
  * ```UCI HAR Dataset/activity_labels.txt```
* **volunteers for measurements ("subject data")**: Specifies volunteers for corresponding measurements; there is 1:1 correspondence between rows of these datasets and measurement values datasets.
  * ```UCI HAR Dataset/test/subject_test.txt```
  * ```UCI HAR Dataset/train/subject_train.txt```

### Algorithm

Assignment requirements do not require algorithm to follow individual steps specified in points 1.1 through 1.5 in exactly the specified order and it is more effective (and arguably also more readable) not to follow these steps in the same order as specified. Therefore, although the algorithm fulfils all these requirements, they are not followed in the same order.

Detailed description of the algorithm, implemented in ```run_analysis.R``` follows (for better readability, items in the following list correspond to comments in the script):
* **import libraries**: Import R libraries used in the script.
* **source settings file**: Source the ```settings.R``` script, in order to get configuration.
* **create output directory if it does not exist**: Recursively create directory for outputs. This has to be done fairly soon, since optional outputs are produced at many stages throughout the algorithm.
* **get subject data**: Both input data files for "subject data" are read. Resulting datasets are concatenated and stored in variable ```data.tidy```. Since the two datasets read from the input files are no longer needed, they are deallocated in order to save memory.
* **get activity labels**: Activity labels are read and transformed (see ```CodeBook.md```, table in section **```"Activity"```**). Optionally, activity mappings output file (see section **``activitymap.txt``**) is written.
* **get Y data**: Both input data files for "Y data" are read. Resulting datasets are first transformed to factors using previously loaded activity labels, then concatenated, and finally bound to "subject data" already stored in ```data.tidy``` variable. Since the two "Y data" datasets read from the input files, as well as activity labels are no longer needed, they are deallocated in order to save memory.
* **get features**: Features definition is read and transformed (see ```CodeBook.md```, table in section **Averages**). Optionally, feature mappings output file (see section **``featuremap.txt``**) is written.
* **get X data**: Both input data files for "X data" are read. Mean and standard deviation data are extracted, both datasets are concatenated and bound to "subject data" and "Y data" already stored in ```data.tidy``` variable. Since the two "X data" datasets read from the input files are no longer needed, they are deallocated in order to save memory.
* **set column names**: Variable ```data.tidy``` now contains all the needed data in the correct format. The last step to finalize production of the tidy dataset is to give appropriate names to its columns. Since feature definitions are no longer needed, the dataset is deallocated in order to save memory.
* **calculate average of each feature for each activity and each subject**: The dataset required by point 1.5 of assignment requirements is created and stored to variable ```data.averages```.
* **save results**: The dataset required by point 1.5 of assignment requirements is written to file. Optionally, the tidy dataset stored in variable ```data.tidy``` is also written to file.


## Configuration

In order to prevent code duplication and subsequent bugs (e.g. two scripts access the same resource, but each of them searches for it on different path, because the path has been changed in only one of them), configuration is centralized in the ```./settings.R``` script (see section ```settings.R```) for more information.


### URLs

* **```url.zip```**: URL of the zip file containing the input dataset. Default value: ```"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"```. [[2]]
* **```url.desc```**: URL of the webpage containing description of input dataset. This value is not directly used, but it is provided for completeness. Default value: ```"http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"```. [[3]]


### Directory Paths

* **```dir.data```**: Data directory root path. In general, it is a good idea to set this to something different (e.g. to ```data``` subdirectory) than working directory containing all the scripts, but assignment requirements [[1]] require this directory to be the same as working directory. Default value: ```./```.
* **```dir.input```**: Name of the root directory contained in the source zip data file. Default value: ```<dir.data>/UCI HAR Dataset/```.
* **```dir.output```**: Name of the root directory for output. This is the directory, where all the output files will be created. Default value: ```<dir.data>/output/```.


### File Paths

* **```file.zip```**: Local path of the zip file containing the input dataset. The ```prepare_data.R``` script will store the zip file at this location. Default value: ```<dir.data>/UCI_HAR_Dataset.zip```.
* **```file.downloadstatus```**: Path to the file containing information about input data download, created by ```prepare_data.R``` script. Default value: ```<dir.data>/download_status.txt```.
* **```file.activity_labels```**: Path to the activity labels input data file, unzipped from downloaded zip file. The ```run_analysis.R``` script will look for the file at this location. Default value: ```<dir.input>/activity_labels.txt```.
* **```file.features```**: Path to the features input data file, unzipped from downloaded zip file. The ```run_analysis.R``` script will look for the file at this location. Default value: ```<dir.input>/features.txt```.
* **```file.train.subject```**: Path to the training "subject data" input data file, unzipped from downloaded zip file. The ```run_analysis.R``` script will look for the file at this location. Default value: ```<dir.input>/train/subject_train.txt```.
* **```file.train.x```**: Path to the training "X data" input data file, unzipped from downloaded zip file. The ```run_analysis.R``` script will look for the file at this location. Default value: ```<dir.input>/train/X_train.txt```.
* **```file.train.y```**: Path to the training "Y data" input data file, unzipped from downloaded zip file. The ```run_analysis.R``` script will look for the file at this location. Default value: ```<dir.input>/train/y_train.txt```.
* **```file.test.subject```**: Path to the test "subject data" input data file, unzipped from downloaded zip file. The ```run_analysis.R``` script will look for the file at this location. Default value: ```<dir.input>/test/subject_test.txt```.
* **```file.test.x```**: Path to the test "X data" input data file, unzipped from downloaded zip file. The ```run_analysis.R``` script will look for the file at this location. Default value: ```<dir.input>/test/X_test.txt```.
* **```file.test.y```**: Path to the test "Y data" input data file, unzipped from downloaded zip file. The ```run_analysis.R``` script will look for the file at this location. Default value: ```<dir.input>/test/y_test.txt```.
* **```file.tidy```**: Path of the output file for optionally written (see ```setting.output.tidy```) tidy dataset. The ```run_analysis.R``` script will write the file at this location and the script ```display_data.R``` will look (see also ```setting.display.tidy```) for the file at this location. Default value: ```<dir.output>/tidy.txt```.
* **```file.activitymap```**: Path of the optionally written (see ```setting.output.activitymap```) activity mappings output file (see section **```activitymap.txt```**). The ```run_analysis.R``` script will write the file at this location and the script ```display_data.R``` will look (see also ```setting.display.activitymap```) for the file at this location. Default value: ```<dir.output>/activitymap.txt```
* **```file.featuremap```**: Path of the optionally written (see ```setting.output.featuremap```) feature mappings output file (see section **```featuremap.txt```**). The ```run_analysis.R``` script will write the file at this location and the script ```display_data.R``` will look (see also ```setting.display.featuremap```) for the file at this location. Default value: ```<dir.output>/featuremap.txt```
* **```file.averages```**: Path of the main output file required by the point 1.5 of the assignment requirements (see section **```averages.txt```**). The ```run_analysis.R``` script will write the file at this location and the script ```display_data.R``` will look for the file at this location. Default value: ```<dir.output>/averages.txt```


### Settings

* **```setting.output.tidy```**: If set, tidy dataset (see section **```tidy.txt```**) will be written by ```run_analysis.R``` script to the file specified by ```file.tidy```.
* **```setting.display.tidy```**: If set and if the file specified by ```file.tidy``` exists, tidy dataset (see section **```tidy.txt```**) will be displayed by ```display_data.R``` script.
* **```setting.output.activitymap```**: If set, activity mapping (see section **```activitymap.txt```**) will be written by ```run_analysis.R``` script to the file specified by ```file.activitymap```. 
* **```setting.display.activitymap```**: If set and if the file specified by ```file.activitymap``` exists, activity mapping (see section **```activitymap.txt```**) will be displayed by ```display_data.R``` script. 
* **```setting.output.featuremap```**: If set, feature mapping (see section **```featuremap.txt```**) will be written by ```run_analysis.R``` script to the file specified by ```file.featuremap```. 
* **```setting.display.featuremap```**: If set and if the file specified by ```file.featuremap``` exists, feature mapping (see section **```featuremap.txt```**) will be displayed by ```display_data.R``` script. 


## Discussion

The requirements specified by the assignment [[1]] are fulfilled:

1. The script ```run_analysis.R``` has been created (see section **```run_analysis.R```**). This script implements required data transformations (see section **Algorithm**):
  1. Training and test sets are merged into single dataset in steps **"get subject data"**, **"get Y data"** and **"get X data"**.
  2. Measurements on the mean and standard deviation for each measurement is extracted in **"get X data"** step, using data previously loaded and transformed in **"get features"** step.
  3. Descriptive activity names to name activities in the data set are created by transformation from original names in **"get activity labels"** step and added to the tidy dataset in **"get Y data"** step.
  4. Data set is appropriately labeled in **"set column names"** step.
  5. Second, independent tidy data set with the average of each variable for each activity and each subject is created in **"calculate average of each feature for each activity and each subject"** and written to file in **"save results"** step.
2. Code book has been created (see section **```CodeBook.md```**).
3. Readme file has been created (see section **```README.md```**).


## References


[[1]] Course Project for COursera Getting and Cleaning Data class

[[2]] UCI Machine Learning Repository: Human Activity Recognition Using Smartphones Data Set

[[3]] UCI Machine Learning Repository: Human Activity Recognition Using Smartphones Data Set Description



[1]:https://class.coursera.org/getdata-011/human_grading/view/courses/973498/assessments/3/submissions
[2]:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
[3]:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


