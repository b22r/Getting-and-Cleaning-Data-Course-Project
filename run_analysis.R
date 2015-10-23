library(dplyr)
library(readr)

# download file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "course_project_dataset.zip")

# unzip file
unzip("course_project_dataset.zip")

# get features list
features.list <- read.table("UCI HAR Dataset/features.txt") %>%
  tbl_df() %>%
  rename(feature.num = V1, feature.name = V2) %>%
  mutate(feature.name = as.character(feature.name))

# read in training data and map column names
x.train <- read_table("UCI HAR Dataset/train/X_train.txt", col_names = features.list$feature.name)
y.train <- read_table("UCI HAR Dataset/train/Y_train.txt", col_names = "act.num")
subject.train <- read_table("UCI HAR Dataset/train/subject_train.txt", col_names = "subject.num")

# combine training data into one table
train.data <- bind_cols(subject.train, y.train, x.train)

# read in testing data and map column names
x.test <- read_table("UCI HAR Dataset/test/X_test.txt", col_names = features.list$feature.name)
y.test <- read_table("UCI HAR Dataset/test/Y_test.txt", col_names = "act.num")
subject.test <- read_table("UCI HAR Dataset/test/subject_test.txt", col_names = "subject.num")

# combine testing data into one table
test.data <- bind_cols(subject.test, y.test, x.test)

# step 1: combine (merge) testing and training data
comb.data <- bind_rows(test.data, train.data)

# step 2: get only metrics for mean or std devl
# do not include angle calculations (which have mean in the title) or mean freq
req.metrics <- comb.data %>%
  select(subject.num, act.num, matches("mean|std"), -matches("Freq|angle"))

# get activities table
activities.list <- read.table("UCI HAR Dataset/activity_labels.txt") %>%
  rename(act.num = V1, act.name = V2) %>%
  tbl_df()

# step 3: map descriptive activities names to dataset
mapped.act <- inner_join(req.metrics, activities.list, c("act.num")) %>%
  select(subject.num, act.name, 3:length(req.metrics))

# step 4: relabel metrics with descriptive variable names
mapped.act <- mapped.act %>%
  rename(`Subject Number` = subject.num, `Activity Name` = act.name)

names(mapped.act) <- names(mapped.act) %>%
  gsub("tBody", "Time: Body", .) %>%
  gsub("tGravity", "Time: Gravity", .) %>%
  gsub("fBody", "Fourier: Body", .) %>%
  gsub("fGravity", "Fourier: Gravity", .) %>%
  gsub("Acc", " Acceleration ", .) %>%
  gsub("Gyro", " Gyroscope ", .) %>%
  gsub("Jerk", " Jerk ", .) %>%
  gsub("Mag", " Magnitude ", .) %>%
  gsub("\\-", " ", .) %>%
  gsub("std\\(\\)", " Std Dev ", .) %>%
  gsub("mean\\(\\)", " Mean ", .) %>%
  gsub(" ( )+", " ", .) %>%
  gsub(" $", "", .)

# step 5: create second, independent tidy data set with the average of each variable by subject and activity
avg.var.sub <- mapped.act %>%
  group_by(`Subject Number`, `Activity Name`) %>%
  summarise_each(funs(mean), -`Subject Number`, -`Activity Name`)

# export dataset from step 5
write.table(avg.var.sub, "course_project_step_5_output.txt", row.names = FALSE)
