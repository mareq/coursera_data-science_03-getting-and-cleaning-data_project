## import libraries
library(data.table)

## source settings file
source("settings.R")

## read and display tidy dataset
if(setting.display.tidy & file.exists(file.tidy)) {
  data.tidy <- fread(file.tidy, header=TRUE)
  edit(data.tidy)
}

## read and display activity mapping
if(setting.display.activitymap & file.exists(file.activitymap)) {
  data.activitymap <- fread(file.activitymap, header=TRUE)
  edit(data.activitymap)
}

## read and display feature mapping
if(setting.display.featuremap & file.exists(file.featuremap)) {
  data.featuremap <- fread(file.featuremap, header=TRUE)
  edit(data.featuremap)
}


## read and display averages
data.averages <- fread(file.averages, header=TRUE)
edit(data.averages)


