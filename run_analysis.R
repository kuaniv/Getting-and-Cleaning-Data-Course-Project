###################################################################
# Project for Coursera Data Cleaning Course
###################################################################

# Load dplyr package installed and install if needed
if(!library(dplyr, logical.return = TRUE)) {
  # It didn't exist, so install the package, and then load it
  install.packages('dplyr')
  library(dplyr)
}
## Downloading the data
datadir <- "UCI HAR Dataset"
zipfile <- "getdata_projectfiles_UCI HAR Dataset.zip"
if(!file.exists(datadir)) {
  if(!file.exists(zipfile)) {
    download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
                  zipfile)
  }
  unzip(zipfile)
}
data.test <- read.table(file.path(datadir, 'test', 'X_test.txt'))
data.train <- read.table(file.path(datadir, 'train', 'X_train.txt'))
activities.test <- read.table(file.path(datadir, 'test', 'y_test.txt'))
activities.train <- read.table(file.path(datadir, 'train', 'y_train.txt'))
subjects.test <- read.table(file.path(datadir, 'test', 'subject_test.txt'))
subjects.train <- read.table(file.path(datadir, 'train', 'subject_train.txt'))
features <- read.table(file.path(datadir, 'features.txt'),stringsAsFactors = F)
activity.labels <- read.table(file.path(datadir, 'activity_labels.txt'), stringsAsFactors = F)

## 1. Merges the training and the test sets to create one data set.

# Combine all of columns together for train
data.train <- cbind(subjects.train, activities.train, data.train)
# Combine all of columns together for test
data.test <- cbind(subjects.test, activities.test, data.test)
# Combine the testdata and traindata
data.all <- rbind(data.train,data.test)
# Rename data column
colnames(data.all) <- c("subjects", "activities", features[,2])

## 2. Extracts only the measurements on the mean and standard deviation for each measurement

features.required <- filter(features, grepl("mean\\(\\)|std\\(\\)",V2))
data.all <- data.all[,c("subjects", "activities",features.required[,2])]

## 3. Uses descriptive activity names to name the activities in the data set

activity.labels[,2] <- tolower(activity.labels[,2])
data.all[, 2] <- activity.labels[data.all[,2], 2]

## 4. Appropriately labels the data set with descriptive variable names

# Remove the brackets from the features columns
colnames(data.all) <- gsub('\\-|\\(|\\)', '', colnames(data.all))

## 5. From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject

data.average <- data.all %>% group_by(subjects, activities) %>% summarise_each(mean)
write.table(data.average, "tidy_data_average.txt", row.names = FALSE)
