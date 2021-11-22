---
title: "Task 22"
author: "Logan Morrill"
date: "11/22/2021"
output: 
  html_document:
    theme: united
    keep_md: True
    code_folding: 'hide'
---




```r
#Function to create animated stock graph
stonk_calculator <- function(tickers) {
  stonks <- tq_get(tickers, get = "stock.prices", from = today() - years(5), to = today()) %>%
    ggplot(aes(x = date, y = close, color = symbol)) +
    geom_line() +
    transition_reveal(date) +
    labs(y = "", x = "") +
    theme_tq() +
    theme(legend.position = 'top')
  
  stonks
}
```


```r
#Create stock graph from given tickers
t <- c('QQQ','MO','KO','ABB','LH','PFE','CINF')

stonk_calculator(t)
```

![](task22_files/figure-html/unnamed-chunk-3-1.gif)<!-- -->

Recreated from Case Study 10
