# 8_SplittingAndCombiningDataFramesWith_plyr.R
# https://swcarpentry.github.io/r-novice-gapminder/12-plyr.html
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
withGDP <- calcGDP(gapminder)
mean(withGDP[withGDP$continent == "Africa", "gdp"])
mean(withGDP[withGDP$continent == "Americas", "gdp"])
mean(withGDP[withGDP$continent == "Asia", "gdp"])
#install.packages('plyr')
library("plyr")
# Calculate the mean GDP per continent:
ddply(
  .data = calcGDP(gapminder),
  .variables = "continent",
  .fun = function(x) mean(x$gdp)
)
# Calculate the average life expectancy per continent. 
ddply(
  .data = gapminder,
  .variables = "continent",
  .fun = function(x) mean(x$lifeExp)
)

dlply(
  .data = calcGDP(gapminder),
  .variables = "continent",
  .fun = function(x) mean(x$gdp)
)
# Specify multiple columns to group by:
ddply(
  .data = calcGDP(gapminder),
  .variables = c("continent", "year"),
  .fun = function(x) mean(x$gdp)
)

daply(
  .data = calcGDP(gapminder),
  .variables = c("continent", "year"),
  .fun = function(x) mean(x$gdp)
)
# To replace a for loop, put the code that was in the body of the for loop
# inside an anonymous function.
d_ply(
  .data=gapminder,
  .variables = "continent",
  .fun = function(x) {
    meanGDPperCap <- mean(x$gdpPercap)
    print(paste(
      "The mean GDP per capita for", unique(x$continent),
      "is", format(meanGDPperCap, big.mark=",")
    ))
  }
)
# Calculate the average life expectancy per continent and year. Which had the
# longest and shortest in 2007
solution <- ddply(
  .data = gapminder,
  .variables = c("continent", "year"),
  .fun = function(x) mean(x$lifeExp)
)
solution_2007 <- solution[solution$year == 2007, ]
solution_2007

