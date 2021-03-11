#Exploratory Data Analysis

library(tidyverse)
install.packages("haven")
library(haven)
sample.survey = read_sav("demo.sav")
sample.survey <- as_tibble(sample.survey)
sample.survey

#Central Tendency

summary(sample.survey)

#mean the average of observed cases

mean(sample.survey$income)



#median - the middle number(s) of the dataset

median(sample.survey$income)

sampleAge <- sample(sample.survey$age, 600)
sampleAge

avgSampleAge <- median(sampleAge)
avgSampleAge


#mode - most commonly occurring number
x <- table((sample.survey$inccat))
x
names(x)[which(x==max(x))]

#Measures of asymmetry

#skewness - indicates whether the observations in a data set are concentrated to one side


demo.histogram <- ggplot(data = sample.survey, aes(x = income))
demo.histogram + geom_histogram(binwidth = 15, color = "darkslategray", fill = "darkslategray4", alpha = 0.5) +
  ggtitle("Income") +
  labs(y = "Count", x = "Total Income") +
  theme_minimal() 

#Positive Skew is a skew to the right
#Negative Skew is a skew to the left
#Complete symmetry has no skew

demo.histogram.2 <- ggplot(data = sample.survey, aes(x = age))
demo.histogram.2 + geom_histogram(binwidth = 5, color = "darkslategray", fill = "darkslategray4", alpha = 0.5) +
  ggtitle("Age") +
  labs(y = "Count", x = "Age in years") +
  theme_minimal() 

#Variance, Standard Deviation, and the Coefficient of Variability

#Variance measure the dispersion of a set of data points around their mean value -- denoted as s(squared). For variance, the closer a number is to the mean, the smaller the variance

#sapply(...) - function that allows for the running of operations in a repetitive way, from element to element

var(sample.survey$income)

#Standard Deviation - the square root of the variation

sd(sample.survey$income)

#Coefficient of Variation - relative standard deviation. It is the standard deviation relative to the mean

coef.var <- sd(sample.survey$income)/mean(sample.survey$income)
coef.var

#Covariance and Correlation

sample.survey %>% subset(age <= 25) %>% ggplot(aes(y = income, x = car)) +
  geom_point() + theme_light()

#Covariance - statistic used to determine correlation
  #Positive, Negative, Zero

#Correlation Coefficient - covariance is subject to the scale being measured thus can only be evaluated in that context. The Correlation Coefficient adjust from that and allows it to measured against other observations. It can never be more than 1 or less than -1

cor(sample.survey$car, sample.survey$income)

cor.test(sample.survey$car, sample.survey$income)






