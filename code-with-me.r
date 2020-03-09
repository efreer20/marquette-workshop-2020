#An interactive guide for the Marquette University Intro to R workshop

#########################################################
#Installing packages
#########################################################

#Here, we install 3 packages
  #tidyverse
  #tidylog
  #readr

install.packages("tidyverse", "tidylog", "readr")

#########################################################
#Load Packages
#########################################################

#Here, we load 2 packages
  #tidyverse
  #tidylog

library(tidyverse)
library(tidylog)
library(readr)

#########################################################
#Check and Set Working Directory
#########################################################

#Here, we check our working directory
getwd()

#Here, we specify the working directory that we want

!!!!!!!!!!!!!
## Finish me
!!!!!!!!!!!!!

#########################################################
#Load Data
#########################################################

#Here we load the data and save it as an object "data"
data <- read_csv("data.csv")

#We can call it anything we want
pasta <- read_csv("data.csv")

#Try checking out the "data" and "pasta" objects in the environment


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
