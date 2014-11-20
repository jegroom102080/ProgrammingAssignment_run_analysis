dataDirectory  <- "/Users/Jason/Documents/R_Programming/CleaningDataProject/UCI HAR Dataset"
testDirectory  <- paste(dataDirectory, "test", sep="/")
trainDirectory <- paste(dataDirectory, "train", sep="/")

### Required packages
if (!require("plyr")) {
        install.packages("plyr")
        require("plyr")
}
if (!require("reshape2")) {
        install.packages("reshape2")
        require("reshape2")
}

#1.- Merges the training and the test sets to create one data set.
### Reading data files
subject_test  <- read.table(paste(testDirectory, "subject_test.txt", sep="/"), sep="\n", strip.white=T)
subject_train <- read.table(paste(trainDirectory, "subject_train.txt", sep="/"), sep="\n", strip.white=T)

feature_names <- read.table(paste(dataDirectory, "features.txt", sep="/"), sep="\n", strip.white=T)
feature_names <- gsub("^[0-9]+ ", "", feature_names$V1)

y_train <- read.table(paste(trainDirectory, "y_train.txt", sep="/"), sep="\n", strip.white=T)
y_test  <- read.table(paste(testDirectory, "y_test.txt", sep="/"), sep="\n", strip.white=T)
x_train <- read.table(paste(trainDirectory, "X_train.txt", sep="/"), sep="\n", strip.white=T)
x_test  <- read.table(paste(testDirectory, "X_test.txt", sep="/"), sep="\n", strip.white=T)

#2.- Extracts only the measurements on the mean and standard deviation for each measurement.
# Keep only features involving mean or std values
keep_features <- grepl("mean|std", feature_names)

# Break single column into multiples
x_train <- ldply(strsplit(gsub(" {2,}", " ", x_train$V1), " "))
x_test  <- ldply(strsplit(gsub(" {2,}", " ", x_test$V1), " "))

# Bind predicted value with subject and features
train <- cbind(y_train, subject_train, x_train)
test  <- cbind(y_test, subject_test, x_test)

# Deleting R used objects, we won't need on the future
rm(y_train, x_train, y_test, x_test, subject_train, subject_test)

# Combine train and test data sets
combined_data <- rbind(train, test)
# rm(train, test)

# Take data frame columns 
combined_data <- combined_data[,c(TRUE, TRUE, keep_features)]

#3.- Uses descriptive activity names to name the activities in the data set.
# Label columns
column_headers <- c("activity", "subject", feature_names[keep_features])
rm(feature_names, keep_features)

#4.- Appropriately labels the data set with descriptive activity names.
colnames(combined_data) <- column_headers

# make feature factor values numeric values
for (i in 3:ncol(combined_data)){
        combined_data[,i] <- as.numeric(combined_data[,i])
}
write.table(combined_data, file="tidy_set.txt")

# 5.- Creates a second, independent tidy data set with the average of 
# each variable for each activity and subject
means_data <- aggregate(combined_data[,3] ~ combined_data$subject + combined_data$activity, data = combined_data, FUN = mean)

for (i in 4:ncol(combined_data)){
        means_data[,i] <- aggregate( combined_data[,i] ~ combined_data$subject + combined_data$activity, data = combined_data, FUN = mean )[,3]
}
colnames(means_data) <- column_headers

write.table(means_data, file="mean_sd.txt")