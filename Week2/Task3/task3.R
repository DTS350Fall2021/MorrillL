library(tidyverse)

dim(iris)
str(iris)
?iris

head(iris)
str(iris)
#1
ggplot(data = iris) +
  geom_point(mapping = aes(x = Sepal.Length, y = Sepal.Width, color = Species, shape = Species))

# The Setosa iris species has a shorter sepal length and a longer sepal width
# versus the Versicolor iris and the Virginica iris.

#2
ggplot(data = iris) +
  geom_point(mapping = aes(x = Petal.Width, y = Petal.Length, 
                           color = Species, shape = Species)) +
  facet_wrap(~Species) +
  theme(legend.position = 'none')
#The Virginica iris has the biggest petal length and width.
#The Setosa iris has the smallest petal length and width.

#3
ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point( aes(color = Species, shape = Species)) +
  geom_smooth()
#Graph 3 shows there is a positive correlation between petal length and petal width.

#4
ggplot(data = iris, aes(x = Sepal.Length, fill = Species)) +
  geom_bar(color = 'black', stat = 'bin', bins = 19) +
  geom_vline(xintercept = mean(iris[["Sepal.Length"]]), linetype = "dotted")
#Setosa irises seem to be on the low end of the average sepal lengths,
#virginica seem to be on the higher end of the average sepal lengths, and
#versicolor seem to be around the average of the sepal lengths.