Data-Cleaning-Project
=====================

This is a project which I completed for the Getting and Cleaning Data course, conducted by John Hopkins University. It contains description of the process followed for cleaning the data, as well as the code for doing it.


The project objective was to obtain, clean and organize a particular dataset which was provided by the instructors. The data cleaning, organizing and extraction tasks were done in accordance to the instructions given. Essentially, the following sequence of steps were followed:
* Reading the training and testing datasets. For each of training and testing data, three files were considered: (i) the file with feature data (ii) the file with activity label (iii) the file with subject IDs
* Each column of the dataset were given appropriate names. The names of the columns in training and testing feature set were extracted from the feature file. Descriptive names were given to the columns in activity and subject ID datasets. For example, the column in activity dataset was named ActivityLabel
* The feature, activity and subject ID datasets corresponding to the training and testing data were first bound column-wise, to create the complete training and testing dataset. These two datasets were rowmerged, creating the complete dataset
* The columns containing the measurements on mean and standard deviation were extracted using regular expression, with the help of grep() command, and stored in a new data frame. The columns consisting of meanFreq() were ignored, as it consisted of a weighted average of the frequency components. Therefore, if required, it can be derived from the individual frequency components of respective variables. 
* The activities present in the new dataframe were given their descriptive names by merging the data frame with the data frame containing the labels for activities
* Each column variable were given descriptive names to improve readability. Specifically, variable for time domain were prefixed with time, and those for frequency domain were prefixed with frequency. Also, mag and acc were expanded to magnitude and acceleration
* The newly obtained dataframe is organized based on the activity and the subject ID. This is because the Subject ID and Activity Label together form the primary key of this database, and therefore all the variables have been organized based on these two columns. The average value of the remaining variables were calculated. 
* Finally, the fully organized dataset, with the activitylabel and subject ID as key, and containing the average of the measures for remaining variables, were stored in a new text file called tidyData.txt

   

