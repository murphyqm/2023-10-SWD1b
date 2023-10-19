# We are going to build an example data set and save it to a csv
# We can then load it back in and work with it

# Note: to comment out a large chunk of text, you can highlight multiple
# lines and hit ctrl + shift + c

# First, we want to create a directory called "data" where we will store our
# data files/ raw data

# We can use a system command to do this, to access the computer system
# outside of R

# Remember, put cursor on the desired line and click ctrl + enter to run

system("mkdir data") # this is the same as running "mkdir data" from the 
# terminal below


# setting up an example data set
# coat, weight, and likes_string are all vectors
# each vector contains one type of data

cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1, 0, 1))

# the cats dataframe is now added to the Environment tab to the right
# the arrow symbol expands the view and tells you what the vectors in the
# dataframe contain, for example cats$weight contains numeric data

# the little table symbol to the right of the dataframe name
# shows a table view of the dataframe if you click it

# this can also be accessed using the View() function:

View(cats)

# We can save the dataframe to a csv file, into the "data" folder:

write.csv(x = cats, file = "data/feline-data.csv", row.names=FALSE)


# We can now clear the cats dataframe from the environment using the brush
# symbol in the environment tab
# or by removing the contents:

rm(list = ls())

# Now, cats has disappeared from the env. We can load it back in from
# the csv file we saved it to

cats <- read.csv(file = "data/feline-data.csv")

# When you are using R for research, you probably will not create dataframes
# within R, but instead load in data like this

# The View() command etc. can be used to check that the cats dataframe looks
# the same as it did before saving to csv


# We can also see the contents of the dataframe by simply running the
# name of the dataframe:

cats

# we can check the structure or contents of the dataframe using str():

str(cats)
 # this gives us the same info as the triangle symbol in the Environment tab

# We can access specific vectors (columns) in the dataframe using "$":

cats$coat # the "coat" vector

cats$weight # the "weight" vector

# these vectors can also be assigned to new variables:

cat_coats <- cats$coat

# maths can be done to dataframe vectors:

cats$weight + 1

# Note that this doesn't update the dataframe, it just prints the result
cats$weigh

# the dataframe can be updated though:

cats$weight <- cats$weight + 1

cats$weight

# We can print statements that pull values from the dataframe:

paste("My cat is a", cats$coat, "cat, and weighs", cats$weight, "kg" )

# Different vectors in dataframes can be mathematically combined
# if they have compatible datatypes:

cats$weight + cats$likes_string

cats$weight + cats$coat # why does this return an error?

# we can figure this out by checking what "data type" is in the
# different vectors

typeof(cats$weight)
typeof(cats$coat)

# more details on different data types: 
# https://www.geeksforgeeks.org/r-data-types/

# Numeric or "double precision" floating point numbers:

x <- 2.3
typeof(x)

# Integer values defined with an "L":

y <- 3L
typeof(y)

# Complex type:

z <- 3 + 4i
typeof(z)

# Logical type

a <- TRUE
b <- FALSE

typeof(a)
typeof(b)

# Character

c <- "hello world"
typeof(c)

# vectors can only contain one type of data

example_vect1 <- c(2, 6, 3) # what type of data does this vector contain?

example_vect2 <- c(2, 6, '3') # what type of data does this vector contain?

# The data types of vector contents will be "coerced" or converted to the most
# flexible data type so that all match - see heirarchy below

# Type heirarchy
# R coercion rules:
#   logical -> integer -> numeric -> complex -> character
# 
# where -> can be read as “are transformed into”.

example_vect3 <- c(TRUE, TRUE, FALSE, TRUE, TRUE, TRUE)
typeof(example_vect3)

example_vect4 <- c(TRUE, TRUE, FALSE, TRUE, TRUE, 1L)
typeof(example_vect4)

example_vect5 <- c(TRUE, TRUE, FALSE, TRUE, 1.0, 1L)
typeof(example_vect5)

example_vect6 <- c(TRUE, TRUE, FALSE, 1 + 0i, 1.0, 1L)
typeof(example_vect6)

example_vect7 <- c(TRUE, TRUE, "FALSE", 1 + 0i, 1.0, 1L)
typeof(example_vect7)

# You should check data types when you load dataframes from file
# to avoid unexpected type conversion/coercion and unexpected behaviour

# you can also force this conversion using the "as." functions

example_vect8 <- c("0", "5", "6", "3", "8", "-9")
typeof(example_vect8)

example_vect9 <- as.numeric(example_vect8)
typeof(example_vect9)

# Note that the result might not always be what you expect

as.logical(example_vect8)
as.logical(example_vect9)

# Read more on data structures and data types here: 
# https://swcarpentry.github.io/r-novice-gapminder/04-data-structures-part1.html
