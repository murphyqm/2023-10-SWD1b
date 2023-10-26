# 6_Functions.R
# Based on: https://swcarpentry.github.io/r-novice-gapminder/10-functions.html
# The general structure of a function is:
#my_function <- function(parameters) {
#  # perform action
#  # return value
#}
# Define a function fahr_to_kelvin() that converts temperatures from Fahrenheit
# to Kelvin:
fahr_to_kelvin <- function(temp) {
  kelvin <- ((temp - 32) * (5 / 9)) + 273.15
  return(kelvin)
}
View(fahr_to_kelvin(0))
# More conversions
kelvin_to_celsius <- function(temp) {
  #return <- (temp - 273.15)
  return (temp - 273.15)
}
View(kelvin_to_celsius(273.15))
# The following ways save computation:
fahr_to_celsius <- function(temp) {
  return ((temp - 32) * (5 / 9))
}
celsius_to_kelvin <- function(temp) {
  return (temp + 273.15)
}
fahr_to_kelvin <- function(temp) {
  #k = celsius_to_kelvin(temp)
  #c = fahr_to_celsius(k)
  #return (c)
  #return (fahr_to_celsius(temp))
  return (fahr_to_celsius(celsius_to_kelvin(temp)))
}
View(fahr_to_kelvin(0))
# Defensive programming
# Checking conditions with stopifnot()
# Re-examining fahr_to_kelvin() function for converting temperatures from 
# Fahrenheit to Kelvin. For this function to work as intended, the argument temp
# must be a numeric value; otherwise, the mathematical procedure for converting
# between the two temperature scales will not work. To create an error, we can 
# use the function stop(). For example, since the argument temp must be a
# numeric vector, we could check for this condition with an if statement and
# throw an error if the condition was violated. We could augment our function
# above like so:
fahr_to_kelvin <- function(temp) {
  if (!is.numeric(temp)) {
    stop("temp must be a numeric vector.")
  }
  kelvin <- ((temp - 32) * (5 / 9)) + 273.15
  return(kelvin)
}
View(fahr_to_kelvin("Rabbits"))
# Error in View : temp must be a numeric vector.
# Define a function that calculates the Gross Domestic Product of a nation from
# the data available in our dataset:
# Takes a dataset and multiplies the population column
# with the GDP per capita column.
calcGDP <- function(dat) {
  gdp <- dat$pop * dat$gdpPercap
  return(gdp)
}
# Add some more arguments so we can extract that per year and country.
# Takes a dataset and multiplies the population column
# with the GDP per capita column.
calcGDP <- function(dat, year=NULL, country=NULL) {
  if(!is.null(year)) {
    dat <- dat[dat$year %in% year, ]
  }
  if (!is.null(country)) {
    dat <- dat[dat$country %in% country,]
  }
  gdp <- dat$pop * dat$gdpPercap
  
  new <- cbind(dat, gdp=gdp)
  return(new)
}
# If you’ve been writing these functions down into a separate R script (a good 
# idea!), you can load in the functions into our R session by using the source()
# function:
source("6_Functions.R")
# Specify the year
head(calcGDP(gapminder, year=2007))
# Or for a specific country:
calcGDP(gapminder, country="Australia")
# Calculate the GDP for New Zealand in 1987 and the difference from New
# Zealand’s GDP in 1952
calcGDP(gapminder, year = c(1952, 1987), country="New Zealand")
gdp_nz_1952 = calcGDP(gapminder, year = c(1952), country="New Zealand")
gdp_nz_1987 = calcGDP(gapminder, year = c(1987), country="New Zealand")
View(gdp_nz_1987$gdp - gdp_nz_1952$gdp)
