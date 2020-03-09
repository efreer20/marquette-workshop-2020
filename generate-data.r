#Generate the data for use in the Marquette workshop
  #for an audience of beginning programmers

#---------------------------------
#Load the packages
#---------------------------------
library(MASS)
library(tidyverse)
library(tidylog)
library(skimr)

#---------------------------------
#Create two correlated variables
#---------------------------------
#The purpose of this is to generate some correlated data so that students can work with it easily
#This part of the code is modified from the code at this URL: 
  #https://www.r-bloggers.com/easily-generate-correlated-variables-from-any-distribution-without-copulas/

#Mu indicates the means of the variables
mu <- rep(0,2)

#Sigma is the covariance matrix between the two variables
Sigma <- matrix(.7, nrow=2, ncol=2) + diag(2)*.3

#Generate a matrix of 2 variables using the correlation specifications above

rawvars <- mvrnorm(n=888, mu=mu, Sigma=Sigma)

cov(rawvars); cor(rawvars)
# We can see our normal sample produces results very similar to our 
#specified covariance levels.

#Transform the data
transformed_vars <- pnorm(rawvars)
cov(transformed_vars); cor(transformed_vars)

#Save it as a dataframe
transformed_vars <- as.data.frame(transformed_vars)

#---------------------------------
#Create other variables for analysis
#---------------------------------

#Create a variable for student ID & merge it in

set.seed(62020)

data <- transformed_vars %>% 
          mutate(StudentID = sample(1:888,replace = FALSE))

#Create a variable for tutoring, dichotomous, randomly sampling 0 and 1

data <- data %>% 
          mutate(tutoring = sample(c(0,1), replace = TRUE, size = 888))

#Create a variable for # times visited advising in fall 

data <- data %>% 
          mutate(fall_adv = sample(c(1:8), replace = TRUE, size = 888))


#Create variable for # times visited advising in spring 
data <- data %>% 
          mutate(spr_adv = sample(c(1:8), replace = TRUE, size = 888))

#Add a text data variable


#Reshuffle the dataset so that student ID is first

data <- data %>% 
  select(StudentID, everything())

#Rename the decimal variables

data <- data %>% 
  rename(int = V1,
         expect = V2)

#save the transformed data
write_csv(data, "data.csv")

