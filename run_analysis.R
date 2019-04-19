#run_analysis.R
#setwd("C:/laptop_DWC/Coursera/Getting and cleaning data/UCI_HAR_Dataset")

#Reading feature names
features <- read.csv('features.txt', sep = ' ', header= FALSE, col.names= c('id', 'feature') )
activity_labels <- read.csv('activity_labels.txt', sep = ' ', header= FALSE, col.names= c('id', 'activity_label') )


#Some variables for support
vector_of_lengths = rep(15,561)

#Reading train data
subject_train <- read.csv('train/subject_train.txt', header= FALSE)
X_train <- X_train <- read.fwf(file='train/X_train.txt', widths= vector_of_lengths , header = FALSE, sep = "\t", skip = 0,  buffersize = 10000, col.names = features$feature)
Y_train <- read.csv('train/Y_train.txt', header= FALSE)

#Reading test data
subject_test <- read.csv('test/subject_test.txt', header= FALSE)
X_test <- X_test <- read.fwf(file='test/X_test.txt', widths= vector_of_lengths , header = FALSE, sep = "\t", skip = 0,  buffersize = 10000, col.names = features$feature)
Y_test <- read.csv('test/Y_test.txt', header= FALSE)

names(subject_test) <- 'subject'
names(subject_train) <- 'subject'
names(Y_test) <- 'activity'
names(Y_train) <- 'activity'

#Extracts only the measurements on the mean and standard deviation for each measurement.
X_test <- X_test[, grep("mean|std", names(X_test), perl=TRUE, value=FALSE) ]
X_train <- X_train[, grep("mean|std", names(X_train), perl=TRUE, value=FALSE) ]

Y_test <- merge(Y_test, activity_labels, by.x='activity', by.y = 'id')
Y_train <- merge(Y_train, activity_labels, by.x='activity', by.y = 'id')

test_ds <- cbind(subject_test, Y_test, X_test)
train_ds <- cbind(subject_train, Y_train, X_train)

#Union both datasets
union_ds <- rbind(test_ds, train_ds)

#merged_ds <- merge(test_ds, train_ds, by.x = 'subject', by.y = 'subject', all = TRUE)
#union_ds <- union(test_ds, train_ds)


#Make a copy
average_ds <- union_ds
  
#Remove columns
average_ds$activity_label<- NULL

average_ds <- sapply(average_ds, function( x ) mean(as.numeric(x)) )


write.table(average_ds, file='my_data.txt', row.name=FALSE)









