#An interactive guide for the Marquette University Intro to R workshop

#########################################################
#Installing packages
#########################################################

#Here, we install 4 packages
  #tidyverse
  #tidylog
  #readr
  #skimr

install.packages("tidyverse")
install.packages("tidylog") 
install.packages("readr")
install.packages("skimr")
#########################################################
#Load Packages
#########################################################

#Here, we load 2 packages
  #tidyverse
  #tidylog

library(tidyverse)
library(tidylog)
library(readr)
library(skimr)

#########################################################
#Check and Set Working Directory
#########################################################

#Here, we check our working directory
getwd()

#########################################################
#Load Data
#########################################################

#Here we load the data and save it as an object "data"
data <- read_csv("data.csv")

#We can call it anything we want
pasta <- read_csv("data.csv")

#Try checking out the "data" and "pasta" objects by clicking them 
  #You can find them at the top right, in the Environment pane

#########################################################
#Variable Renaming
#########################################################

#Let's try renaming a variable in our data

#Without saving

data %>% rename(testing123 = tutoring)
  #What do you see in your console (bottom left) after running this code?
  
#With saving

data <- data %>% 
  rename(tutor = tutoring)

#########################################################
#Selecting Data
#########################################################

#Try filling out the rest of this code to select only the advising data and student ID data
#Remember that variable names need to be separated by commas

data_advising <- 
  data %>% 
  select(StudentID, , )


#How many observations (rows) are in your new dataset?
  
#How many variables (columns) are in your new dataset?


#########################################################
#Mutating Data
#########################################################
#Try creating a new variable in the dataset that represents the total number of advising sessions attended

#This will be the sum of the *spr_adv* and *fall_adv* variables

#Save the new dataset as *awesome*
  
_____ <- data %>% 
  mutate(____ = )


#Mutating Step 2:
colnames(awesome)

#########################################################
#Filtering Data
#########################################################

#Filter without saving

data %>% filter(tutoring == 0)

#Filter using your own criteria



#########################################################
#Move a variable forward
#########################################################
#Fill in the following code with a variable you'd like to move to the front

select(data, ______, everything())


#########################################################
#Chaining Commands
#########################################################

data %>%
  mutate(motivation = (int + expect)) %>% 
  filter(tutoring == 0) %>% 
  view

#########################################################
#Saving out our data
#########################################################
write_csv(data, "data_after_workshop.csv")

#########################################################
#Running linear models (regressions)
#########################################################

#Running the first linear model
m1 <- lm(int ~ expect, data = pasta)

#Summarizing first model output
summary(m1)

#Running the second linear model
m2 <- lm(int ~ expect + tutoring + fall_adv + spr_adv, 
         data = pasta)

#Summarizing the second model output
summary(m2)

#You try: 
#Write a linear model to predict the outcome of your choice from the dataset "data" or "pasta"
