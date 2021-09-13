#Load Libaries----
library(tidyverse)
library(gapminder)
library(gridExtra)
#Load data----
str(gapminder)
gapminder
#Remove Kuwait
wealth_life_data <- filter(gapminder, country != 'Kuwait')
head(wealth_life_data)
wealth_life_data

#Plot1----
p1 <- ggplot(data = wealth_life_data) +
  geom_point(mapping = aes(x = lifeExp, y = gdpPercap, 
                           color = continent, size = pop/100000)) +
  facet_wrap(~year, nrow = 1) +
  scale_y_continuous(trans = "sqrt") +
  xlab("Life Expectancy") + ylab("GDP per capita") +
  scale_size_continuous(name = "Population (100k)") +
  theme_bw()

#Plot2----
weighted_GDP <- wealth_life_data %>%
  group_by(year,continent) %>%
  summarise(GDP_Weight = weighted.mean(gdpPercap),
            population = pop/10000)

weighted_GDP

p2 <- ggplot(data = wealth_life_data, aes(x = year, y = gdpPercap)) +
  geom_point(mapping = aes(color = continent)) +
  geom_line(mapping = aes(color = continent, group = country)) +
  geom_point(data = weighted_GDP, mapping = aes(x = year, y = GDP_Weight, size = population)) +
  geom_line(data = weighted_GDP, mapping = aes(x = year, y = GDP_Weight)) +
  facet_wrap(~continent, nrow = 1) +
  xlab("Year") + ylab("GDP per capita") +
  scale_size_continuous(name = "Population (100k)", breaks = c(10000, 20000,30000)) +
  theme_bw()
  
#Put plots one on top of other
grid.arrange(p1, p2, nrow = 2)

