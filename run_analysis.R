## import libraries
library(data.table)
library(reshape2)
library(dplyr)


## source settings file
source("settings.R")


## create output directory if it does not exist
if(!file.exists(dir.output)) {
  dir.create(dir.output, recursive=TRUE)
}


## get subject data
data.train.subject <- fread(file.train.subject)
data.test.subject <- fread(file.test.subject)
data.tidy <- rbindlist(list(data.train.subject, data.test.subject))
rm("data.train.subject", "data.test.subject")


## get activity labels
data.activity_labels <- fread(file.activity_labels)
data.activity_labels$V3 <- strsplit(data.activity_labels$V2, "_")
data.activity_labels$V3 <- sapply(
  data.activity_labels$V3,
  function(x) paste(toupper(substring(x, 1,1)), tolower(substring(x, 2)), sep="", collapse="")
)
setnames(data.activity_labels, c("ActivityId", "OriginalName", "ConvertedName"))
if(setting.output.activitymap) {
  write.table(data.activity_labels, file=file.activitymap, row.names=FALSE)
}

# get Y data
data.train.y <- fread(file.train.y)
data.train.y <- mutate(data.train.y, V1 = factor(V1, levels=data.activity_labels$ActivityId, labels=data.activity_labels$ConvertedName))
data.test.y <- fread(file.test.y)
data.test.y <- mutate(data.test.y, V1 = factor(V1, levels=data.activity_labels$ActivityId, labels=data.activity_labels$ConvertedName))
data.tidy <- cbind(data.tidy,rbindlist(list(data.train.y, data.test.y)))
rm("data.train.y", "data.test.y", "data.activity_labels")


## get features
data.features <- fread(file.features, stringsAsFactors=FALSE)
data.features <- data.features[grep("^[a-zA-Z]+-(mean|std)\\(\\)(-[XYZ])?$", data.features$V2),]
data.features$V3 <- sub("^([a-zA-Z]+)-mean\\(\\)(-([XYZ]))?$", "\\1\\3Mean", data.features$V2)
data.features$V3 <- sub("^([a-zA-Z]+)-std\\(\\)(-([XYZ]))?$", "\\1\\3Std", data.features$V3)
setnames(data.features, c("ColumnNumber", "OriginalFeatureName", "ConvertedFeatureName"))
if(setting.output.featuremap) {
  write.table(data.features, file=file.featuremap, row.names=FALSE)
}

## get X data
data.train.x <- data.table(read.table(file.train.x, stringsAsFactors=FALSE)[,data.features$ColumnNumber])
data.test.x <- data.table(read.table(file.test.x, stringsAsFactors=FALSE)[,data.features$ColumnNumber])
data.tidy <- cbind(data.tidy,rbindlist(list(data.train.x, data.test.x)))
rm("data.train.x", "data.test.x")

## set column names
setnames(data.tidy, c("Subject", "Activity", data.features$ConvertedFeatureName))
rm("data.features")


## calculate average of each feature for each activity and each subject
data.averages <- dcast(
  melt(data.tidy, c("Subject", "Activity")),
  Subject + Activity ~ variable,
  mean
)

## save results
if(setting.output.tidy) {
  write.table(data.tidy, file=file.tidy, row.names=FALSE)
}
write.table(data.averages, file=file.averages, row.names=FALSE)


