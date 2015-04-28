rm(list=ls())

#install.packages("dplyr", dependencies=TRUE)
library(utils)
library(dplyr)


#------------------------------------------------------------
#Function Definition - Return index of matches
#------------------------------------------------------------
pmatch.idx<-function(pat, x, case.sen=FALSE, res.join=1){ 
  #pat      : pattern:character vector containing list of words to be searched
  #x        : character vector where matches are sought
  #res.join : indicates how the partial results of pat list should be joined
  #         -> 1: UNION (default)
  #         -> 2: INTERSECTION
  #case.sen : logical indicator to indicate whether searches should be made case sensitive or not  
  
  
  #Constant definition
  UNION       =1
  INTERSECTION=2
  
  idx<-c()
  if(!case.sen){
    x<-tolower(x); 
    pat<-tolower(pat)
  } 
  for(i in seq_along(pat)){    
    if(res.join == UNION ){
      idx<-c(idx, grep(pat[i], x))
    }else if(res.join == INTERSECTION){
      if(i > 1){        
        idx<-intersect(idx, grep(pat[i], x))
      }else {idx<-grep(pat[i], x)}
    }
    
  }    
  return(idx)  
}


#------------------------------------------------------------
# Function Definition - Transform varible names into Wellform format
#------------------------------------------------------------
format.names<-function(x,suppress.sym){
  #x: names list
  #suppress.sym: sysmbols to be deleted from names list
  
  #Rules to follow
  #1) All lower cases
  #2) Descriptive
  #3) Not duplicated
  #4) No underscores or whitespaces  
  x<-tolower(x)
  for(i in seq_along(suppress.sym)){
    #Replace underscore/hyphen with "."
    if(suppress.sym[i]=="_" | suppress.sym[i]=="-")
      x<-gsub(suppress.sym[i],".", x)
    else
      x<-gsub(suppress.sym[i],"", x)
  }
  x  
}

#------------------------------------------------------------
# Function Definition to map ID to description 
#------------------------------------------------------------
map.to.desc<-function(x, x.desc){
  # x: ID vector
  # x.desc: 2D matrix containing ID (1st col), DESC (2nd col)
  y<-rep(NULL,length(x))
  for(i in seq_along(x)){
    idx<-which(x.desc[,1]==x[i])
    y[i]<-x.desc[idx,2]
  }
  return(y)  
}

#***************************************************************#
#                       Data Processing
#***************************************************************#

# Load data
#----------------------------------
#Check if files already exist
zip <- "getdata-projectfiles-UCI HAR Dataset.zip"
dir<-"UCI HAR Dataset"

if(!file.exists(dir)) {
  #Unzip file
  if(!zip %in% list.files()) { stop("did not find data file or zip file") } 
  unzip(zip) ## unzip to get txt file
}else{print("Folder exists already!")}	


#-----------------------------------------------------------------
# (1) Merges the training and the test sets to create one data set.
#-----------------------------------------------------------------
test.path<-paste(".",dir,"test", sep="/")
train.path<-paste(".",dir,"train", sep="/")

#train/Test file list
test.fl<-list.files(test.path, full.names = TRUE)
test.fl
train.fl<-list.files(train.path, full.names = TRUE)
train.fl

# x data set
#----------------------------------------
#Test/X : dataset: 2947 obs vs 561 variables
x.test<-read.table(test.fl[3])
#Train/X : dataset: 7352 obs vs 561 variables
x.train<-read.table(train.fl[3])
#Merge
x.data<-rbind(x.test,x.train)

#Subject set
#----------------------------------------
subj.test<-read.table(test.fl[2], sep=" ")
subj.train<-read.table(train.fl[2], sep=" ")
#merge
subj.data<-rbind(subj.test, subj.train)

#Activities y-set
#----------------------------------------
act.test<-read.table(test.fl[4])
act.train<-read.table(train.fl[4])
act.data<-rbind(act.test, act.train)

#Access Root folder Files
root.fl<-list.files(dir, full.names = TRUE)

#Load featues - 561  (variables)
fea.desc<-read.table(root.fl[2])
#collect x-data header names
hdr.names<-as.character(fea.desc[,2])
hdr.names[540:561]

#Load Activities (names)
#Note: Each person performed six activities 
#(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
act.desc<-read.table(root.fl[1])


#----------------------------------------------------------------------
# (2) Extract only the measurements on the mean and standard deviation 
#     for each measurement.
#----------------------------------------------------------------------
#search for pattern
pattern<-c("mean()", "std()")
UNION<-1
#retrieve idx of pattern
idx.mu.std<-pmatch.idx(pattern, hdr.names, case.sen=TRUE, res.join=UNION)  
#idx.mu.std: has 79 hits
hdr.names[idx.mu.std]

#subset x-data to columns measuring mean() and std()
x.data<-x.data[, idx.mu.std]

#----------------------------------------------------------------------
#3. Uses descriptive activity names to name the activities in the data set
#----------------------------------------------------------------------

#list of symbols to suppress
suppress.sym<-c("\\(","\\)","-","\\,","_")
#Format activity names: toLower and replace "_" with "."
act.desc #Before
act.desc[,2]<-format.names(x=act.desc[,2],suppress.sym)
act.desc #After

#Replace Activity ID in data with descriptive name
head(act.data)
act.data[,1]<-map.to.desc(act.data[,1], act.desc)
head(act.data)

#----------------------------------------------------------------------
#4. Appropriately label the data set with descriptive variable names.
#----------------------------------------------------------------------

#list of symbols to suppress
suppress.sym<-c("\\(","\\)","-","\\,","_")

#Format header names
hdr.names[200-250]
hdr<-format.names(x=hdr.names,suppress.sym)
hdr[200-250]

#assign meaningful header names (feature desc) to x.data
names(x.data) #before: V1, V2 ...
names(x.data)<-hdr[idx.mu.std]
names(x.data)

#----------------------------------------------------------------------
#Combine all data to single data.frame
#----------------------------------------------------------------------
#data frame

df1<-data.frame(subject=subj.data[,1], activity=act.data[,1], x.data)
head(df1[,1:10])
head(df1[,70:79])
#Write output to table file
write.table(df1, "output.tidy.dataset1.txt", row.names=FALSE)


#----------------------------------------------------------------------
# 5) 2nd dataset: Average of each variable for each activity and each subject
#----------------------------------------------------------------------
df2 <- group_by(df1, subject, activity)
head(df2[,1:10], 10)

#summerize grouped data
# Note:  Grouping variables are always excluded from modification.
summarise_each(df2, funs(mean))
df2.su<-summarise_each(df2, funs(mean))
class(df2.su)
#Write output to table file
write.table(df2.su, "output.tidy.dataset2.txt", row.names=FALSE)
print("Output2 finished!")
