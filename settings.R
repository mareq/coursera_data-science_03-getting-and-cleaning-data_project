## URLs
url.zip <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
url.desc <- "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"

## directory paths
#dir.data <- file.path(".", "data", fsep=.Platform$file.sep)  # this would have been better, but assignment forces the value set below
dir.data <- file.path(".", fsep=.Platform$file.sep) # assignment forces this
dir.input <- file.path(dir.data, "UCI HAR Dataset", fsep=.Platform$file.sep)
dir.output <- file.path(dir.data, "output", fsep=.Platform$file.sep)

## file paths
file.zip <- file.path(dir.data, "UCI_HAR_Dataset.zip")
file.downloadstatus <- file.path(dir.data, "download_status.txt")
file.activity_labels <- file.path(dir.input, "activity_labels.txt", fsep=.Platform$file.sep)
file.features <- file.path(dir.input, "features.txt", fsep=.Platform$file.sep)
file.train.subject <- file.path(dir.input, "train", "subject_train.txt", fsep=.Platform$file.sep)
file.train.x <- file.path(dir.input, "train", "X_train.txt", fsep=.Platform$file.sep)
file.train.y <- file.path(dir.input, "train", "y_train.txt", fsep=.Platform$file.sep)
file.test.subject <- file.path(dir.input, "test", "subject_test.txt", fsep=.Platform$file.sep)
file.test.x <- file.path(dir.input, "test", "X_test.txt", fsep=.Platform$file.sep)
file.test.y <- file.path(dir.input, "test", "y_test.txt", fsep=.Platform$file.sep)
file.tidy <- file.path(dir.output, "tidy.txt")
file.activitymap <- file.path(dir.output, "activitymap.txt")
file.featuremap <- file.path(dir.output, "featuremap.txt")
file.averages <- file.path(dir.output, "averages.txt")

## settings
setting.output.tidy = FALSE  # this is not asked for by assignment
setting.display.tidy = TRUE
setting.output.activitymap = FALSE  # this is not asked for by assignment
setting.display.activitymap = TRUE
setting.output.featuremap = FALSE  # this is not asked for by assignment
setting.display.featuremap = TRUE


