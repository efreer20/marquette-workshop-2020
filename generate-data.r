#Generate the data for use in the Marquette workshop
  #for an audience of beginning programmers

#---------------------------------
#Load the packages
#---------------------------------
library(MASS)
library(tidyverse)
library(tidylog)

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

#Create a variable for student ID & merge it in











#save the transformed data
transformed_vars <- as.data.frame(transformed_vars)
write_csv(transformed_vars, "data.csv")
