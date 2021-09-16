#Libraries ----
library(tidyverse)
library(ggrepel)
#Data----
head(iris)

#Exercise 1 - changing legend
ggplot(data = iris, mapping = aes(x = Sepal.Width, 
                                  y = Sepal.Length, 
                                  color = Species,
                                  shape = Species)) +
  geom_point() +
  labs(x = "Sepal Width (cm)",
       y = "Sepal Length (cm)",
       title = "We can predict Setosa's sepal length from its width",
       subtitle = "Versicolor and Virginica are not predictable",
       caption = "Source: iris",
       shape = "Species of Iris",
       color = "Species of Iris")
# Changing the shape legend name creates a new legend with the shapes.
#When you also change the color legend, there is only 1 legend with the name Species of Iris.

#Exercise 2 - changing scale
ggplot(data = iris, mapping = aes(x=Sepal.Width, 
                                  y = Sepal.Length, 
                                  color = Species,
                                  shape = Species)) +
  geom_point() +
  scale_shape_manual(values =  c(1, 5, 7)) +
  scale_x_log10() + scale_y_log10()

#Exercise 3 - changing legend shapes
ggplot(data = iris, mapping = aes(x=Sepal.Width, 
                                  y = Sepal.Length, 
                                  color = Species,
                                  shape = Species)) +
  geom_point() +
  scale_shape_manual(values =  c(1, 5, 7)) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_manual(values = c("purple", "darkorange", "blue"))

#Exercise 4 - themes
averages <- iris %>% 
  group_by(Species) %>% 
  mutate(avglength = mean(Sepal.Length))
averages

ggplot(data = iris, mapping = aes(x = Sepal.Width, 
                                  y = Sepal.Length, color = Species, shape = Species)) +
  geom_point() +
  geom_hline(data = averages, mapping = aes(yintercept = avglength), color = "red") +
  scale_shape_manual(values =  c(1, 5, 7)) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_manual(values = c("purple", "orange", "blue")) +
  labs(x = "Sepal Width (cm)",
       y = "Sepal Length (cm)",
       title = "This is where I would put a title",
       shape = "Species of Iris",
       color = "Species of Iris") +
  theme_bw()
#To change the color of the horizontal line to red, you could add color = "red" in the geom_hline