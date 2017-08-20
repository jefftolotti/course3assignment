## run_analysis.R script

# 415-515

#GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
#The README that explains the analysis files is clear and understandable.


# Load code mappings for activities and features
activity_labels <- read.table("./data/activity_labels.txt")
names(activity_labels) = c("activityID", "activityNm")
features <- read.table("./data/features.txt")
names(features) = c("featureID", "featureNm")


## TEST DATA

# Load list of subjects
test_subjects <- read.table("./data/test/subject_test.txt")
names(test_subjects) = c("subjectID")

# Load X and Y test results
test_x <- read.table("./data/test/X_test.txt")
test_y <- read.table("./data/test/y_test.txt")
#join activitiy IDs to Names and keep only the names
names(test_y) = c("activityID")
test_activities <- merge(test_y, activity_labels, by = "activityID")$activityNm

# Load inertial data
test_body_acc_x <- read.table("./data/test/Inertial Signals/body_acc_x_test.txt")
test_body_acc_y <- read.table("./data/test/Inertial Signals/body_acc_y_test.txt")
test_body_acc_z <- read.table("./data/test/Inertial Signals/body_acc_z_test.txt")
test_body_gyro_x <- read.table("./data/test/Inertial Signals/body_gyro_x_test.txt")
test_body_gyro_y <- read.table("./data/test/Inertial Signals/body_gyro_y_test.txt")
test_body_gyro_z <- read.table("./data/test/Inertial Signals/body_gyro_z_test.txt")
test_total_acc_x <- read.table("./data/test/Inertial Signals/total_acc_x_test.txt")
test_total_acc_y <- read.table("./data/test/Inertial Signals/total_acc_y_test.txt")
test_total_acc_z <- read.table("./data/test/Inertial Signals/total_acc_z_test.txt")

# Bind all columns together - including mean and stdev of each observation
test_df <- cbind(test_subjects, c("TEST"), test_activities, rowMeans(test_x), apply(test_x, 1, sd),
    rowMeans(test_body_acc_x), apply(test_body_acc_x, 1, sd),
    rowMeans(test_body_acc_y), apply(test_body_acc_y, 1, sd),
    rowMeans(test_body_acc_z), apply(test_body_acc_z, 1, sd),
    rowMeans(test_body_gyro_x), apply(test_body_gyro_x, 1, sd),
    rowMeans(test_body_gyro_y), apply(test_body_gyro_y, 1, sd),
    rowMeans(test_body_gyro_z), apply(test_body_gyro_z, 1, sd),
    rowMeans(test_total_acc_x), apply(test_total_acc_x, 1, sd),
    rowMeans(test_total_acc_y), apply(test_total_acc_y, 1, sd),
    rowMeans(test_total_acc_z), apply(test_total_acc_z, 1, sd))
names(test_df) = c("subject_id", "type", "activity_name", "x_mean", "x_sd",
    "body_acc_x_mean", "body_acc_x_sd",
    "body_acc_y_mean", "body_acc_y_sd",
    "body_acc_z_mean", "body_acc_z_sd",
    "body_gyro_x_mean", "body_gyro_x_sd",
    "body_gyro_y_mean", "body_gyro_y_sd",
    "body_gyro_z_mean", "body_gyro_z_sd",
    "total_acc_x_mean", "total_acc_x_sd",
    "total_acc_y_mean", "total_acc_y_sd",
    "total_acc_z_mean", "total_acc_z_sd")


## TRAIN DATA

# Load list of subjects
train_subjects <- read.table("./data/train/subject_train.txt")
names(train_subjects) = c("subjectID")

# Load X and Y train results
train_x <- read.table("./data/train/X_train.txt")
train_y <- read.table("./data/train/y_train.txt")
# Join activitiy IDs to Names and keep only the names
names(train_y) = c("activityID")
train_activities <- merge(train_y, activity_labels, by = "activityID")$activityNm

# Load inertial data
train_body_acc_x <- read.table("./data/train/Inertial Signals/body_acc_x_train.txt")
train_body_acc_y <- read.table("./data/train/Inertial Signals/body_acc_y_train.txt")
train_body_acc_z <- read.table("./data/train/Inertial Signals/body_acc_z_train.txt")
train_body_gyro_x <- read.table("./data/train/Inertial Signals/body_gyro_x_train.txt")
train_body_gyro_y <- read.table("./data/train/Inertial Signals/body_gyro_y_train.txt")
train_body_gyro_z <- read.table("./data/train/Inertial Signals/body_gyro_z_train.txt")
train_total_acc_x <- read.table("./data/train/Inertial Signals/total_acc_x_train.txt")
train_total_acc_y <- read.table("./data/train/Inertial Signals/total_acc_y_train.txt")
train_total_acc_z <- read.table("./data/train/Inertial Signals/total_acc_z_train.txt")

# Bind all columns together - including mean and stdev of each observation
train_df <- cbind(train_subjects, c("TRAIN"), train_activities, rowMeans(train_x), apply(train_x, 1, sd),
    rowMeans(train_body_acc_x), apply(train_body_acc_x, 1, sd),
    rowMeans(train_body_acc_y), apply(train_body_acc_y, 1, sd),
    rowMeans(train_body_acc_z), apply(train_body_acc_z, 1, sd),
    rowMeans(train_body_gyro_x), apply(train_body_gyro_x, 1, sd),
    rowMeans(train_body_gyro_y), apply(train_body_gyro_y, 1, sd),
    rowMeans(train_body_gyro_z), apply(train_body_gyro_z, 1, sd),
    rowMeans(train_total_acc_x), apply(train_total_acc_x, 1, sd),
    rowMeans(train_total_acc_y), apply(train_total_acc_y, 1, sd),
    rowMeans(train_total_acc_z), apply(train_total_acc_z, 1, sd))
names(train_df) = c("subject_id", "type", "activity_name", "x_mean", "x_sd",
    "body_acc_x_mean", "body_acc_x_sd",
    "body_acc_y_mean", "body_acc_y_sd",
    "body_acc_z_mean", "body_acc_z_sd",
    "body_gyro_x_mean", "body_gyro_x_sd",
    "body_gyro_y_mean", "body_gyro_y_sd",
    "body_gyro_z_mean", "body_gyro_z_sd",
    "total_acc_x_mean", "total_acc_x_sd",
    "total_acc_y_mean", "total_acc_y_sd",
    "total_acc_z_mean", "total_acc_z_sd")

# Bind TEST and TRAIN data together
all_df <- rbind(test_df, train_df)


# Create a data set that contains the mean of each observation by subject and activity
subject_activity_df <- aggregate(cbind(x_mean, x_sd,
    body_acc_x_mean, body_acc_x_sd, body_acc_y_mean, body_acc_y_sd,
    body_acc_z_mean, body_acc_z_sd, body_gyro_x_mean, body_gyro_x_sd,
    body_gyro_y_mean, body_gyro_y_sd, body_gyro_z_mean, body_gyro_z_sd,
    total_acc_x_mean, total_acc_x_sd, total_acc_y_mean, total_acc_y_sd, 
    total_acc_z_mean, total_acc_z_sd)
    ~ subject_id + activity_name, data = all_df, mean)
