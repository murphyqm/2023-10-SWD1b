# Load in data
#download.file("https://swcarpentry.github.io/r-novice-gapminder/data/gapminder_data.csv", 
#              destfile = "data/gapminder_data.csv")

gapminder <- read.csv("data/gapminder_data.csv")

install.packages("ggplot2", dep=T)
library("ggplot2")
# Just a grey box
ggplot(data = gapminder)
# A framework, but no data
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))
# A framework and a scatterplot
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()
# A framework and a scatterplot
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp)) +
  geom_point()
# Using a scatterplot probably isn’t the best for visualizing change over time. Instead, let’s tell ggplot to visualize the data as a line plot:
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, color=continent)) +
  geom_line()
# However, the result doesn’t look quite as we might have expected: it seems to be jumping around a lot in each continent. Let’s try to separate the data by country, plotting one line for each country:
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, group=country, color=continent)) +
  geom_line()
# But what if we want to visualize both lines and points on the plot? We can add another layer to the plot:
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, group=country, color=continent)) +
  geom_line() + geom_point()
# Currently it’s hard to see the relationship between the points due to some strong outliers in GDP per capita. We can change the scale of units on the x axis using the scale functions. These control the mapping between the data values and visual values of an aesthetic. We can also modify the transparency of the points, using the alpha function, which is especially helpful when you have a large amount of data which is very clustered.
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10()
# We can fit a simple relationship to the data by adding another layer, geom_smooth:
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10() + geom_smooth(method="lm", linewidth=2)

# Multi-panel figures
# Earlier we visualized the change in life expectancy over time across all countries in one plot. Alternatively, we can split this out over multiple panels by adding a layer of facet panels. Start by making a subset of data including only countries located in the Americas. This includes 25 countries, which will begin to clutter the figure. Note that we apply a “theme” definition to rotate the x-axis labels to maintain readability. Nearly everything in ggplot2 is customizable.
americas <- gapminder[gapminder$continent == "Americas",]
ggplot(data = americas, mapping = aes(x = year, y = lifeExp)) +
  geom_line() + 
  facet_wrap( ~ country) + 
  theme(axis.text.x = element_text(angle = 45))

# Modifying text
# To clean this figure up for a publication we need to change some of the text elements. The x-axis is too cluttered, and the y axis should read “Life expectancy”, rather than the column name in the data frame.
#
# We can do this by adding a couple of different layers. The theme layer controls the axis text, and overall text size. Labels for the axes, plot title and any legend can be set using the labs function. Legend titles are set using the same names we used in the aes specification. Thus below the color legend title is set using color = "Continent", while the title of a fill legend would be set using fill = "MyTitle".
ggplot(data = americas, mapping = aes(x = year, y = lifeExp, color=continent)) +
  geom_line() + facet_wrap( ~ country) +
  labs(
    x = "Year",              # x axis title
    y = "Life expectancy",   # y axis title
    title = "Figure 1",      # main title of figure
    color = "Continent"      # title of legend
  ) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# Export the plot
lifeExp_plot <- ggplot(data = americas, mapping = aes(x = year, y = lifeExp, color=continent)) +
  geom_line() + facet_wrap( ~ country) +
  labs(
    x = "Year",              # x axis title
    y = "Life expectancy",   # y axis title
    title = "Figure 1",      # main title of figure
    color = "Continent"      # title of legend
  ) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

ggsave(filename = "results/lifeExp.png", plot = lifeExp_plot, width = 12, height = 10, dpi = 300, units = "cm")
