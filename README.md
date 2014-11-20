ProgrammingAssignment_run_analysis
==================================

repository for the run Analysis programming assignment for the getting and cleaning data class. 

# Assessment - `run_analyis.R`
===========================================

This file explains how the scripts of this repo work.

The R script `run_analysis.R` will process the required data (See below under source). Then, it creates two new tidy data sets:

#Output of 'run_analysis.R'
===================================

- `tidy_set.txt` : combines training and test data sets (together with subject and activity data).

- `mean_sd.txt` : aggregates the data by subject and activity (the mean of multiple trials for each feature is taken).


====================
## Source

Information about used data in: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Used data set: [zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) (NOTE: the R script created will require the file be unzipped in the working directory).


====================
## Dependencies

`run_analysis.R` depends on `reshape2` and `plyr` libraries (NOTE: The R script created will install and load them if necessary).