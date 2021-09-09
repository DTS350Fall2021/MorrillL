#Load Packages----
library(tidyverse)
library(downloader)
library(readxl)
#Parsing----
#Example 1
money <- c("4,554,25","$45","8025.33cents","288f45")
as.numeric(money)
parse_number(money)

#As.numeric(money) outputs: NAs introduced by coercion.
#parse_number(money) outputs:  455425.00  45.00  8025.33  288.00
#Parse number converted the strings to numbers but the as.numeric did not

#Example 2
my_string <- c("123",".","3a", "5.4")
parse_integer(my_string, na = ".")
problems(my_string)

#3a and 5.4 are not integers so the code throws an error 
#"." is also not an integer but na = "." means the code will ignore the "."

#Example 3
challenge <-  read_csv(readr_example("challenge.csv"))
problems(challenge)
head(challenge)
tail(challenge)

#We are expecting a X and a Y value, but it is only giving a X value.
#It is also not assigning the correct data type to Y.

challenge <- read_csv(
  readr_example("challenge.csv"),
  col_types = cols(
    x = col_double(),
    y = col_date()
  )
)
problems(challenge)
head(challenge)
tail(challenge)
view(challenge)

#Data Import----
setwd("C:/Users/logan/Documents/DTS 350/MorrillL/Week3/Task5")
getwd()
download.file("https://educationdata.urban.org/csv/ipeds/colleges_ipeds_completers.csv",
              "colleges_ipeds_completers.csv", mode = "wb")

ipeds <- read_csv("colleges_ipeds_completers.csv")
#Temporary files----
bob <- tempfile()
download("https://educationdata.urban.org/csv/ipeds/colleges_ipeds_completers.csv", bob, mode = "wb")
ipeds <- read_csv(bob)

#Saving files----
ipeds_2011 <- ipeds %>%
  filter(year == 2011)

write_csv(ipeds_2011, "colleges_ipeds_completers_2011.csv")

#Exercise 4

ipeds_completers <- ipeds %>%
  filter(year == 2014:2015, fips == 6)
head(ipeds_completers)
tail(ipeds_completers)

write_csv(ipeds_completers, "ipeds_completers_ca.csv")

#readxl Package----
download.file("https://www.hud.gov/sites/dfiles/Housing/documents/FHA_SFSnapshot_Apr2019.xlsx",
              "sfsnap.xlsx", mode = "wb")

excel_sheets("sfsnap.xlsx")

purchases <- read_excel("sfsnap.xlsx", sheet = "Purchase Data April 2019")
view(purchases)

#Exercise 5
refinances <- read_excel("sfsnap.xlsx", sheet = "Refinance Data April 2019")
view(refinances)
