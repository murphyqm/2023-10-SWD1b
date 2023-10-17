age <- c(2, 3, 5)
cats
cbind(cats, age)
age <- c(2, 3, 5, 12)
cbind(cats, age)
nrow(cats)
length(age)
age <- c(2, 3, 5)
cats <- cbind(cats, age)
newRow <- list("tortoiseshell", 3.3, TRUE, 9)
cats <- rbind(cats, newRow)
cats

# Factors
levels(cats$coat)
cats
levels(cats$coat) <- c(levels(cats$coat), "tortoiseshell")
cats <- rbind(cats, list("tortoiseshell", 3.3, TRUE, 9))
str(cats)

cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1, 0, 1))
newRow <- list("tortoiseshell", 3.3, TRUE, 9)
cats <- rbind(cats, newRow)
age <- c(2, 3, 5, 12)
cats <- cbind(cats, age)
cats

cats <- cats[-4, ]
cats[-3, ]
cats <- cats[c(-2,-3), ]
cats
cats <- cats[,-4]

cats <- rbind(cats, cats)
rownames(cats) <- NULL




# Data Frame
df <- data.frame(id = c("a", "b", "c"),
                 x = 1:3,
                 y = c(TRUE, TRUE, FALSE))
df



# Load in data
download.file("https://swcarpentry.github.io/r-novice-gapminder/data/gapminder_data.csv", 
              destfile = "data/gapminder_data.csv")

gapminder <- read.csv("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/main/episodes/data/gapminder_data.csv")
# 


str(gapminder)
summary(gapminder)
typeof(gapminder$year)
typeof(gapminder$country)
str(gapminder$country)
nrow(gapminder)
ncol(gapminder)
dim(gapminder)
colnames(gapminder)
head(gapminder)
gapminder[500, ]
set.seed(1)
gapminder[sample(nrow(gapminder), 10), ]
