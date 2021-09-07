---
title: "Task 4"
author: "Logan Morrill"
date: "9/7/2021"
output: 
  html_document:
    theme: united
    keep_md: True
---
#### Load Packages

```r
library(dplyr)
```

```
## Warning: package 'dplyr' was built under R version 4.0.5
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
#pipe %>% = 'then'
#%in% c(10,12)
#!is.na
```
#### Load iris data

```r
iris_data <- tibble(iris)
str(iris_data)
```

```
## tibble [150 x 5] (S3: tbl_df/tbl/data.frame)
##  $ Sepal.Length: num [1:150] 5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
##  $ Sepal.Width : num [1:150] 3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
##  $ Petal.Length: num [1:150] 1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
##  $ Petal.Width : num [1:150] 0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
##  $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
```

```r
tail(iris_data)
```

```
## # A tibble: 6 x 5
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species  
##          <dbl>       <dbl>        <dbl>       <dbl> <fct>    
## 1          6.7         3.3          5.7         2.5 virginica
## 2          6.7         3            5.2         2.3 virginica
## 3          6.3         2.5          5           1.9 virginica
## 4          6.5         3            5.2         2   virginica
## 5          6.2         3.4          5.4         2.3 virginica
## 6          5.9         3            5.1         1.8 virginica
```
#### Arrange iris data based on Sepal.Length

```r
head(arrange(iris_data, Sepal.Length), n = 10)
```

```
## # A tibble: 10 x 5
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
##           <dbl>       <dbl>        <dbl>       <dbl> <fct>  
##  1          4.3         3            1.1         0.1 setosa 
##  2          4.4         2.9          1.4         0.2 setosa 
##  3          4.4         3            1.3         0.2 setosa 
##  4          4.4         3.2          1.3         0.2 setosa 
##  5          4.5         2.3          1.3         0.3 setosa 
##  6          4.6         3.1          1.5         0.2 setosa 
##  7          4.6         3.4          1.4         0.3 setosa 
##  8          4.6         3.6          1           0.2 setosa 
##  9          4.6         3.2          1.4         0.2 setosa 
## 10          4.7         3.2          1.3         0.2 setosa
```
#### Select Species and Petal.Width

```r
testdat <- select(iris_data, Species, Petal.Width)
head(testdat)
```

```
## # A tibble: 6 x 2
##   Species Petal.Width
##   <fct>         <dbl>
## 1 setosa          0.2
## 2 setosa          0.2
## 3 setosa          0.2
## 4 setosa          0.2
## 5 setosa          0.2
## 6 setosa          0.4
```
#### Find species means

```r
species_mean <- 
  iris_data %>%
  group_by(Species) %>%
  summarise(
    Sepal_Width_Mean = mean(Sepal.Width), Sepal_Length_Mean = mean(Sepal.Length),Petal_Width_Mean = 
    mean(Petal.Width), Petal_Length_Mean = mean(Petal.Length))

species_mean
```

```
## # A tibble: 3 x 5
##   Species   Sepal_Width_Mean Sepal_Length_Mean Petal_Width_Mean Petal_Length_Me~
##   <fct>                <dbl>             <dbl>            <dbl>            <dbl>
## 1 setosa                3.43              5.01            0.246             1.46
## 2 versicol~             2.77              5.94            1.33              4.26
## 3 virginica             2.97              6.59            2.03              5.55
```
#### Filter Iris data based on Sepal.Width & Petal.Width

```r
iris_min <- filter(iris_data, Sepal.Width <= 3, Petal.Width != 2.5)
head(iris_min)
```

```
## # A tibble: 6 x 5
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
##          <dbl>       <dbl>        <dbl>       <dbl> <fct>  
## 1          4.9         3            1.4         0.2 setosa 
## 2          4.4         2.9          1.4         0.2 setosa 
## 3          4.8         3            1.4         0.1 setosa 
## 4          4.3         3            1.1         0.1 setosa 
## 5          5           3            1.6         0.2 setosa 
## 6          4.4         3            1.3         0.2 setosa
```
#### Categorize Sepal.Length

```r
iris_size <- iris_data %>%
  mutate(Sepal.Size =
          case_when(
            Sepal.Length < 5 ~ "small", 
            Sepal.Length >= 5 & Sepal.Length < 6.5 ~ "medium",
            Sepal.Length >= 6.5 ~ "large"))
iris_size
```

```
## # A tibble: 150 x 6
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species Sepal.Size
##           <dbl>       <dbl>        <dbl>       <dbl> <fct>   <chr>     
##  1          5.1         3.5          1.4         0.2 setosa  medium    
##  2          4.9         3            1.4         0.2 setosa  small     
##  3          4.7         3.2          1.3         0.2 setosa  small     
##  4          4.6         3.1          1.5         0.2 setosa  small     
##  5          5           3.6          1.4         0.2 setosa  medium    
##  6          5.4         3.9          1.7         0.4 setosa  medium    
##  7          4.6         3.4          1.4         0.3 setosa  small     
##  8          5           3.4          1.5         0.2 setosa  medium    
##  9          4.4         2.9          1.4         0.2 setosa  small     
## 10          4.9         3.1          1.5         0.1 setosa  small     
## # ... with 140 more rows
```
#### Rank Petal.Length

```r
iris_rank <- arrange(iris_data, desc(Petal.Length))
iris_rank
```

```
## # A tibble: 150 x 5
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species  
##           <dbl>       <dbl>        <dbl>       <dbl> <fct>    
##  1          7.7         2.6          6.9         2.3 virginica
##  2          7.7         3.8          6.7         2.2 virginica
##  3          7.7         2.8          6.7         2   virginica
##  4          7.6         3            6.6         2.1 virginica
##  5          7.9         3.8          6.4         2   virginica
##  6          7.3         2.9          6.3         1.8 virginica
##  7          7.2         3.6          6.1         2.5 virginica
##  8          7.4         2.8          6.1         1.9 virginica
##  9          7.7         3            6.1         2.3 virginica
## 10          6.3         3.3          6           2.5 virginica
## # ... with 140 more rows
```
#### Stdevs and means for each Species

```r
?summarize_all()
```

```
## starting httpd help server ... done
```

```r
mean_by_species <-
  iris_data %>%
  group_by(Species) %>%
  summarize_all(list(Mean = mean,Std_dev = sd))

mean_by_species
```

```
## # A tibble: 3 x 9
##   Species   Sepal.Length_Mean Sepal.Width_Mean Petal.Length_Me~ Petal.Width_Mean
##   <fct>                 <dbl>            <dbl>            <dbl>            <dbl>
## 1 setosa                 5.01             3.43             1.46            0.246
## 2 versicol~              5.94             2.77             4.26            1.33 
## 3 virginica              6.59             2.97             5.55            2.03 
## # ... with 4 more variables: Sepal.Length_Std_dev <dbl>,
## #   Sepal.Width_Std_dev <dbl>, Petal.Length_Std_dev <dbl>,
## #   Petal.Width_Std_dev <dbl>
```



