# 10_DataFrameManipulationWith_tidyr.R
# Based on: https://swcarpentry.github.io/r-novice-gapminder/14-tidyr.html
install.packages("tidyr")
#install.packages("dplyr")
#Load the packages
library("tidyr")
library("dplyr")
str(gapminder)
# Download the wide version of the gapminder data from here and save it in the 
# data folder.
download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/main/episodes/data/gapminder_wide.csv",
              destfile = "data/gapminder_wide.csv")
gap_wide <- read.csv("data/gapminder_wide.csv", stringsAsFactors = FALSE)
str(gap_wide)
# Change this very wide data frame layout back to the intermediate (or longer) 
# layout
gap_long <- gap_wide %>%
  pivot_longer(
    cols = c(starts_with('pop'), starts_with('lifeExp'), starts_with('gdpPercap')),
    names_to = "obstype_year", values_to = "obs_values"
  )
str(gap_long)
# Pivot without continent and country
gap_long <- gap_wide %>%
  pivot_longer(
    cols = c(-continent, -country),
    names_to = "obstype_year", values_to = "obs_values"
  )
str(gap_long)
# Use the separate() function to split the character strings into multiple
# variables
gap_long <- gap_long %>% separate(obstype_year, into = c('obs_type', 'year'), sep = "_")
gap_long$year <- as.integer(gap_long$year)
View(gap_long)
# CHALLENGE 2
# Using gap_long, calculate the mean life expectancy, population, and gdpPercap
# for each continent using the group_by() and summarize() functions

