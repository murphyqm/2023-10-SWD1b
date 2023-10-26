# 9_DataFrameManipulationWith_dplyr.R
# Based on: https://swcarpentry.github.io/r-novice-gapminder/13-dplyr.html
mean(gapminder[gapminder$continent == "Africa", "gdpPercap"])
mean(gapminder[gapminder$continent == "Americas", "gdpPercap"])
mean(gapminder[gapminder$continent == "Asia", "gdpPercap"])
#install.packages('dplyr')
library("dplyr")
# Selecting variables
year_country_gdp <- select(gapminder, year, country, gdpPercap)
smaller_gapminder_data <- select(gapminder, -continent)
# Selecting rows (flitering)
year_country_gdp_euro <- gapminder %>%
  filter(continent == "Europe") %>%
  select(year, country, gdpPercap)
# CHALLENGE 1
# Write a single command (which can span multiple lines and includes pipes) that
# will produce a data frame that has the African values for lifeExp, country and
# year, but not for other Continents. How many rows does your data frame have 
# and why?
year_country_lifeExp_Africa <- gapminder %>%
  filter(continent == "Africa") %>%
  select(year, country, lifeExp)
# Using group_by()
str(gapminder)
str(gapminder %>% group_by(continent))
# Using summarize()
gdp_bycontinents <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdpPercap = mean(gdpPercap))
gdp_bycontinents
# Calculate the average life expectancy per country. Which has the longest
# average life expectancy and which has the shortest average life expectancy?
lifeExp_bycountry <- gapminder %>%
  group_by(country) %>%
  summarize(mean_lifeExp = mean(lifeExp))
lifeExp_bycountry %>%
  filter(mean_lifeExp == min(mean_lifeExp) | mean_lifeExp == max(mean_lifeExp))
# Using arrange instead and looking at the ascending order first element
lifeExp_bycountry %>%
  arrange(mean_lifeExp) %>%
  head(1)
# Using arrange instead and looking at the descending order first element
lifeExp_bycountry %>%
  arrange(desc(mean_lifeExp)) %>%
  head(1)
# Group by year and continent.
gdp_bycontinents_byyear <- gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap))
str(gdp_bycontinents_byyear)
gdp_pop_bycontinents_byyear <- gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop))
str(gdp_pop_bycontinents_byyear)
gdp_bycontinents <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdpPercap = mean(gdpPercap))
# count() and n()
gapminder %>%
  filter(year == 2002) %>%
  count(continent, sort = TRUE)
# Get the standard error of the life expectency per continent:
gapminder %>%
  group_by(continent) %>%
  summarize(se_le = sd(lifeExp)/sqrt(n()))
# Calculating the minimum, maximum, mean and se of each continent’s per-country
# life-expectancy:
gapminder %>%
  group_by(continent) %>%
  summarize(
    mean_le = mean(lifeExp),
    min_le = min(lifeExp),
    max_le = max(lifeExp),
    se_le = sd(lifeExp)/sqrt(n()))
# Using mutate()
gdp_pop_bycontinents_byyear <- gapminder %>%
  mutate(gdp_billion = gdpPercap*pop/10^9) %>%
  group_by(continent,year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            mean_gdp_billion = mean(gdp_billion),
            sd_gdp_billion = sd(gdp_billion))
View(gdp_pop_bycontinents_byyear)
## keeping all data but "filtering" after a certain condition
# calculate GDP only for people with a life expectation above 25
gdp_pop_bycontinents_byyear_above25 <- gapminder %>%
  mutate(gdp_billion = ifelse(lifeExp > 25, gdpPercap * pop / 10^9, NA)) %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            mean_gdp_billion = mean(gdp_billion),
            sd_gdp_billion = sd(gdp_billion))
View(gdp_pop_bycontinents_byyear_above25)
## updating only if certain condition is fullfilled
# for life expectations above 40 years, the gpd to be expected in the future is
# scaled
gdp_future_bycontinents_byyear_high_lifeExp <- gapminder %>%
  mutate(gdp_futureExpectation = ifelse(lifeExp > 40, gdpPercap * 1.5, gdpPercap)) %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            mean_gdpPercap_expected = mean(gdp_futureExpectation))
View(gdp_future_bycontinents_byyear_high_lifeExp)
# install.packages('ggplot2')
library("ggplot2")
# Filter countries located in the Americas
americas <- gapminder[gapminder$continent == "Americas", ]
# Make the plot
ggplot(data = americas, mapping = aes(x = year, y = lifeExp)) +
  geom_line() +
  facet_wrap( ~ country) +
  theme(axis.text.x = element_text(angle = 45))
# Do the same without creating the americas data frame
gapminder %>%
  # Filter countries located in the Americas
  filter(continent == "Americas") %>%
  # Make the plot
  ggplot(mapping = aes(x = year, y = lifeExp)) +
  geom_line() +
  facet_wrap( ~ country) +
  theme(axis.text.x = element_text(angle = 45))
# Calculate the average life expectancy in 2002 of 2 randomly selected countries
# for each continent. Then arrange the continent names in reverse order. Hint: 
# Use the dplyr functions arrange() and sample_n(), they have similar syntax to
# other dplyr functions.
set.seed(1) # Set the seed for reproducibility
lifeExp_2countries_bycontinents <- gapminder %>%
  filter(year==2002) %>%
  group_by(continent) %>%
  sample_n(2) %>%
  summarize(mean_lifeExp=mean(lifeExp)) %>%
  arrange(desc(mean_lifeExp))
View(lifeExp_2countries_bycontinents)