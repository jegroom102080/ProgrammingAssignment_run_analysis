# Assessment 1 - Code Book
===============================

## Source Data Info:

Info from the source data book, 

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
> 
> The sensor signals were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
> 
> Which can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
> 
> The dataset includes the following files:
> 
> - 'README.txt'
> 
> - 'features_info.txt'
> 
> - 'features.txt'
> 
> - 'activity_labels.txt'
> 
> - 'train/X_train.txt'
> 
> - 'train/y_train.txt'
> 
> - 'test/X_test.txt'
> 
> - 'test/y_test.txt'
> 
> The following files are available for the train and test data. 
> 
> - 'train/subject_train.txt'
> - 'train/Inertial Signals/total_acc_x_train.txt'
> 
> - 'train/Inertial Signals/body_acc_x_train.txt'
> 
> - 'train/Inertial Signals/body_gyro_x_train.txt'


===============================
##The Transformations:

First, training and testing data sets are merged to create a single data set. After, this data set is further modified to only include data pertaining to mean or standard deviation values.

