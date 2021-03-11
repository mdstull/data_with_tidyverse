# Introduction to Data Analysis and Visualization with R and Tidyverse 
# by Matt Steele, WVU

# R download and documentation - https://cran.r-project.org/
# RStudio download and documentation - https://rstudio.com/
# RStudio Cloud - http://rstudio.cloud/

# This workshop was developed using the O'Reilly Platform Lesson video - R Programming for Statistics and Data Science - which can accessed at 
# https://libwvu.on.worldcat.org/oclc/1062397089
# For more in-depth information and practical exercises on using R for Data science, I highly suggest using this resource

#Setting Working Directory

getwd()
setwd("~/RProjects/LessonPlan_SPR2021/DataAnalysisR")

#Tidyverse is a collection of packages for data analysis and data visualizations

install.packages("tidyverse")
library(tidyverse)

#ggplot2 - data visualization - https://ggplot2.tidyverse.org/

#tibble - lighter and more user-friendly version of data.frame() - https://tibble.tidyverse.org/

#tidyr - create tidy and meaningfully arranged data - https://tidyr.tidyverse.org/

#readr - sidesteps the limitations of the R functions when importing data into R - https://readr.tidyverse.org/

#purrr - better functional programming = https://purrr.tidyverse.org/

#dplyr - data manipulation tools - https://dplyr.tidyverse.org/

vignette("dplyr")


#Import Data into R

#Make sure your working directory is set to where you want it to be. YOu can do so with the code listed below or by using Session in the R menu

getwd()
setwd("insert your wd")


#For example if I was to set my dirctory to my desktop it would be 
#setwd("C:/Users/Matt/Desktop")

#read.table("file.name", sep = , header = , stringsAsFactors = )
#sep - what separates your data values (i.e. comma, tab, space)
#header= does it have a header row or not
#stringsAsFactors = should R encode your string variables as factors


my.house <- read.csv("house_2018_bystate.csv")
my.house

view(my.house)



#read.csv is a shortcut for csv files that defaults to comma separated and first row headers 
#read.csv("file.name", stringAsFactors =  )

#read.delim similarly is a shortcut for tab delimited files ?read.delim for more information

#if there are multiple rows of text before the header use the read.table(..., skip = n)

#if you only want to read a particular number of rows use the read.table(..., nrows = n)


#Getting a Sense of Your Data

#nrow(...) - number of columns
#ncol(...) - number of rows
#colnames (...) - names of the columns 
#rownames(...) - names of the rows
#str(...) - structure of the dataset
#summary(...) - descriptive statistics of the objects in the dataset

my.house

nrow(my.house)
colnames(my.house)

summary(my.house)

#Subsetting Data Frames

my.house

# View a Variable using $

my.house$Majority_seats


#head(data) - returns the first part of the object

head(my.house)

#$ - subsets the column name

summary(my.house$Total_vote)

#Tibble package

my.house <- as_tibble(my.house)
my.house


#Quick Cleanup

my.house$Majority_seats <- as.factor(my.house$Majority_seats)
my.house$Majority_votes <- as.factor(my.house$Majority_votes)
my.house
summary(my.house)








