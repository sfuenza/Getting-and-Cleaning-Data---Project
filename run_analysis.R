##Course Project

##First we are going to use the "dplyr" package

library(plyr)

##PART 1

##Now we read the files of the data

##First Train
train_x <- read.table("UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("UCI HAR Dataset/train/Y_train.txt")
train_sub <- read.table("UCI HAR Dataset/train/subject_train.txt")

##Second Test

test_x <- read.table("UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_sub <- read.table("UCI HAR Dataset/test/subject_test.txt")

##Now we merge "Test" and "Train" to create the data for the next steps

X_data <-rbind(train_x,test_x)
Y_data <-rbind(train_y,test_y)
sub_data <-rbind(train_sub,test_sub)

##PART 2

##We read the table "Features"

feat <- read.table("UCI HAR Dataset/features.txt")

##We obtain the columns that have "mean" or "std" in their names

features_mean_and_std <- grep("-(mean|std)\\(\\)",feat[,2])

##First the data
X_data <- X_data[, features_mean_and_std]

##Now the names

names(X_data) <-feat[features_mean_and_std,2]

##PART 3

##Now the activity names

##We read the table
activ <- read.table("UCI HAR Dataset/activity_labels.txt")

##We first update the data

Y_data[,1] <- activ[Y_data[,1],2]

##Now the name

names(Y_data) <- "Activity"

##PART 4

##We change the name of the subject data

names(sub_data) <- "Subject"

##And now we gather all the data in 1 data set

Full_data <- cbind(X_data, Y_data, sub_data)

##PART 5

##Now we create the tidy data using only the mean except last 2 columns because are not numbers

mean_data <- ddply(Full_data, .(Subject, Activity), function(x) colMeans(x[,1:66]))

##Finally we write the data in a txt file

write.table(mean_data, "mean_data_project.txt", row.name=FALSE)








