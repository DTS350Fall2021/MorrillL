#Load Packages----
library(tidyverse)
library(sf)
library(maps)
library(lwgeom)
library(USAboundaries)

#Load Data----
states <- sf::st_as_sf(map("state", plot = FALSE, fill = TRUE))
id <- us_counties(states = "ID")

cities <- us_cities()

#Largest 3 cities in each state
top_3 <- cities %>%
  filter(state_name != 'Alaska', state_name != 'Hawaii') %>%
  group_by(state_name) %>%
  arrange(desc(population)) %>%
  slice(1:3)
#Largest city in each state
top <- top_3 %>%
  slice(1:1)
#2nd largest cities in each state
top_2nd <- top_3 %>%
  slice(2:2)
#3rd largest cities in each state
top_3rd <- top_3 %>%
  slice(3:3)

#Graph----
ggplot() +
  geom_sf(data = states, fill = NA) +
  geom_sf(data = id, fill = NA) +
  geom_sf(data = top_3rd, aes(size = population/1000), color = 'lightblue') +
  geom_sf(data = top_2nd, aes(size = population/1000), color = 'blue') +
  geom_sf(data = top, aes(size = population/1000), color = 'darkblue') +
  geom_sf_label(data = top, aes(label = city), color = 'darkblue', nudge_x = 1.5, nudge_y = 0.5, size = 2.5) +
  labs(x = '', y = '') +
  scale_size_continuous(name = 'Population\n(1,000)') +
  theme_bw()

ggsave("country.png")
