library(tidyverse)
library(ggthemes)

urlfile = "https://github.com/WJC-Data-Science/DTS350/raw/master/coral.csv"
mydata <- read_csv(url(urlfile))

str(mydata)
head(mydata)

#1
ggplot(data = mydata, aes(x = Year, y = Value, fill = Event)) +
  geom_col() +
  labs(title = "Number of coral bleaching events, Pacific", 
       subtitle = "The number of moderate(up to 30% of corals affected) and severe bleaching events (more than 30% corals) measured at 100 \n fixed global locations. Bleaching occurs when stressful conditions cause corals to expel their algai symbiots.", 
       caption = "Source: Hughes, T. P., et al. (2018). Spatial and temporal patterns of mass bleaching of corals in the Anthropocene. Science. \nOurWorldInData.org/biodiversity · CC BY") +

  scale_fill_manual(values = c("cyan4", "firebrick3"), labels = c("Moderate (<30%)",
                                                                  "Severe (>30%)")) +
  scale_x_continuous(breaks = seq(1980, 2016, 3)) +
  theme(legend.title = element_blank(), legend.justification = c(0, 1), 
        legend.key.width = unit(1, "lines"), 
        plot.margin = unit(c(1, 5, 0.5, 0.5), "lines"),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.caption = element_text(hjust = 0, colour = 'gray40'),
        axis.ticks.x = element_line(color = "black"),
        axis.ticks.y = element_line(color = "white"),
        axis.text.y = element_text(margin = margin(r = 0)),
        axis.text.x = element_text(margin = margin(r = 0)),
        panel.background = element_rect(fill = "white"),
        panel.grid.major.y = element_line(color = "gray", linetype = "dotted"),
        axis.text = element_text(color = "black")
        )
