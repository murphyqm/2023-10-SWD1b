# 5_Vectorisation.R
#
# Most of R’s functions are vectorized, meaning that the function will operate
# on all elements of a vector without needing to loop through and act on each 
# element one at a time. This makes writing code more concise, easy to read, and
# less error prone.
x <- 1:4
x * 2
# The multiplication happened to each element of the vector. The vectors could 
# also be added together:
y <- 6:9
x + y
# Each element of x was added to its corresponding element of y:
# Here is how we would add two vectors together using a for loop:
output_vector <- c()
for (i in 1:4) {
  output_vector[i] <- x[i] + y[i]
}
output_vector
# Compare this to the output using vectorised operations.
sum_xy <- x + y
sum_xy
#download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/main/episodes/data/gapminder_data.csv", destfile = "data/gapminder_data.csv")
gapminder <- read.csv("data/gapminder_data.csv")
gapminder$pop_mil <- gapminder$pop / 1000000
#install.packages("ggplot2", dep=T)
library("ggplot2")
ggplot(data = gapminder, mapping = aes(x = year,y = pop_mil)) + geom_point()
# Plot for China, India and Indonesia
countryset <- c("China","India","Indonesia")
ggplot(gapminder[gapminder$country %in% countryset,],
       aes(x = year, y = pop_mil)) + geom_point()
# Colour for countries
ggplot(data = gapminder[gapminder$country %in% countryset, ],
       mapping = aes(x = year,
                     y = pop_mil, 
                     group = country))
       + geom_line(mapping = aes (color=country))
       + geom_point()
# Comparison operators, logical operators, and many functions are also
# vectorized:
# Comparison operators
x > 2
# Logical operators
a <- x > 3  # or, for clarity, a <- (x > 3)
a
# Most functions also operate element-wise on vectors:
x <- 1:4
log(x)
# Vectorized operations work element-wise on matrices:
m <- matrix(1:12, nrow=3, ncol=4)
m * -1