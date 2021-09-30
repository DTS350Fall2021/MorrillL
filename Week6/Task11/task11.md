---
title: "Task 10"
author: "Logan Morrill"
date: "9/28/2021"
output: 
  html_document:
    theme: united
    keep_md: True
    code_folding: 'hide'
---

### Load packages

### Load data

```r
?financing_healthcare
```

```
## starting httpd help server ... done
```

```r
head(financing_healthcare)
```

```
## # A tibble: 6 x 17
##    year country     continent health_exp_total health_exp_publ~ health_insurance
##   <int> <chr>       <chr>                <dbl>            <dbl>            <int>
## 1  2015 Abkhazia    <NA>                    NA               NA               NA
## 2  1800 Afghanistan Asia                    NA               NA               NA
## 3  1801 Afghanistan Asia                    NA               NA               NA
## 4  1802 Afghanistan Asia                    NA               NA               NA
## 5  1803 Afghanistan Asia                    NA               NA               NA
## 6  1804 Afghanistan Asia                    NA               NA               NA
## # ... with 11 more variables: nhs_exp <dbl>, health_exp_private <dbl>,
## #   health_insurance_govt <dbl>, health_insurance_private <dbl>,
## #   health_insurance_any <dbl>, health_exp_public_percent <dbl>,
## #   health_exp_oop_percent <dbl>, no_health_insurance <dbl>, gdp <dbl>,
## #   life_expectancy <dbl>, child_mort <dbl>
```
### Graphing child mortality over time

```r
financing_healthcare %>%
  filter(continent != "", child_mort != "") %>%
  ggplot(aes(year, child_mort, color = continent)) +
    geom_point() +
    geom_smooth(color = 'black') +
    geom_vline(xintercept = 1925, linetype = 'dotted') +
    annotate("text", x = 1925, y = 750, label = '1925') +
    facet_wrap(~continent, scales = 'free') +
  labs(x = 'Year', y = 'Child Mortality (0-5 year-olds dying per 1,000 born)', title = 'Child Mortality over Time',
       subtitle = 'A big decrease in child morality was seen around 1925 because\nof the increase in living conditions across the world.',
       caption = 'Source: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1449154/') +
    theme_bw() +
    theme(legend.position =  'none',
          plot.title = element_text(size = 16,margin = margin(t = 1)),
          plot.subtitle = element_text(size = 10), 
          plot.caption = element_text(hjust = 0, colour = 'gray40'))
```

```
## `geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'
```

![](task11_files/figure-html/Child mortality-1.png)<!-- -->
