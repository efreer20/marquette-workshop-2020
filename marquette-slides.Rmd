---
title: "Intro to R"
author: "Emily Bovee, PhD & Joshua Rosenberg, PhD"
institute: "Marquette University and University of Tennessee, Knoxville"
date: "`r Sys.Date()`"
output:
 xaringan::moon_reader:
    css: [default, metropolis, metropolis-fonts, custom.css]
    lib_dir: libs
    nature:
      highlightStyle: github
      highlightLines: true
      countIncrementalSlides: false
---

```{r setup, include=FALSE}
options(htmltools.dir.version = FALSE)
library(knitr)
library(tidyverse)
```

# Who am I?

.pull-left[
* Dr. Emily Bovee
* Director of Educational Development and Assessment: Marquette University School of Dentistry
* Cat mom
* Primary areas of interest
  * Understanding student motivation in higher education and professional education
  * Data science education 
]

```{r, out.width = "350px", echo = FALSE, fig.align = "center"}
include_graphics("img/ebv.jpg")
```

---

class: inverse, center, middle

# Agenda

---

# Agenda

1. Getting Started with RStudio
1. Vignettes and Functions
1. Loading data
1. Processing data
1. Analyzing data 
1. Learning and doing more with R
1. Questions

---


class: inverse, center, middle

# Section 1: Getting Started with RStudio

---

# Why learn R?

* It is capable of carrying out basic and complex statistical analyses

* It is able to work with data small (*n* = 30!) and large (*n* = 100,000+) efficiently

* It is a programming language and so is quite flexible

* There is a great, inclusive community of users and developers (and teachers)

* It is cross-platform, open-source, and freely-available

---
# My teaching approach for today

* *MAIN GOAL:* Get you up and running with coding in R as soon as possible

- Show you what's possible in terms of data manipulation and analysis

- We will NOT be spending a lot of time troubleshooting tech and software/hardware issues

- Instead, we will focus on exposure to a variety of data processing tools

- You will get access to the code and all files after the workshop so you can practice on your own

- I will share a list of resources at the end to facilitate your learning

---
# Wait, I'm not installing the software?????

  - Installing R can take 20 minutes, depending on your computing setup
  
  - Not everyone is using their own machine
  
  - Our time is valuable here today, so I want to get you off the ground with some new coding skills
  
  - Hopefully our work here today will motivate you to go through the installation of R later!
  
  - There are lots of helpful overviews about how to do install R, and one is chapter 5 of our book: www.datascienceineducation.com 

- Image credit: Mine Çetinkaya-Rundel

```{r, out.width = "350px", echo = FALSE, fig.align = "center"}
include_graphics("starting.jpg")
```
---
# Where to begin

- R is the engine

- RStudio is the steering wheel & the gas pedal

- Can't get anywhere without the engine, but we never interact with the engine directly

- R = language ; RStudio = Integrated Development Environment (IDE)

---
# Code with me:

- Our task: Open R Studio cloud

- Visit this URL https://rstudio.cloud/

- Sign up

- Join our shared workspace at this link: https://rstudio.cloud/project/1022502

---
# Hi, RStudio: Four Panes

  - When you open RStudio, you will see four panes. These are for:
    - Source
    - Console
    - Environment
    - Files
    
```{r, out.width = "600px", echo = FALSE, fig.align = "center"}
include_graphics("rstudio_annotated.jpg")
```
---
# Hi, RStudio: Data & the Environment

  - Data can live:
  
      - in a folder on your computer (e.g. Desktop)
      
      - on the cloud (e.g. Google Drive)
      
      - on the internet (e.g. a dataset from the government that will update without any input from you)
      
---
# Hi, RStudio: Data & the Environment
    
  - Interacting with data in R:
    
    - We need to first tell R where to look for the data
    
    - Once we have done that, the data will be loaded into our Environment
  
    - You can load data into your Working Environment to manipulate it and interact with it, but your original data remains untouched.

---
# Hi, RStudio: Source (Code)
  - The coding pane is at the top left
  - Need to save code files
 
  - What are the unique factors of working in a cloud computing environment

---
# Hi, RStudio: Files


---
# Hi, RStudio: Console

* As we code, the Console keeps a running log of what we've done.
 - The Console is at the bottom left, and 
  - Can also code in the Console, but that is generally not good practice

---
# Packages

"Packages" are shareable collections of R code that provide functions (i.e., a command to perform a specific task), data and documentation. Packages increase the functionality of R by improving and expanding on base R (basic R functions). 

---

# See what packages you have
```{r, out.width = "350px", echo = FALSE, fig.align = "center"}
include_graphics("pkg_example_screenshot.jpg")
```

---
# Installing and Loading Packages

To download a package, you must call `install.packages()`:

```{r, eval = FALSE}
install.packages("tidyverse")
```

You can also navigate to the Packages pane, and then click "Install", which will work the same as the line of code above. This is a way to install a package using code or part of the R Studio interface. 

```{r, out.width = "350px", echo = FALSE, fig.align = "center"}
include_graphics("install_pkgs.jpg")
```
Usually, writing code is a bit quicker, but using the interface can be very useful and complimentary to use of code. 

---
# Using packages

*After* the package is installed, it must be loaded into your R Studio session using `library()`:

```{r}
library(tidyverse)
```

We only have to install a package once, but to use it, we have to load it each time we start a new R session.

> A package is a like a book, a library is like a library; you use library() to check a package out of the library
> - Hadley Wickham, Chief Scientist, R Studio

# Quick guide to notation in R

* <- is the assignment operator. It means "save as"

* %>% is the "pipe" operator. It means "then"

* # is the comment operator. It means "ignore this"

* () are how we give sub-commands to R. We might give R a command and then use () to give more specific instructions.

---
# Notation: <-
Using the assignment operator, we can save a changed dataset
```{r}
data <- data

```

---
# Notation: %>% 

- %>% means Then
- It comes from a set of packages called the Tidyverse (not built in to R)
- It is handy for stringing multiple commands together



---
# Notation: #
 
When we type # , we tell R to ignore everything that follows

```{r}


```
---
# Notation: Putting it all together
<- 

%>% 

#

()

```{r, eval = FALSE}
#Sample code:
averageGradeData <- data %>%   #Take grade data called "data" 
                                #and save it as "averageGradeData"
 group_by(Last, course_sem) %>%  #Then, group by course and semester
  summarize(avgGrade = mean(`Grd Pt/Unt`, na.rm = TRUE)) %>% 
                  #Then, create a new column for 
                  #"average grade" and name it avgGrade
                  #in this new column, take the average of all the 
                  #grades (within a course/semester)
  view #then show me the result
```
---
class: inverse, center, middle
# Section 2: Vignettes and Functions

---
# Vignettes

Vignettes are long-form documentation (and tutorials) that can provide a helpful introduction to a package.

Run `vignette()` in order to view *all* of the vignettes available for a package:

```{r, eval = FALSE}
vignette(package = "dplyr")
```

Then, you can load a specific vignette.

```{r, eval = FALSE}
vignette("dplyr", package = "dplyr")
```

These are also available through CRAN (i.e., https://cran.r-project.org/web/packages/dplyr/index.html)
---

# Using a specific function

If you know the specific function that you want to look up, you can run this in the R Studio console:

- Here, we use the double colon `::` to indicate that we want to use the `filter` function from within the `dplyr` package.
  - The format is `?package::function`

```{r, eval = FALSE}
?dplyr::filter
```

Once you know what you want to do with the function, you can run it in your code:

```{r}
dat <- # take everything I do below and save it as an object "dat" 
  tibble(letter = c("A", "A", "A", "B", "B"),
         number = c(1L, 2L, 3L, 4L, 5L)) #creates a tibble format of data
filter(dat, letter == "A")
```

---
class: inverse, center, middle

# Section 3: Loading Data

---

# Data processing with the *tidyverse*

- I use the `tidyverse` packages to do data science tasks

- For these packages to work, our data needs to be in the format of a *tibble*

- A *tibble* is a data frame, but with some tighter rules.

- For now, it's important to understand that however you read your data in - from a spreadsheet, from a Google sheet, or from the internet - you can transform it into a *tibble* and can do fun data processing and analysis tasks after that

---
# Where does my data "live"?

* Need to tell R where to look for your data

* This is called a Working Directory

* We can specify the working directory with our mouse

* We can also specify the working directory with code

* For now, it makes sense to store your data in the same place as your code

---
# Code with me: set Working directory

---
# Code with me: load data




#####IN PROGRESS 

---
#basics of functions
  - arguments
  - functions
  - check out data types
  
---  
# Package fundamentals: my favorite packages & my workflow

 #High level overview: 
      - tidyverse for data cleaning
      - skimr to check out the data

---      
# Example of an end-to-end data analysis I did in R (maybe at work)

    - what packages I used
    - how I got from point A to point B
          - Possibilities: Average Grade.R
          - Graduation Rate Script - September

---
class: inverse, center, middle

# Section 4: Processing Data

---

# Some data processing basics

- Always use the assignment operator <- to save a new version of the object
    - Otherwise, you will not maintain your data processing work

- Remember that you are not changing the file on your computer (or on the cloud), so it is very important to save your code file

- Can save the processed data file when you are done

- Everything is reversible, so try stuff out!
---

#Task: Check out the data
  str(data) gives us an overview of the types of all of the data columns at once

Try typing this code:
```{r, echo=FALSE}
str(data)
```

---
#Task: Variable Renaming

- To rename a variable, we use "rename" from the `dplyr` package
  - `dplyr` is part of the `tidyverse` group of packages
  
- The format for the rename function is 
  - rename(new = old)
  - Remember that we can learn more about it by typing 
```{r, eval = FALSE}
?dplyr::rename
```

```{r, eval = FALSE}
#Sample code

classof2016 <- classof2016 %>% 
  rename("First" = "First Name",
         "Last" = "Last Name")
```

---
#Task: Mutating

---
#Task: Recoding


---
#

---
#Task: Selecting

---
#Task: Filtering

---
#Task: Move a variable to the front 
- We can do this with the `select` function

- The below sample code comes right from the *documentation* for `select`

- Remember that you can access the documentation for a function at any time by typing a question mark into your console like this
 `?dplyr::rename`
 


```{r, eval = FALSE}
# Move Species variable to the front
select(iris, Species, everything())

```
---
# Code with me: Move a variable to the front
 #### insert instructions here about how to move a variable to the front in our practice dataset 
 
 
 #### also have students access help documentation


---


#Task: Saving out my processed dataset

- For this, we can use the readr function from within the tidyverse

---
class: inverse, center, middle

# Section 5: Analyzing Data

---
# IN PROGRESS Task: Correlations

---

#IN PROGRESS Task: Linear Regression

---
class: inverse, center, middle

# Section 6: Learning and doing more with R

---
# Resources
  - [Doing data science with R](https://r4ds.had.co.nz/) by Wickham and
    Grolemund (2017)
  - [Big magic with R: Creating learning beyond
    fear](https://speakerdeck.com/apreshill/big-magic-with-r-creative-learning-beyond-fear)
    by Hill (2017)
  - [Data science in education](https://github.com/data-edu/data-science-in-education)
---
# Courses
  - [\#r4ds](https://medium.com/@kierisi/r4ds-the-next-iteration-d51e0a1b0b82)
    (see a talk at rstudio::conf()
    [here](https://resources.rstudio.com/rstudio-conf-2019/r4ds-online-learning-community-improvements-to-self-taught-data-science-and-the-critical-need-for-diversity-equity-and-inclusion-in-data-science-education)
    by Maegan (2019))
  - [Data science for social scientists](http://datascience.tntlab.org/) by
    Landers (2019)
  - [University of Oregon Data Science Specialization for the College of
    Education](https://github.com/uo-datasci-specialization) by Anderson (2019)
---
class: center, middle

# Thanks! 

Contact me: emily.bovee@marquette.edu 
Twitter: @ebovee09

Contact Dr. Joshua Rosenberg: @jrosenberg6432

Slides created via the R package [**xaringan**](https://github.com/yihui/xaringan).

The repository for this workshop is [here](https://github.com/jrosen48/https://github.com/emilybovee/marquette-workshop-2020).
