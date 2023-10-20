# 3. Exploring Data Frames
#
# This is an R Script that assumes that you have some a data frame
# called cats. If you do not, then uncomment the following and run:
#cats <- data.frame(coat = c("calico", "black", "tabby"),
#weight = c(2.1, 5.0, 3.2),
#likes_string = c(1, 0, 1))
#
# We already learned that the columns of a data frame are vectors,
# so that our data are consistent in type throughout the columns. 
# As such, if we want to add a new column, we can start by making 
# a new vector called age:
age <- c(2, 3, 5)

# The following will display cats:
cats
# It should look like:
#     coat weight likes_string
# 1 calico    2.1            1
# 2  black    5.0            0
# 3  tabby    3.2            1
#
# age can be added as a new column to cats as follows:
cbind(cats, age)
# Note that if we tried to add a vector of ages with a different
# number of entries than the number of rows in the data frame, it 
# would fail:
age <- c(2, 3, 5, 12)
cbind(cats, age)
# This should result in:
# Error in data.frame(..., check.names = FALSE): arguments imply
# differing number of rows: 3, 4
# For it to work we need to have the number of rows of cats to 
# equal the length of age (nrow(cats) = length(age)). 
nrow(cats)
# 3
length(age)
# 4
# Recreate age with length of 3 and overwrite the content of cats
# with the resulting data frame.
age <- c(2, 3, 5)
cats <- cbind(cats, age)
# It is not great to overwrite cats, but this practise is common 
# in R!
#
# Create a new row and add it to the data frame:
newRow <- list("tortoiseshell", 3.3, TRUE, 9)
cats <- rbind(cats, newRow)
# Notice we use the function rbind rather than cbind.
#
# Confirm that our new row was added correctly.
cats
#            coat weight likes_string age
# 1        calico    2.1            1   2
# 2         black    5.0            0   3
# 3         tabby    3.2            1   5
# 4 tortoiseshell    3.3            1   9
#
# Notice that the TRUE value of likes_string is encoded as 1
#
# Removing columns
# This can be done by name or by index.
# Indexes in R are numbered from 1 not 0!
# The following effectively removes the age column from cats:
cats <- cats[,-4]
# Notice the comma with nothing before it, that ensures all rows
# are kept.
#
# Column can be dropped using the index name and the %in% operator.
# The %in% operator goes through each element of its left argument,
# in this case the names of cats, and asks, “Does this element 
# occur in the second argument?"
#
# The weight column could be deleted as follows:
drop <- names(cats) %in% c("weight")
cats[,!drop]
#
# Removing rows
# The following would remove row 3 from cats
cats <- cats[-3, ]
# The following would remove rows 2 and 3 from cats
cats <- cats[c(-2,-3), ]
#
# Recreate cats:
cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1, 0, 1))
newRow <- list("tortoiseshell", 3.3, TRUE, 9)
cats <- rbind(cats, newRow)
age <- c(2, 3, 5, 12)
# Append cats to itself:
cats <- rbind(cats, cats)
cats
# cats:
#            coat weight likes_string age
# 1        calico    2.1            1   2
# 2         black    5.0            0   3
# 3         tabby    3.2            1   5
# 4 tortoiseshell    3.3            1   9
# 5        calico    2.1            1   2
# 6         black    5.0            0   3
# 7         tabby    3.2            1   5
# 8 tortoiseshell    3.3            1   9
#
# Challenge: create a data frame
df <- data.frame(id = c("a", "b", "c"),
                 x = 1:3,
                 y = c(TRUE, TRUE, FALSE))
df
# Read in a gapminder dataset:
# If you did not previously download it, then adapt and use the
# following (you will need a data directory):
#download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/main/episodes/data/gapminder_data.csv", destfile = "data/gapminder_data.csv")
gapminder <- read.csv("data/gapminder_data.csv")
# Examine the structure of the data using the str function:
str(gapminder)
# Display a summary of the gapminder data frame:
summary(gapminder)
# Examine individual columns of the data frame with the 
# typeof function:
typeof(gapminder$year)
typeof(gapminder$country)
# Examine the structure of the variable country:
str(gapminder$country)
# Examine the dimensions
nrow(gapminder)
ncol(gapminder)
dim(gapminder)
# Display the titles of all the columns:
colnames(gapminder)
# Print the first lines of the gapminder data frame: 
head(gapminder)
# Examine the 500th row of the gapminder data frame: 
gapminder[500, ]
# Examine a randomly generated sample of 10 rows of the gapminder data frame:
set.seed(1)
gapminder[sample(nrow(gapminder), 10), ]
