---
title: "Task 4"
author: "Logan Morrill"
date: "9/7/2021"
output: 
  html_document:
    theme: united
    keep_md: True
    code_folding: 'hide'
---

##### Load Packages

```r
library(tidyverse)
```

```
## -- Attaching packages --------------------------------------- tidyverse 1.3.0 --
```

```
## v ggplot2 3.3.3     v purrr   0.3.4
## v tibble  3.0.5     v dplyr   1.0.7
## v tidyr   1.1.2     v stringr 1.4.0
## v readr   1.4.0     v forcats 0.5.0
```

```
## Warning: package 'dplyr' was built under R version 4.0.5
```

```
## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(dplyr)
library(downloader)
```

```
## Warning: package 'downloader' was built under R version 4.0.5
```

```r
library(readxl)
```


```r
SoloData <- tibble(read.csv("solo-artist-followers.csv"))
head(SoloData)
```

```
## # A tibble: 6 x 5
##   name              band   followers band_followers follower_difference
##   <chr>             <chr>  <chr>     <chr>          <chr>              
## 1 Daron Jones       112    1.28k     783k           âˆ’782k            
## 2 Slim              112    2.14k     783k           âˆ’781k            
## 3 Q Parker          112    3.51k     783k           âˆ’780k            
## 4 JC Chasez         *NSYNC 30.8k     1.44M          âˆ’1.41M           
## 5 Joey Fatone       *NSYNC 1.13k     1.44M          âˆ’1.44M           
## 6 Justin Timberlake *NSYNC 10.3M     1.44M          8.90M
```

```r
BillboardData <- tibble(read.csv("billboard-hits.csv"))
view(BillboardData)
```

All data types seem to be imported correctly.



```r
atleast_six_hits <- BillboardData %>%
  group_by(name) %>%
  filter(n() > 6 & band != "")

view(atleast_six_hits)
```


```r
band_hits <- BillboardData %>% 
  group_by(band) %>%
  filter(name %in% atleast_six_hits$band)
band_hits <- rename(band_hits, band = name, name = band)
view(band_hits)
```


```r
ggplot(data = atleast_six_hits, aes(x = peak_date, y = peak_rank, color = name, group = name)) +
  geom_point() +
  geom_line() +
  geom_point(data = band_hits, color = 'black') +
  geom_line(data = band_hits, color = 'black',linetype = 'dotted') +
  facet_wrap(~band) +
  theme_bw()
```

```
## geom_path: Each group consists of only one observation. Do you need to adjust
## the group aesthetic?
```

![](task5_files/figure-html/Graphing-1.png)<!-- -->

