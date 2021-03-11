#Data Visualization

#ggplot - https://ggplot2.tidyverse.org/

#Use the cheat sheet to see what you options are


library(tidyverse)

#Structure of Plots
  #Data - data you plotting
  #Aesthetics - what you map on x and y axis
  #Geometries - how your data will be represented visually

#First three are mandatory to create a plot. The following four are for flourish

  #Facets - discrete subplots that you graph can be split into 
  #Stats - statistical transformations you may choose to use
  #Coordinates - where data is plotted
  #Themes - non-data related information (fonts, colors)



#Data

getwd()



trump.approval <- read.csv("approval_topline.csv")

str(trump.approval)
trump.approval <- as_tibble(trump.approval)
trump.approval

trump.approval$modeldate <- as.Date(trump.approval$modeldate, '%m/%d/%Y')
trump.approval$subgroup <- as.factor(trump.approval$subgroup)
summary(trump.approval)


#Aesthetics
sc.trump.approval <- ggplot(trump.approval, aes(modeldate, approve_estimate))
sc.trump.approval


#Geometries

sc.trump.approval + geom_point()

#Facets

sc.trump.approval + geom_point() + facet_grid(subgroup ~.)

#Statistics

sc.trump.approval + geom_point() + facet_grid(subgroup ~.) + stat_smooth()

#Coordinates

sc.trump.approval + geom_point() + facet_grid(subgroup ~.) + stat_smooth() + scale_x_date(date_labels = '%m/%d/%Y', limits = as.Date(c("2020-10-01", "2020-10-28")))

#This is a unique instance because the x value is a date. Typically you would use the function coord_cartesian(10,50) for integers and doubles. For more information - ?coord_cartesian

#Theme


sc.trump.approval + geom_point(aes(modeldate, approve_estimate, color = "red")) + theme_classic() + geom_smooth() + labs(y="Approval", x = "Date", title = "Donald Trump Presidential Approval")
 

#Example Histogram


df <- read.csv("titanic.csv", stringsAsFactors = F)
df <- as_tibble(df)
df



df$Survived <- as.factor(df$Survived)
df$Pclass <- as.factor(df$Pclass)
df$Sex <- as.factor(df$Sex)
df$Embarked <- as.factor(df$Embarked)
df


hist <- ggplot(data = df, aes(x = Age))

hist + geom_histogram(binwidth = 5)

#bins tie a range of numbers together, in this example we are tying 0-5, 5-10, etc. So what would happen if we made the bin 15

hist + geom_histogram(binwidth = 15)

#see the difference



#Give it some color
hist + geom_histogram(binwidth = 5, color = "darkslategray", fill = "darkslategray4", alpha = 0.5)

#Give in a Title
hist + geom_histogram(binwidth = 5, color = "darkslategray", fill = "darkslategray4", alpha = 0.5) +
  ggtitle("Age Distribution on the Titanic")

#Give the x and y axis some labels
hist + geom_histogram(binwidth = 5, color = "darkslategray", fill = "darkslategray4", alpha = 0.5) +
  ggtitle("Age Distribution on the Titanic") +
  labs(y = "Number of Passangers", x = "Age")

#Give it a new theme
hist + geom_histogram(binwidth = 5, color = "darkslategray", fill = "darkslategray4", alpha = 0.5) +
  ggtitle("Age Distribution on the Titanic") +
  labs(y = "Number of Passangers", x = "Age") +
  theme_minimal()

#Try a bar graph

bar <- ggplot(df, aes(x = Sex,  fill = Survived)) #binds the variable Sex and Survived
bar + geom_bar() + theme_light() +
  labs(y = "Passenger Count",
       x = "Gender",
       title = "Survival Rate by Gender") +
  facet_wrap(Sex ~ Pclass) #breaks the plot based on passenger class

#That is it for Data visualization. Next we are going to look at getting descriptive statistics. Please open the script 5_Exploratorty_data_analysis.R
