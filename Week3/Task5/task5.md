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

### Day 5 examples
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
library(downloader)
```

```
## Warning: package 'downloader' was built under R version 4.0.5
```

```r
library(readxl)
```


```r
download.file("https://educationdata.urban.org/csv/ipeds/colleges_ipeds_completers.csv",
              "colleges_ipeds_completers.csv", mode = "wb")
```

