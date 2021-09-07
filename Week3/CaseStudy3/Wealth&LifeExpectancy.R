#Load Libaries----
library(tidyverse)
library(gapminder)
#Load data----
str(gapminder)
gapminder
#Remove Kuwait
wealth_life_data <- filter(gapminder, country != 'Kuwait')
wealth_life_data

ggplot(data = wealth_life_data) +
  geom_point(mapping = aes(x = lifeExp, y = gdpPercap, 
                           color = continent)) +
  facet_wrap(~year, ncols = 0) +
  scale_y_continuous(trans = "sqrt") +
  xlab("Life Expectancy") + ylab("GDP per capita")
  #scale_fill_manual(labels = c("A","Severe (>30%)")) +
  theme_bw()
