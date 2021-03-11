#The Dplyr Package

library(tidyverse)

view(starwars)


#Remove absent data

starwars <- na.omit(starwars)
starwars




#filter(data, criterion) - subsets data according to criteria

filter(starwars, hair_color == "blond")
tatooineGenderMales <- filter(starwars, gender == "masculine" | homeworld == "Tatooine")
tatooineGenderMales


tatooineGenderMales$mass
mean(tatooineGenderMales$mass)



#select(data) - keeps the variables you mention

select(starwars, eye_color, height, birth_year)
blueStarWars <- select(starwars, skin_color:eye_color)
blueStarWars
summary(blueStarWars)


#mutate(...) - adds a new variable and preserves the rest

starwars <- mutate(starwars, "BMI" = mass / height)
starwars

#transmutate(...) adds a new variable and drops the rest

starwars.bmi <- transmute(starwars, "BMI" = mass / height)
starwars.bmi

#arrage(...)

arrange(starwars, desc(birth_year))
starwars
arrange(starwars, +birth_year)

#summarize(...) summarizes a data frame in a single result
starwarsMeanBmi <- summarize(starwars, avg.BMI = mean(BMI))
starwarsMeanBmi

starwarsAvgBirthYear <- summarize(starwars, avg.birth_year = median(birth_year))
starwarsAvgBirthYear


#group_by(...) - splits the dataset into groups

starwarsEyeColor <- group_by(starwars, eye_color)

summarize(starwarsEyeColor, avg.BMI = mean(BMI))

#Recode

starwarsGenderNum <- mutate(starwars, gender = recode(sex, male = 0, female = 1))
starwarsGenderNum



#Sampling Data

#sample(...)

#sample_n(...) extracts a random sample of a fixed number of rows
sample_n(starwars, 10, replace = T)

#sample_fract(...) extracts a random sample of a fixed percentage of rows
sample_frac(starwars, .2, replace = T)

starwars.sample <- sample_n(starwars, 10, replace = F)
starwars.sample
mean(starwars.sample$BMI)


#Pipe Operator  %>%

#place between individual operations to both separate and unite the operations


sw.long <- select(starwars, name, height, mass, gender)
sw.long

sw.long <- rename(sw.long, weight = mass)
sw.long

sw.long <- na.omit(sw.long)
sw.long

sw.long <- mutate(sw.long, height = height/100)
sw.long

#=

#data %>% operation A %>% operation B

sw.short <- starwars %>%
  select(name, height, mass, gender) %>%
  rename(weight = mass) %>%
  na.omit() %>%
  mutate(height = height/100)
  
sw.short




#Tidying data in R with tidyr

#gather(...)  
#spread(...)
#unite(...)
#seperate(...)

library(tidyverse)

#gather(...) is the function that reorganizes data that have values as column names

covid19.us <- read.csv("time_series_covid19_confirmed_US.csv", stringsAsFactors = F)
covid19.us <- as_tibble(covid19.us)
covid19.us

#gather(data, col.m:col.n, key, value)
#key is the name of the new variable that will hold the values that are currently column names
#value is the name of the new variable that will hold the values previously help by the columns


covid.gathered <- covid19.us %>% gather(January.22..2020:October.19..2020, key = "Date", value = "Cases", na.rm = T) %>%
  arrange(-Cases)

covid.gathered


#separate(column name, sep ="", into = "") breaks values in one column into multiple columns

covid.separate <- covid.gathered %>% separate(Combined_Key, sep = ", ", into = c("City", "State", "Country"))
covid.separate

covid.separate.month <- covid.separate %>% separate(Date, sep = "[.]", into = c("Month", "Day"), )
covid.separate.month


select(covid.separate.month, -Month)


covid.state <- group_by(covid.separate.month, State)
covid.state

bar.covid.state <- ggplot(covid.state, aes(State), (x=factor(trunc(runif(10000, 0, 100)), ordered=T)))
bar.covid.state

bar.covid.state + geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) 


#unite(...) combine two or more columns
covid.united <- covid.separate %>% unite("Location", sep = ", ", c("City", "State", 'Country'))
covid.united

#spread(...) help to tidy data of one observation in multiple rows

weather <- read.csv("weather.csv")
weather <- as_tibble(weather)
weather

weather.spread <- spread(weather, key = element, value = value)
weather.spread

