library(tidyverse)

dim(iris)
str(iris)
?iris

head(iris)
summary(iris)

ggplot(data = iris) +
  geom_point(mapping = aes(x = Sepal.Length, y = Sepal.Width, color = Species))

ggplot(data = iris) +
  geom_point(mapping = aes(x = Petal.Width, y = Petal.Length, 
                           color = Species, shape = Species)) +
  facet_wrap(~Species) +
  theme(legend.position = 'none')

ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point( aes(color = Species, shape = Species)) +
  geom_smooth()
