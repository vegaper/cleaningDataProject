library(dplyr)
# loading the test set
filexTest_url <- "UCI HAR Dataset/test/X_test.txt"
fileyTest_url <- "UCI HAR Dataset/test/y_test.txt"
dataxTest <- read.table(filexTest_url, header = FALSE)
datayTest <- read.table(fileyTest_url, header = FALSE)

# loading the train set
filexTrain_url <- "UCI HAR Dataset/train/X_train.txt"
fileyTrain_url <- "UCI HAR Dataset/train/y_train.txt"
dataxTrain <- read.table(filexTrain_url, header = FALSE)
datayTrain <- read.table(fileyTrain_url, header = FALSE)

#loading subject information 
subject_Test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = "subject")
subject_Train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = "subject")

# Loading  names
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)
feature_names <- as.character(features$V2)

rm(list = ls(pattern = "^file"))

# renaming columns dataxTest and dataxTrain
colnames(dataxTest) <- feature_names
colnames(dataxTrain) <- feature_names
rm(list = c('features','feature_names'))

#select only mean and std measurements 
dataxTest <- dataxTest %>%  select(contains("mean"), contains("std"))
dataxTrain <- dataxTrain %>%  select(contains("mean"), contains("std"))

# Loading  activity names
activities <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

#renaming the activities
datayTest <- datayTest %>% left_join(activities, by = "V1")
datayTrain <- datayTrain %>% left_join(activities, by = "V1")
rm(activities)

#summarise by subject and activity 
means <- data %>% group_by(subject, activity) %>% 
  summarise_at(vars(starts_with("t")), list(mean = ~ mean(.)))
  
colnames(datayTest) <- c('actCode','activity')
colnames(datayTrain) <- c('actCode','activity')

#joining variables and activities
dataTest <- cbind(datayTest,dataxTest)
dataTrain <- cbind(datayTrain,dataxTrain)
rm(list= c('datayTest','dataxTest','datayTrain','dataxTrain'))

#joining data and subjects
dataTest <- cbind(dataTest, subject_Test)
dataTrain<- cbind(dataTrain, subject_Train)
rm(list=c('subject_Test','subject_Train'))

#joining test and train datasets
data <- rbind(dataTest,dataTrain)
rm(list= c('dataTest','dataTrain'))
