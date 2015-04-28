# Coursera Project: Getting and Cleaning Data

This project explores one of the most exciting areas in all of data science right now: wearable computing. 

##Study Design
*The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
*Data for this project is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Raw Data
Test and Train data found in zip file: getdata-projectfiles-UCI HAR Dataset.zip


## Tidy data sets
* output.tidy.dataset1.txt - 10299 obs 81 variables  (subject, activity, 79 selected features for mean and std)
* output.tidy.dataset2.txt - 180 obs of 81 variables (Average of all 79 selected variables grouped by subject and activity)

## Codebook
###Steps from Raw to Tidy datasets

* Created an R script called run_analysis.R in same local repository as downloaded accelerometers data
* Loaded accelerometers data into R, which consists of traning and testing sets
* Merged the training and the test sets to create one data set.
* Extracted only measurements on the mean and standard deviation from dataset
* Assigned descriptive activity names to each activity ID in the data set
* Appropriately labeled accelerometer variables in the data set with descriptive variable names.
* Generated a first output data set called: output.tidy.dataset1.txt
* Based on first output dataset, created a second, independent tidy data set with the average of each variable for each activity and each subject.

###Variable description [Units]
* The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
Signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

* Subjects were numbered 1-30
* Activites had number index: 1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING



### Variable Transformations
Following helper functions were defined to assist variable name transformations
* pmatch.idx(pat, x, case.sen=FALSE, res.join=1) :Return index of matches
* format.names(x,suppress.sym)  : Transform varible names into Wellform format. List of symbols to suppress: ("\\(","\\)","-","\\,","_")
* map.to.desc(x, x.desc) : Function Definition to map ID to description 

### Features Variables after transformation
 [1] "tbodyacc.mean.x"                   "tbodyacc.mean.y"                   "tbodyacc.mean.z"                   "tbodyacc.std.x"                   
  [5] "tbodyacc.std.y"                    "tbodyacc.std.z"                    "tbodyacc.mad.x"                    "tbodyacc.mad.y"                   
  [9] "tbodyacc.mad.z"                    "tbodyacc.max.x"                    "tbodyacc.max.y"                    "tbodyacc.max.z"                   
 [13] "tbodyacc.min.x"                    "tbodyacc.min.y"                    "tbodyacc.min.z"                    "tbodyacc.sma"                     
 [17] "tbodyacc.energy.x"                 "tbodyacc.energy.y"                 "tbodyacc.energy.z"                 "tbodyacc.iqr.x"                   
 [21] "tbodyacc.iqr.y"                    "tbodyacc.iqr.z"                    "tbodyacc.entropy.x"                "tbodyacc.entropy.y"               
 [25] "tbodyacc.entropy.z"                "tbodyacc.arcoeff.x1"               "tbodyacc.arcoeff.x2"               "tbodyacc.arcoeff.x3"              
 [29] "tbodyacc.arcoeff.x4"               "tbodyacc.arcoeff.y1"               "tbodyacc.arcoeff.y2"               "tbodyacc.arcoeff.y3"              
 [33] "tbodyacc.arcoeff.y4"               "tbodyacc.arcoeff.z1"               "tbodyacc.arcoeff.z2"               "tbodyacc.arcoeff.z3"              
 [37] "tbodyacc.arcoeff.z4"               "tbodyacc.correlation.xy"           "tbodyacc.correlation.xz"           "tbodyacc.correlation.yz"          
 [41] "tgravityacc.mean.x"                "tgravityacc.mean.y"                "tgravityacc.mean.z"                "tgravityacc.std.x"                
 [45] "tgravityacc.std.y"                 "tgravityacc.std.z"                 "tgravityacc.mad.x"                 "tgravityacc.mad.y"                
 [49] "tgravityacc.mad.z"                 "tgravityacc.max.x"                 "tgravityacc.max.y"                 "tgravityacc.max.z"                
 [53] "tgravityacc.min.x"                 "tgravityacc.min.y"                 "tgravityacc.min.z"                 "tgravityacc.sma"                  
 [57] "tgravityacc.energy.x"              "tgravityacc.energy.y"              "tgravityacc.energy.z"              "tgravityacc.iqr.x"                
 [61] "tgravityacc.iqr.y"                 "tgravityacc.iqr.z"                 "tgravityacc.entropy.x"             "tgravityacc.entropy.y"            
 [65] "tgravityacc.entropy.z"             "tgravityacc.arcoeff.x1"            "tgravityacc.arcoeff.x2"            "tgravityacc.arcoeff.x3"           
 [69] "tgravityacc.arcoeff.x4"            "tgravityacc.arcoeff.y1"            "tgravityacc.arcoeff.y2"            "tgravityacc.arcoeff.y3"           
 [73] "tgravityacc.arcoeff.y4"            "tgravityacc.arcoeff.z1"            "tgravityacc.arcoeff.z2"            "tgravityacc.arcoeff.z3"           
 [77] "tgravityacc.arcoeff.z4"            "tgravityacc.correlation.xy"        "tgravityacc.correlation.xz"        "tgravityacc.correlation.yz"       
 [81] "tbodyaccjerk.mean.x"               "tbodyaccjerk.mean.y"               "tbodyaccjerk.mean.z"               "tbodyaccjerk.std.x"               
 [85] "tbodyaccjerk.std.y"                "tbodyaccjerk.std.z"                "tbodyaccjerk.mad.x"                "tbodyaccjerk.mad.y"               
 [89] "tbodyaccjerk.mad.z"                "tbodyaccjerk.max.x"                "tbodyaccjerk.max.y"                "tbodyaccjerk.max.z"               
 [93] "tbodyaccjerk.min.x"                "tbodyaccjerk.min.y"                "tbodyaccjerk.min.z"                "tbodyaccjerk.sma"                 
 [97] "tbodyaccjerk.energy.x"             "tbodyaccjerk.energy.y"             "tbodyaccjerk.energy.z"             "tbodyaccjerk.iqr.x"               
[101] "tbodyaccjerk.iqr.y"                "tbodyaccjerk.iqr.z"                "tbodyaccjerk.entropy.x"            "tbodyaccjerk.entropy.y"           
[105] "tbodyaccjerk.entropy.z"            "tbodyaccjerk.arcoeff.x1"           "tbodyaccjerk.arcoeff.x2"           "tbodyaccjerk.arcoeff.x3"          
[109] "tbodyaccjerk.arcoeff.x4"           "tbodyaccjerk.arcoeff.y1"           "tbodyaccjerk.arcoeff.y2"           "tbodyaccjerk.arcoeff.y3"          
[113] "tbodyaccjerk.arcoeff.y4"           "tbodyaccjerk.arcoeff.z1"           "tbodyaccjerk.arcoeff.z2"           "tbodyaccjerk.arcoeff.z3"          
[117] "tbodyaccjerk.arcoeff.z4"           "tbodyaccjerk.correlation.xy"       "tbodyaccjerk.correlation.xz"       "tbodyaccjerk.correlation.yz"      
[121] "tbodygyro.mean.x"                  "tbodygyro.mean.y"                  "tbodygyro.mean.z"                  "tbodygyro.std.x"                  
[125] "tbodygyro.std.y"                   "tbodygyro.std.z"                   "tbodygyro.mad.x"                   "tbodygyro.mad.y"                  
[129] "tbodygyro.mad.z"                   "tbodygyro.max.x"                   "tbodygyro.max.y"                   "tbodygyro.max.z"                  
[133] "tbodygyro.min.x"                   "tbodygyro.min.y"                   "tbodygyro.min.z"                   "tbodygyro.sma"                    
[137] "tbodygyro.energy.x"                "tbodygyro.energy.y"                "tbodygyro.energy.z"                "tbodygyro.iqr.x"                  
[141] "tbodygyro.iqr.y"                   "tbodygyro.iqr.z"                   "tbodygyro.entropy.x"               "tbodygyro.entropy.y"              
[145] "tbodygyro.entropy.z"               "tbodygyro.arcoeff.x1"              "tbodygyro.arcoeff.x2"              "tbodygyro.arcoeff.x3"             
[149] "tbodygyro.arcoeff.x4"              "tbodygyro.arcoeff.y1"              "tbodygyro.arcoeff.y2"              "tbodygyro.arcoeff.y3"             
[153] "tbodygyro.arcoeff.y4"              "tbodygyro.arcoeff.z1"              "tbodygyro.arcoeff.z2"              "tbodygyro.arcoeff.z3"             
[157] "tbodygyro.arcoeff.z4"              "tbodygyro.correlation.xy"          "tbodygyro.correlation.xz"          "tbodygyro.correlation.yz"         
[161] "tbodygyrojerk.mean.x"              "tbodygyrojerk.mean.y"              "tbodygyrojerk.mean.z"              "tbodygyrojerk.std.x"              
[165] "tbodygyrojerk.std.y"               "tbodygyrojerk.std.z"               "tbodygyrojerk.mad.x"               "tbodygyrojerk.mad.y"              
[169] "tbodygyrojerk.mad.z"               "tbodygyrojerk.max.x"               "tbodygyrojerk.max.y"               "tbodygyrojerk.max.z"              
[173] "tbodygyrojerk.min.x"               "tbodygyrojerk.min.y"               "tbodygyrojerk.min.z"               "tbodygyrojerk.sma"                
[177] "tbodygyrojerk.energy.x"            "tbodygyrojerk.energy.y"            "tbodygyrojerk.energy.z"            "tbodygyrojerk.iqr.x"              
[181] "tbodygyrojerk.iqr.y"               "tbodygyrojerk.iqr.z"               "tbodygyrojerk.entropy.x"           "tbodygyrojerk.entropy.y"          
[185] "tbodygyrojerk.entropy.z"           "tbodygyrojerk.arcoeff.x1"          "tbodygyrojerk.arcoeff.x2"          "tbodygyrojerk.arcoeff.x3"         
[189] "tbodygyrojerk.arcoeff.x4"          "tbodygyrojerk.arcoeff.y1"          "tbodygyrojerk.arcoeff.y2"          "tbodygyrojerk.arcoeff.y3"         
[193] "tbodygyrojerk.arcoeff.y4"          "tbodygyrojerk.arcoeff.z1"          "tbodygyrojerk.arcoeff.z2"          "tbodygyrojerk.arcoeff.z3"         
[197] "tbodygyrojerk.arcoeff.z4"          "tbodygyrojerk.correlation.xy"      "tbodygyrojerk.correlation.xz"      "tbodygyrojerk.correlation.yz"     
[201] "tbodyaccmag.mean"                  "tbodyaccmag.std"                   "tbodyaccmag.mad"                   "tbodyaccmag.max"                  
[205] "tbodyaccmag.min"                   "tbodyaccmag.sma"                   "tbodyaccmag.energy"                "tbodyaccmag.iqr"                  
[209] "tbodyaccmag.entropy"               "tbodyaccmag.arcoeff1"              "tbodyaccmag.arcoeff2"              "tbodyaccmag.arcoeff3"             
[213] "tbodyaccmag.arcoeff4"              "tgravityaccmag.mean"               "tgravityaccmag.std"                "tgravityaccmag.mad"               
[217] "tgravityaccmag.max"                "tgravityaccmag.min"                "tgravityaccmag.sma"                "tgravityaccmag.energy"            
[221] "tgravityaccmag.iqr"                "tgravityaccmag.entropy"            "tgravityaccmag.arcoeff1"           "tgravityaccmag.arcoeff2"          
[225] "tgravityaccmag.arcoeff3"           "tgravityaccmag.arcoeff4"           "tbodyaccjerkmag.mean"              "tbodyaccjerkmag.std"              
[229] "tbodyaccjerkmag.mad"               "tbodyaccjerkmag.max"               "tbodyaccjerkmag.min"               "tbodyaccjerkmag.sma"              
[233] "tbodyaccjerkmag.energy"            "tbodyaccjerkmag.iqr"               "tbodyaccjerkmag.entropy"           "tbodyaccjerkmag.arcoeff1"         
[237] "tbodyaccjerkmag.arcoeff2"          "tbodyaccjerkmag.arcoeff3"          "tbodyaccjerkmag.arcoeff4"          "tbodygyromag.mean"                
[241] "tbodygyromag.std"                  "tbodygyromag.mad"                  "tbodygyromag.max"                  "tbodygyromag.min"                 
[245] "tbodygyromag.sma"                  "tbodygyromag.energy"               "tbodygyromag.iqr"                  "tbodygyromag.entropy"             
[249] "tbodygyromag.arcoeff1"             "tbodygyromag.arcoeff2"             "tbodygyromag.arcoeff3"             "tbodygyromag.arcoeff4"            
[253] "tbodygyrojerkmag.mean"             "tbodygyrojerkmag.std"              "tbodygyrojerkmag.mad"              "tbodygyrojerkmag.max"             
[257] "tbodygyrojerkmag.min"              "tbodygyrojerkmag.sma"              "tbodygyrojerkmag.energy"           "tbodygyrojerkmag.iqr"             
[261] "tbodygyrojerkmag.entropy"          "tbodygyrojerkmag.arcoeff1"         "tbodygyrojerkmag.arcoeff2"         "tbodygyrojerkmag.arcoeff3"        
[265] "tbodygyrojerkmag.arcoeff4"         "fbodyacc.mean.x"                   "fbodyacc.mean.y"                   "fbodyacc.mean.z"                  
[269] "fbodyacc.std.x"                    "fbodyacc.std.y"                    "fbodyacc.std.z"                    "fbodyacc.mad.x"                   
[273] "fbodyacc.mad.y"                    "fbodyacc.mad.z"                    "fbodyacc.max.x"                    "fbodyacc.max.y"                   
[277] "fbodyacc.max.z"                    "fbodyacc.min.x"                    "fbodyacc.min.y"                    "fbodyacc.min.z"                   
[281] "fbodyacc.sma"                      "fbodyacc.energy.x"                 "fbodyacc.energy.y"                 "fbodyacc.energy.z"                
[285] "fbodyacc.iqr.x"                    "fbodyacc.iqr.y"                    "fbodyacc.iqr.z"                    "fbodyacc.entropy.x"               
[289] "fbodyacc.entropy.y"                "fbodyacc.entropy.z"                "fbodyacc.maxinds.x"                "fbodyacc.maxinds.y"               
[293] "fbodyacc.maxinds.z"                "fbodyacc.meanfreq.x"               "fbodyacc.meanfreq.y"               "fbodyacc.meanfreq.z"              
[297] "fbodyacc.skewness.x"               "fbodyacc.kurtosis.x"               "fbodyacc.skewness.y"               "fbodyacc.kurtosis.y"              
[301] "fbodyacc.skewness.z"               "fbodyacc.kurtosis.z"               "fbodyacc.bandsenergy.18"           "fbodyacc.bandsenergy.916"         
[305] "fbodyacc.bandsenergy.1724"         "fbodyacc.bandsenergy.2532"         "fbodyacc.bandsenergy.3340"         "fbodyacc.bandsenergy.4148"        
[309] "fbodyacc.bandsenergy.4956"         "fbodyacc.bandsenergy.5764"         "fbodyacc.bandsenergy.116"          "fbodyacc.bandsenergy.1732"        
[313] "fbodyacc.bandsenergy.3348"         "fbodyacc.bandsenergy.4964"         "fbodyacc.bandsenergy.124"          "fbodyacc.bandsenergy.2548"        
[317] "fbodyacc.bandsenergy.18"           "fbodyacc.bandsenergy.916"          "fbodyacc.bandsenergy.1724"         "fbodyacc.bandsenergy.2532"        
[321] "fbodyacc.bandsenergy.3340"         "fbodyacc.bandsenergy.4148"         "fbodyacc.bandsenergy.4956"         "fbodyacc.bandsenergy.5764"        
[325] "fbodyacc.bandsenergy.116"          "fbodyacc.bandsenergy.1732"         "fbodyacc.bandsenergy.3348"         "fbodyacc.bandsenergy.4964"        
[329] "fbodyacc.bandsenergy.124"          "fbodyacc.bandsenergy.2548"         "fbodyacc.bandsenergy.18"           "fbodyacc.bandsenergy.916"         
[333] "fbodyacc.bandsenergy.1724"         "fbodyacc.bandsenergy.2532"         "fbodyacc.bandsenergy.3340"         "fbodyacc.bandsenergy.4148"        
[337] "fbodyacc.bandsenergy.4956"         "fbodyacc.bandsenergy.5764"         "fbodyacc.bandsenergy.116"          "fbodyacc.bandsenergy.1732"        
[341] "fbodyacc.bandsenergy.3348"         "fbodyacc.bandsenergy.4964"         "fbodyacc.bandsenergy.124"          "fbodyacc.bandsenergy.2548"        
[345] "fbodyaccjerk.mean.x"               "fbodyaccjerk.mean.y"               "fbodyaccjerk.mean.z"               "fbodyaccjerk.std.x"               
[349] "fbodyaccjerk.std.y"                "fbodyaccjerk.std.z"                "fbodyaccjerk.mad.x"                "fbodyaccjerk.mad.y"               
[353] "fbodyaccjerk.mad.z"                "fbodyaccjerk.max.x"                "fbodyaccjerk.max.y"                "fbodyaccjerk.max.z"               
[357] "fbodyaccjerk.min.x"                "fbodyaccjerk.min.y"                "fbodyaccjerk.min.z"                "fbodyaccjerk.sma"                 
[361] "fbodyaccjerk.energy.x"             "fbodyaccjerk.energy.y"             "fbodyaccjerk.energy.z"             "fbodyaccjerk.iqr.x"               
[365] "fbodyaccjerk.iqr.y"                "fbodyaccjerk.iqr.z"                "fbodyaccjerk.entropy.x"            "fbodyaccjerk.entropy.y"           
[369] "fbodyaccjerk.entropy.z"            "fbodyaccjerk.maxinds.x"            "fbodyaccjerk.maxinds.y"            "fbodyaccjerk.maxinds.z"           
[373] "fbodyaccjerk.meanfreq.x"           "fbodyaccjerk.meanfreq.y"           "fbodyaccjerk.meanfreq.z"           "fbodyaccjerk.skewness.x"          
[377] "fbodyaccjerk.kurtosis.x"           "fbodyaccjerk.skewness.y"           "fbodyaccjerk.kurtosis.y"           "fbodyaccjerk.skewness.z"          
[381] "fbodyaccjerk.kurtosis.z"           "fbodyaccjerk.bandsenergy.18"       "fbodyaccjerk.bandsenergy.916"      "fbodyaccjerk.bandsenergy.1724"    
[385] "fbodyaccjerk.bandsenergy.2532"     "fbodyaccjerk.bandsenergy.3340"     "fbodyaccjerk.bandsenergy.4148"     "fbodyaccjerk.bandsenergy.4956"    
[389] "fbodyaccjerk.bandsenergy.5764"     "fbodyaccjerk.bandsenergy.116"      "fbodyaccjerk.bandsenergy.1732"     "fbodyaccjerk.bandsenergy.3348"    
[393] "fbodyaccjerk.bandsenergy.4964"     "fbodyaccjerk.bandsenergy.124"      "fbodyaccjerk.bandsenergy.2548"     "fbodyaccjerk.bandsenergy.18"      
[397] "fbodyaccjerk.bandsenergy.916"      "fbodyaccjerk.bandsenergy.1724"     "fbodyaccjerk.bandsenergy.2532"     "fbodyaccjerk.bandsenergy.3340"    
[401] "fbodyaccjerk.bandsenergy.4148"     "fbodyaccjerk.bandsenergy.4956"     "fbodyaccjerk.bandsenergy.5764"     "fbodyaccjerk.bandsenergy.116"     
[405] "fbodyaccjerk.bandsenergy.1732"     "fbodyaccjerk.bandsenergy.3348"     "fbodyaccjerk.bandsenergy.4964"     "fbodyaccjerk.bandsenergy.124"     
[409] "fbodyaccjerk.bandsenergy.2548"     "fbodyaccjerk.bandsenergy.18"       "fbodyaccjerk.bandsenergy.916"      "fbodyaccjerk.bandsenergy.1724"    
[413] "fbodyaccjerk.bandsenergy.2532"     "fbodyaccjerk.bandsenergy.3340"     "fbodyaccjerk.bandsenergy.4148"     "fbodyaccjerk.bandsenergy.4956"    
[417] "fbodyaccjerk.bandsenergy.5764"     "fbodyaccjerk.bandsenergy.116"      "fbodyaccjerk.bandsenergy.1732"     "fbodyaccjerk.bandsenergy.3348"    
[421] "fbodyaccjerk.bandsenergy.4964"     "fbodyaccjerk.bandsenergy.124"      "fbodyaccjerk.bandsenergy.2548"     "fbodygyro.mean.x"                 
[425] "fbodygyro.mean.y"                  "fbodygyro.mean.z"                  "fbodygyro.std.x"                   "fbodygyro.std.y"                  
[429] "fbodygyro.std.z"                   "fbodygyro.mad.x"                   "fbodygyro.mad.y"                   "fbodygyro.mad.z"                  
[433] "fbodygyro.max.x"                   "fbodygyro.max.y"                   "fbodygyro.max.z"                   "fbodygyro.min.x"                  
[437] "fbodygyro.min.y"                   "fbodygyro.min.z"                   "fbodygyro.sma"                     "fbodygyro.energy.x"               
[441] "fbodygyro.energy.y"                "fbodygyro.energy.z"                "fbodygyro.iqr.x"                   "fbodygyro.iqr.y"                  
[445] "fbodygyro.iqr.z"                   "fbodygyro.entropy.x"               "fbodygyro.entropy.y"               "fbodygyro.entropy.z"              
[449] "fbodygyro.maxinds.x"               "fbodygyro.maxinds.y"               "fbodygyro.maxinds.z"               "fbodygyro.meanfreq.x"             
[453] "fbodygyro.meanfreq.y"              "fbodygyro.meanfreq.z"              "fbodygyro.skewness.x"              "fbodygyro.kurtosis.x"             
[457] "fbodygyro.skewness.y"              "fbodygyro.kurtosis.y"              "fbodygyro.skewness.z"              "fbodygyro.kurtosis.z"             
[461] "fbodygyro.bandsenergy.18"          "fbodygyro.bandsenergy.916"         "fbodygyro.bandsenergy.1724"        "fbodygyro.bandsenergy.2532"       
[465] "fbodygyro.bandsenergy.3340"        "fbodygyro.bandsenergy.4148"        "fbodygyro.bandsenergy.4956"        "fbodygyro.bandsenergy.5764"       
[469] "fbodygyro.bandsenergy.116"         "fbodygyro.bandsenergy.1732"        "fbodygyro.bandsenergy.3348"        "fbodygyro.bandsenergy.4964"       
[473] "fbodygyro.bandsenergy.124"         "fbodygyro.bandsenergy.2548"        "fbodygyro.bandsenergy.18"          "fbodygyro.bandsenergy.916"        
[477] "fbodygyro.bandsenergy.1724"        "fbodygyro.bandsenergy.2532"        "fbodygyro.bandsenergy.3340"        "fbodygyro.bandsenergy.4148"       
[481] "fbodygyro.bandsenergy.4956"        "fbodygyro.bandsenergy.5764"        "fbodygyro.bandsenergy.116"         "fbodygyro.bandsenergy.1732"       
[485] "fbodygyro.bandsenergy.3348"        "fbodygyro.bandsenergy.4964"        "fbodygyro.bandsenergy.124"         "fbodygyro.bandsenergy.2548"       
[489] "fbodygyro.bandsenergy.18"          "fbodygyro.bandsenergy.916"         "fbodygyro.bandsenergy.1724"        "fbodygyro.bandsenergy.2532"       
[493] "fbodygyro.bandsenergy.3340"        "fbodygyro.bandsenergy.4148"        "fbodygyro.bandsenergy.4956"        "fbodygyro.bandsenergy.5764"       
[497] "fbodygyro.bandsenergy.116"         "fbodygyro.bandsenergy.1732"        "fbodygyro.bandsenergy.3348"        "fbodygyro.bandsenergy.4964"       
[501] "fbodygyro.bandsenergy.124"         "fbodygyro.bandsenergy.2548"        "fbodyaccmag.mean"                  "fbodyaccmag.std"                  
[505] "fbodyaccmag.mad"                   "fbodyaccmag.max"                   "fbodyaccmag.min"                   "fbodyaccmag.sma"                  
[509] "fbodyaccmag.energy"                "fbodyaccmag.iqr"                   "fbodyaccmag.entropy"               "fbodyaccmag.maxinds"              
[513] "fbodyaccmag.meanfreq"              "fbodyaccmag.skewness"              "fbodyaccmag.kurtosis"              "fbodybodyaccjerkmag.mean"         
[517] "fbodybodyaccjerkmag.std"           "fbodybodyaccjerkmag.mad"           "fbodybodyaccjerkmag.max"           "fbodybodyaccjerkmag.min"          
[521] "fbodybodyaccjerkmag.sma"           "fbodybodyaccjerkmag.energy"        "fbodybodyaccjerkmag.iqr"           "fbodybodyaccjerkmag.entropy"      
[525] "fbodybodyaccjerkmag.maxinds"       "fbodybodyaccjerkmag.meanfreq"      "fbodybodyaccjerkmag.skewness"      "fbodybodyaccjerkmag.kurtosis"     
[529] "fbodybodygyromag.mean"             "fbodybodygyromag.std"              "fbodybodygyromag.mad"              "fbodybodygyromag.max"             
[533] "fbodybodygyromag.min"              "fbodybodygyromag.sma"              "fbodybodygyromag.energy"           "fbodybodygyromag.iqr"             
[537] "fbodybodygyromag.entropy"          "fbodybodygyromag.maxinds"          "fbodybodygyromag.meanfreq"         "fbodybodygyromag.skewness"        
[541] "fbodybodygyromag.kurtosis"         "fbodybodygyrojerkmag.mean"         "fbodybodygyrojerkmag.std"          "fbodybodygyrojerkmag.mad"         
[545] "fbodybodygyrojerkmag.max"          "fbodybodygyrojerkmag.min"          "fbodybodygyrojerkmag.sma"          "fbodybodygyrojerkmag.energy"      
[549] "fbodybodygyrojerkmag.iqr"          "fbodybodygyrojerkmag.entropy"      "fbodybodygyrojerkmag.maxinds"      "fbodybodygyrojerkmag.meanfreq"    
[553] "fbodybodygyrojerkmag.skewness"     "fbodybodygyrojerkmag.kurtosis"     "angletbodyaccmeangravity"          "angletbodyaccjerkmeangravitymean" 
[557] "angletbodygyromeangravitymean"     "angletbodygyrojerkmeangravitymean" "anglexgravitymean"                 "angleygravitymean"                
[561] "anglezgravitymean"                


###Activity Description after transformation
[1] "walking"            "walking.upstairs"   "walking.downstairs" "sitting"            "standing"           "laying" 











