# Code Book
This Code Book describes the variables, the data, and any transformations or work performed to clean up the data

### The Data Source
The data source represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
[Full description of original data source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

[Here can be found the original data source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

###Goals
Createing one R script called ***run_analysis.R*** that does the following:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, the script creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###Tidy Data
####The Data Source
1. subject_test.txt 
2. subject_train.txt
3. X_test.txt  (*Test set*)
4. X_train.txt (*Training set*)
5. Y_test.txt  (*Test labels*)
6. Y_train.txt (*Training labels*)
7. features.txt (*List of all features*)
8. activity_labels.txt (*Links the class labels with their activity name*)

####How run_analysis.R works
1. Checks for a data directory and creates it if not exist.
2. Downloads file project.zip from the coursera project web site.
3. Sets the working directory.
4. Reads the test data tables.
5. Reads the trainint data tables.
6. Merges Subject tables and put result in to TSubject variable.
7. Merges Features tables and put result in to TX variable.
8. Merges Activity tables and put result in to TY variable.
9. Names columns in TSubject, TX, TY and prepares names for dataset with only the measurements of the mean and standard deviation for each measurement.
10. Merges the training and the test sets to create one data set named AllData.
11. Extracts only the measurements of the mean and standard (taking only the columns with "std" and "mean" in the name column) deviation for each measurements in a dataset named OnlyDataMS.
12. Creates names for dataset with only the measurements on the mean and standard deviation for each measurement and Subject and Activity.
13. Creates Dataset with only the measurements on the mean and standard deviation for each measurement and Subject and Activity named OnlyDataSet.
14. Uses descriptive activity names to names the activities in the data set.
15. Appropriately labels the data set with descriptive variable names. 
16. From the data set in step 4, creates a second, independent tidy data, named result, set with the average of each variable for each activity and each subject.

####The output dataset
The output dataset is a data frame with 180 observations on 81 variables and the following properties:

| **Column Name**  | **Column Class**  | **Str Length**      | **Valid Value**      | 
|:-----------------|:------------------|:--------------------|:---------------------|
|   Subject        |   integer         |  2                  | Value from 1 to 30   |
|   Activity       |   character       |  18                 | LAYING,              |   
|       *          |        *          |   *                 | SITTING              |                     
|       *          |        *          |   *                 | STANDING             |   
|       *          |        *          |   *                 | WALKING              |                      
|       *          |        *          |   *                 | WALKING_DOWNSTAIRS   |   
|       *          |        *          |   *                 | WALKING_UPSTAIRS     |

|**Column Name**                                    |**Column Class** | **Str Length** |**Value Min**       |**Value Max**        |
|:--------------------------------------------------|:----------------|:---------------|:-------------------|:--------------------|
|TimeBodyAccelerometer-mean()-X                     |numeric          |17            |0.22159824394       |0.3014610196         |
|TimeBodyAccelerometer-mean()-Y                     |numeric          |20            |-0.0405139534294    |-0.00130828765170213 |
|TimeBodyAccelerometer-mean()-Z                     |numeric          |19            |-0.152513899520833  |-0.07537846886       |
|TimeBodyAccelerometer-std()-X                      |numeric          |20            |-0.996068635384615  |0.626917070512821    |
|TimeBodyAccelerometer-std()-Y                      |numeric          |20            |-0.990240946666667  |0.616937015333333    |
|TimeBodyAccelerometer-std()-Z                      |numeric          |20            |-0.987658662307692  |0.609017879074074    |
|TimeGravityAccelerometer-mean()-X                  |numeric          |18            |-0.680043155060241  |0.974508732          |
|TimeGravityAccelerometer-mean()-Y                  |numeric          |19            |-0.479894842941176  |0.956593814210526    |
|TimeGravityAccelerometer-mean()-Z                  |numeric          |20            |-0.49508872037037   |0.9578730416         |
|TimeGravityAccelerometer-std()-X                   |numeric          |18            |-0.996764227384615  |-0.829554947808219   |
|TimeGravityAccelerometer-std()-Y                   |numeric          |18            |-0.99424764884058   |-0.643578361424658   |
|TimeGravityAccelerometer-std()-Z                   |numeric          |18            |-0.990957249538462  |-0.610161166287671   |
|TimeBodyAccelerometerJerk-mean()-X                 |numeric          |18            |0.0426880986186441  |0.130193043809524    |
|TimeBodyAccelerometerJerk-mean()-Y                 |numeric          |21            |-0.0386872111282051 |0.056818586275       |
|TimeBodyAccelerometerJerk-mean()-Z                 |numeric          |21            |-0.0674583919268293 |0.0380533591627451   |
|TimeBodyAccelerometerJerk-std()-X                  |numeric          |20            |-0.994604542264151  |0.544273037307692    |
|TimeBodyAccelerometerJerk-std()-Y                  |numeric          |19            |-0.989513565652174  |0.355306716915385    |
|TimeBodyAccelerometerJerk-std()-Z                  |numeric          |19            |-0.993288313333333  |0.0310157077775926   |
|TimeBodyGyroscope-mean()-X                         |numeric          |20            |-0.205775427307692  |0.19270447595122     |
|TimeBodyGyroscope-mean()-Y                         |numeric          |20            |-0.204205356087805  |0.0274707556666667   |
|TimeBodyGyroscope-mean()-Z                         |numeric          |21            |-0.0724546025804878 |0.179102058245614    |
|TimeBodyGyroscope-std()-X                          |numeric          |19            |-0.994276591304348  |0.267657219333333    |
|TimeBodyGyroscope-std()-Y                          |numeric          |19            |-0.994210471914894  |0.476518714444444    |
|TimeBodyGyroscope-std()-Z                          |numeric          |19            |-0.985538363333333  |0.564875818162963    |
|TimeBodyGyroscopeJerk-mean()-X                     |numeric          |19            |-0.157212539189362  |-0.0220916265065217  |
|TimeBodyGyroscopeJerk-mean()-Y                     |numeric          |19            |-0.0768089915604167 |-0.0132022768074468  |
|TimeBodyGyroscopeJerk-mean()-Z                     |numeric          |20            |-0.0924998531372549 |-0.00694066389361702 |
|TimeBodyGyroscopeJerk-std()-X                      |numeric          |18            |-0.99654254057971   |0.179148649684615    |
|TimeBodyGyroscopeJerk-std()-Y                      |numeric          |19            |-0.997081575652174  |0.295945926186441    |
|TimeBodyGyroscopeJerk-std()-Z                      |numeric          |19            |-0.995380794637681  |0.193206498960417    |
|TimeBodyAccelerometerMagnitude-mean()              |numeric          |21            |-0.986493196666667  |0.644604325128205    |
|TimeBodyAccelerometerMagnitude-std()               |numeric          |19            |-0.986464542615385  |0.428405922622222    |
|TimeGravityAccelerometerMagnitude-mean()           |numeric          |21            |-0.986493196666667  |0.644604325128205    |
|TimeGravityAccelerometerMagnitude-std()            |numeric          |19            |-0.986464542615385  |0.428405922622222    |
|TimeBodyAccelerometerJerkMagnitude-mean()          |numeric          |19            |-0.99281471515625   |0.434490400974359    |
|TimeBodyAccelerometerJerkMagnitude-std()           |numeric          |19            |-0.994646916811594  |0.450612065720513    |
|TimeBodyGyroscopeMagnitude-mean()                  |numeric          |19            |-0.980740846769231  |0.418004608615385    |
|TimeBodyGyroscopeMagnitude-std()                   |numeric          |19            |-0.981372675614035  |0.299975979851852    |
|TimeBodyGyroscopeJerkMagnitude-mean()              |numeric          |19            |-0.997322526811594  |0.0875816618205128   |
|TimeBodyGyroscopeJerkMagnitude-std()               |numeric          |19            |-0.997666071594203  |0.250173204117966    |
|FrequencyBodyAccelerometer-mean()-X                |numeric          |19            |-0.995249932641509  |0.537012022051282    |
|FrequencyBodyAccelerometer-mean()-Y                |numeric          |20            |-0.989034304057971  |0.524187686888889    |
|FrequencyBodyAccelerometer-mean()-Z                |numeric          |19            |-0.989473926666667  |0.280735952206667    |
|FrequencyBodyAccelerometer-std()-X                 |numeric          |20            |-0.996604570307692  |0.658506543333333    |
|FrequencyBodyAccelerometer-std()-Y                 |numeric          |20            |-0.990680395362319  |0.560191344          |
|FrequencyBodyAccelerometer-std()-Z                 |numeric          |19            |-0.987224804307692  |0.687124163703704    |
|FrequencyBodyAccelerometer-meanFreq()-X            |numeric          |21            |-0.635913046346154  |0.159123629063636    |
|FrequencyBodyAccelerometer-meanFreq()-Y            |numeric          |20            |-0.379518455061538  |0.466528231788462    |
|FrequencyBodyAccelerometer-meanFreq()-Z            |numeric          |20            |-0.520114793584906  |0.402532553395833    |
|FrequencyBodyAccelerometerJerk-mean()-X            |numeric          |20            |-0.994630797358491  |0.474317256051282    |
|FrequencyBodyAccelerometerJerk-mean()-Y            |numeric          |20            |-0.989398823913043  |0.276716853307692    |
|FrequencyBodyAccelerometerJerk-mean()-Z            |numeric          |19            |-0.992018447826087  |0.157775692377778    |
|FrequencyBodyAccelerometerJerk-std()-X             |numeric          |20            |-0.995073759245283  |0.476803887476923    |
|FrequencyBodyAccelerometerJerk-std()-Y             |numeric          |20            |-0.990468082753623  |0.349771285415897    |
|FrequencyBodyAccelerometerJerk-std()-Z             |numeric          |20            |-0.993107759855072  |-0.00623647528983051 |
|FrequencyBodyAccelerometerJerk-meanFreq()-X        |numeric          |19            |-0.576044001875     |0.331449281481482    |
|FrequencyBodyAccelerometerJerk-meanFreq()-Y        |numeric          |20            |-0.601971415384615  |0.195677336307692    |
|FrequencyBodyAccelerometerJerk-meanFreq()-Z        |numeric          |20            |-0.62755547372549   |0.230107945944444    |
|FrequencyBodyGyroscope-mean()-X                    |numeric          |19            |-0.99312260884058   |0.474962448333333    |
|FrequencyBodyGyroscope-mean()-Y                    |numeric          |19            |-0.994025488297872  |0.328817010088889    |
|FrequencyBodyGyroscope-mean()-Z                    |numeric          |19            |-0.985957788        |0.492414379822222    |
|FrequencyBodyGyroscope-std()-X                     |numeric          |18            |-0.994652185217391  |0.196613286661538    |
|FrequencyBodyGyroscope-std()-Y                     |numeric          |19            |-0.994353086595745  |0.646233637037037    |
|FrequencyBodyGyroscope-std()-Z                     |numeric          |19            |-0.986725274871795  |0.522454216314815    |
|FrequencyBodyGyroscope-meanFreq()-X                |numeric          |20            |-0.395770150677419  |0.249209411510602    |
|FrequencyBodyGyroscope-meanFreq()-Y                |numeric          |20            |-0.666814815306122  |0.273141323315789    |
|FrequencyBodyGyroscope-meanFreq()-Z                |numeric          |20            |-0.507490866734694  |0.3770740968         |
|FrequencyBodyAccelerometerMagnitude-mean()         |numeric          |20            |-0.986800645362319  |0.586637550769231    |
|FrequencyBodyAccelerometerMagnitude-std()          |numeric          |20            |-0.987648484461539  |0.178684580868889    |
|FrequencyBodyAccelerometerMagnitude-meanFreq()     |numeric          |21            |-0.312338030213846  |0.435846931652174    |
|FrequencyBodyAccelerometerJerkMagnitude-mean()     |numeric          |20            |-0.993998275797101  |0.538404846128205    |
|FrequencyBodyAccelerometerJerkMagnitude-std()      |numeric          |19            |-0.994366667681159  |0.316346415348718    |
|FrequencyBodyAccelerometerJerkMagnitude-meanFreq() |numeric          |21            |-0.125210388757581  |0.488088499666667    |
|FrequencyBodyGyroscopeMagnitude-mean()             |numeric          |20            |-0.986535242105263  |0.203979764835897    |
|FrequencyBodyGyroscopeMagnitude-std()              |numeric          |18            |-0.981468841692308  |0.236659662496296    |
|FrequencyBodyGyroscopeMagnitude-meanFreq()         |numeric          |21            |-0.456638670923077  |0.409521611525424    |
|FrequencyBodyGyroscopeJerkMagnitude-mean()         |numeric          |19            |-0.997617389275362  |0.146618569064407    |
|FrequencyBodyGyroscopeJerkMagnitude-std()          |numeric          |19            |-0.99758523057971   |0.287834616098305    |
|FrequencyBodyGyroscopeJerkMagnitude-meanFreq()     |numeric          |21            |-0.182923596577778  |0.426301679855072    |
