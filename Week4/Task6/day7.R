library(tidyverse)

str(mtcars)

mymtcars <- mtcars %>%
  mutate(vs = as.factor(vs), 
         cyl = as.factor(cyl))
str(mymtcars)

ggplot(data = mymtcars, aes(x = cyl, y = mpg, color = vs)) +
  geom_point()

str(gss_cat)
gss_cat %>%
  count(race)

relig_summary <- gss_cat %>%
  group_by(relig) %>%
  summarise(
    tvhours = mean(tvhours, na.rm = TRUE),
    n = n()
  )

ggplot(relig_summary, aes(tvhours, relig)) + geom_point()

ggplot(relig_summary, aes(tvhours, fct_reorder(relig, tvhours))) +
  geom_point()


mympg %>%
  mutate(class = as.factor(fct_reorder(class, hwy))) %>%
  ggplot(aes(x = class, y = hwy, fill = class)) +
  geom_boxplot() +
  xlab("") +
  theme(legend.position = "none")
  
mpg %>%
  mutate(class = fct_collapse(class,
                                mini = "2seater",
                                light = "subcompact",
                                compact = "compact",
                                medium = "midsize",
                                SUV = "suv",
                                "Pickup trucks and Vans" = c("pickup", "minivan")
  )) %>%
  count(class)
