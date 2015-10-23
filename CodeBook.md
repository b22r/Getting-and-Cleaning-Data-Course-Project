Original Data

Original data set comes from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This data contains the results of an experiment of a group of 30 people performing six activities (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, and Laying) while wearing a wearable device to measure a variety of signals (e.g. accelerometer, gyroscope).  

A more detailed description is contained in the data set read:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


There were two main data sets—one was on test data, and the other on training data.

The files used are:
features_list.txt: List of features
activity_labels.txt: List of activities
X_train.txt: X-axis for training data
Y_train.txt: Y-axis for training data
subject_train.txt: Subject list for training data
X_test.txt: X-axis for testing data
Y_test.txt: Y-axis for testing data
subject_test.txt: Subject list for testing data

Data Transformations Performed
Both the training and test data had the following components:
X-axis: For each of a list of features, the values for each student and activity
Y-axis: The list of activities
Subject: The list of subjects

These three files were combined separately for test and training data, and then combined by stacking the rows on top of each other to create a merged dataset.

The next step was to just get mean and standard deviation metrics, which was done by filtering the dataset for only mean or standard deviation features.  Features including meanFreq or angle calculations, which had mean / std in the description were not included as those are not raw mean or standard deviation metrics.

This was then mapped to more descriptive activities names, which was provided.

The resulting variables were then relabeled to be clearer.

Finally, a second data set was created with the average of each of these metrics by subject and activity.

Variables List

The list of variables in the output file is as follows:

1	Subject Number
2	Activity Name
3	Time: Body Acceleration Mean X
4	Time: Body Acceleration Mean Y
5	Time: Body Acceleration Mean Z
6	Time: Body Acceleration Std Dev X
7	Time: Body Acceleration Std Dev Y
8	Time: Body Acceleration Std Dev Z
9	Time: Gravity Acceleration Mean X
10	Time: Gravity Acceleration Mean Y
11	Time: Gravity Acceleration Mean Z
12	Time: Gravity Acceleration Std Dev X
13	Time: Gravity Acceleration Std Dev Y
14	Time: Gravity Acceleration Std Dev Z
15	Time: Body Acceleration Jerk Mean X
16	Time: Body Acceleration Jerk Mean Y
17	Time: Body Acceleration Jerk Mean Z
18	Time: Body Acceleration Jerk Std Dev X
19	Time: Body Acceleration Jerk Std Dev Y
20	Time: Body Acceleration Jerk Std Dev Z
21	Time: Body Gyroscope Mean X
22	Time: Body Gyroscope Mean Y
23	Time: Body Gyroscope Mean Z
24	Time: Body Gyroscope Std Dev X
25	Time: Body Gyroscope Std Dev Y
26	Time: Body Gyroscope Std Dev Z
27	Time: Body Gyroscope Jerk Mean X
28	Time: Body Gyroscope Jerk Mean Y
29	Time: Body Gyroscope Jerk Mean Z
30	Time: Body Gyroscope Jerk Std Dev X
31	Time: Body Gyroscope Jerk Std Dev Y
32	Time: Body Gyroscope Jerk Std Dev Z
33	Time: Body Acceleration Magnitude Mean
34	Time: Body Acceleration Magnitude Std Dev
35	Time: Gravity Acceleration Magnitude Mean
36	Time: Gravity Acceleration Magnitude Std Dev
37	Time: Body Acceleration Jerk Magnitude Mean
38	Time: Body Acceleration Jerk Magnitude Std Dev
39	Time: Body Gyroscope Magnitude Mean
40	Time: Body Gyroscope Magnitude Std Dev
41	Time: Body Gyroscope Jerk Magnitude Mean
42	Time: Body Gyroscope Jerk Magnitude Std Dev
43	Fourier: Body Acceleration Mean X
44	Fourier: Body Acceleration Mean Y
45	Fourier: Body Acceleration Mean Z
46	Fourier: Body Acceleration Std Dev X
47	Fourier: Body Acceleration Std Dev Y
48	Fourier: Body Acceleration Std Dev Z
49	Fourier: Body Acceleration Jerk Mean X
50	Fourier: Body Acceleration Jerk Mean Y
51	Fourier: Body Acceleration Jerk Mean Z
52	Fourier: Body Acceleration Jerk Std Dev X
53	Fourier: Body Acceleration Jerk Std Dev Y
54	Fourier: Body Acceleration Jerk Std Dev Z
55	Fourier: Body Gyroscope Mean X
56	Fourier: Body Gyroscope Mean Y
57	Fourier: Body Gyroscope Mean Z
58	Fourier: Body Gyroscope Std Dev X
59	Fourier: Body Gyroscope Std Dev Y
60	Fourier: Body Gyroscope Std Dev Z
61	Fourier: Body Acceleration Magnitude Mean
62	Fourier: Body Acceleration Magnitude Std Dev
63	Fourier: BodyBody Acceleration Jerk Magnitude Mean
64	Fourier: BodyBody Acceleration Jerk Magnitude Std Dev
65	Fourier: BodyBody Gyroscope Magnitude Mean
66	Fourier: BodyBody Gyroscope Magnitude Std Dev
67	Fourier: BodyBody Gyroscope Jerk Magnitude Mean
68	Fourier: BodyBody Gyroscope Jerk Magnitude Std Dev

The values shown are averaged by subject and activity.  A more detailed explanation of each variable is contained in the dataset read:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
