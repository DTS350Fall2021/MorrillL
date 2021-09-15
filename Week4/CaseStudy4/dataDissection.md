---
title: "Case Study 4"
author: "Logan Morrill"
date: "9/14/2021"
output: 
  html_document:
    theme: united
    keep_md: True
    code_folding: 'hide'
---



##### Load Data

```r
flightData <- tibble(flights)
head(flightData)
```

```
## # A tibble: 6 x 19
##    year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
##   <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
## 1  2013     1     1      517            515         2      830            819
## 2  2013     1     1      533            529         4      850            830
## 3  2013     1     1      542            540         2      923            850
## 4  2013     1     1      544            545        -1     1004           1022
## 5  2013     1     1      554            600        -6      812            837
## 6  2013     1     1      554            558        -4      740            728
## # ... with 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
## #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
## #   hour <dbl>, minute <dbl>, time_hour <dttm>
```

```r
str(flightData)
```

```
## tibble [336,776 x 19] (S3: tbl_df/tbl/data.frame)
##  $ year          : int [1:336776] 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 ...
##  $ month         : int [1:336776] 1 1 1 1 1 1 1 1 1 1 ...
##  $ day           : int [1:336776] 1 1 1 1 1 1 1 1 1 1 ...
##  $ dep_time      : int [1:336776] 517 533 542 544 554 554 555 557 557 558 ...
##  $ sched_dep_time: int [1:336776] 515 529 540 545 600 558 600 600 600 600 ...
##  $ dep_delay     : num [1:336776] 2 4 2 -1 -6 -4 -5 -3 -3 -2 ...
##  $ arr_time      : int [1:336776] 830 850 923 1004 812 740 913 709 838 753 ...
##  $ sched_arr_time: int [1:336776] 819 830 850 1022 837 728 854 723 846 745 ...
##  $ arr_delay     : num [1:336776] 11 20 33 -18 -25 12 19 -14 -8 8 ...
##  $ carrier       : chr [1:336776] "UA" "UA" "AA" "B6" ...
##  $ flight        : int [1:336776] 1545 1714 1141 725 461 1696 507 5708 79 301 ...
##  $ tailnum       : chr [1:336776] "N14228" "N24211" "N619AA" "N804JB" ...
##  $ origin        : chr [1:336776] "EWR" "LGA" "JFK" "JFK" ...
##  $ dest          : chr [1:336776] "IAH" "IAH" "MIA" "BQN" ...
##  $ air_time      : num [1:336776] 227 227 160 183 116 150 158 53 140 138 ...
##  $ distance      : num [1:336776] 1400 1416 1089 1576 762 ...
##  $ hour          : num [1:336776] 5 5 5 5 6 5 6 6 6 6 ...
##  $ minute        : num [1:336776] 15 29 40 45 0 58 0 0 0 0 ...
##  $ time_hour     : POSIXct[1:336776], format: "2013-01-01 05:00:00" "2013-01-01 05:00:00" ...
```
### Which origin airport is best to minimize my chances of a late arrival when I am using Delta Airlines?


```r
?flights
```

```
## starting httpd help server ... done
```

```r
head(airlines)
```

```
## # A tibble: 6 x 2
##   carrier name                    
##   <chr>   <chr>                   
## 1 9E      Endeavor Air Inc.       
## 2 AA      American Airlines Inc.  
## 3 AS      Alaska Airlines Inc.    
## 4 B6      JetBlue Airways         
## 5 DL      Delta Air Lines Inc.    
## 6 EV      ExpressJet Airlines Inc.
```

```r
best_delta_arrival_flights <- flightData %>%
  select(carrier, year:day, arr_delay, origin) %>%
  group_by(origin) %>%
  filter(carrier == "DL") %>%
  arrange(arr_delay)
head(best_delta_arrival_flights)
```

```
## # A tibble: 6 x 6
## # Groups:   origin [1]
##   carrier  year month   day arr_delay origin
##   <chr>   <int> <int> <int>     <dbl> <chr> 
## 1 DL       2013     5     6       -71 JFK   
## 2 DL       2013     2    27       -69 JFK   
## 3 DL       2013     2    28       -69 JFK   
## 4 DL       2013     2    26       -68 JFK   
## 5 DL       2013     3     1       -68 JFK   
## 6 DL       2013     4    30       -68 JFK
```

```r
?airports
#Figure out the name of the best airport for departure
airports %>%
  select(faa, name) %>%
  filter(faa == "JFK")
```

```
## # A tibble: 1 x 2
##   faa   name               
##   <chr> <chr>              
## 1 JFK   John F Kennedy Intl
```
John F Kennedy International is the best airport to depart from to minimize arrival delay on Delta Airline flights.

### Which destination airport is the worst (you decide on the metric for worst) airport for arrival time?


