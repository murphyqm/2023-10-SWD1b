# 7_Writing_Data.R
# Based on: https://swcarpentry.github.io/r-novice-gapminder/11-writing-data.html
# Saving plots
# To save the most recent plot you create in ggplot2, using the command ggsave.
ggsave("My_most_recent_plot.pdf")
# The function pdf creates a new pdf device. You can control the size and 
# resolution using the arguments to this function.
pdf("Life_Exp_vs_time.pdf", width=12, height=4)
ggplot(data=gapminder, aes(x=year, y=lifeExp, colour=country)) +
  geom_line() +
  theme(legend.position = "none")
# Make sure to turn off the pdf device!
dev.off()
# CHALLENGE 1
# Print a second page in the pdf, showing a facet plot (hint: use facet_grid) of
# the same data with one panel per continent.
pdf("Life_Exp_vs_time.pdf", width = 12, height = 4)
p <- ggplot(data = gapminder, aes(x = year, y = lifeExp, colour = country)) +
  geom_line() +
  theme(legend.position = "none")
p
p + facet_grid(~continent)
dev.off()
# Create a gapminder data subset for Australia:
aust_subset <- gapminder[gapminder$country == "Australia",]
# Write this to disk:
write.table(aust_subset,
            file="data/gapminder-aus.csv",
            sep=","
)
# By default R wraps character vectors with quotation marks when writing out to
# file. It will also write out the row and column names. The following reduces 
# the output appropriately: 
write.table(
  gapminder[gapminder$country == "Australia",],
  file="data/gapminder_aus.csv",
  sep=",", quote=FALSE, row.names=FALSE
)
system("head data/gapminder_aus.csv")
# CHALLENGE 2
# Subsets the gapminder data to include only data points collected since 1990.
# Write out the new subset to a file.
write.table(
  gapminder[gapminder$year > 1990, ],
  file = "data/gapminder-after1990.csv",
  sep = ",", quote = FALSE, row.names = FALSE
)
