## source settings file
source("settings.R")

## create data directory if it does not exist
if(!file.exists(dir.data)) {
  dir.create(dir.data, recursive=TRUE)
}

## download data
download.file(url.zip, destfile=file.zip, method="curl")
tstamp <- date()
dump(c("url.zip", "file.zip", "tstamp"), file=file.downloadstatus)

## unzip data
unzip(file.zip, exdir=dir.data)


