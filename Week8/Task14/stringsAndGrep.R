#Libraries----
library(stringr)
library(readr)
library(downloader)
#Load Data----
#Random numbers data
txt_data <- tempfile()
download("https://github.com/WJC-Data-Science/DTS350/raw/master/randomletters.txt", txt_data, mode = "wb")
random_letters <- read_lines(txt_data)
#Randon numbers w letters data
download("https://github.com/WJC-Data-Science/DTS350/raw/master/randomletters_wnumbers.txt", txt_data, mode = "wb")
random_letters_w_numbers <- read_lines(txt_data)
#Hidden message----
hidden_message <- c()
for (i in seq(1, str_length(random_letters)/1700)) {
  if (i == 1) {
    hidden_message <- str_c(hidden_message, str_sub(random_letters, start = 1, end = 1))
  }
  hidden_message <- str_c(hidden_message, str_sub(random_letters, start = i*1700, end = i*1700))
  if (str_sub(random_letters, i*1700, end = i*1700) == ".") {
    break
  }
}
hidden_message
#Change numbers----
hidden_message <- unlist(str_extract_all(random_letters_w_numbers, ("(\\d)+")))
decoded <- c()

for (i in seq(1,length(hidden_message))) {
  decoded <- append(decoded,letters[as.integer(hidden_message[i])])
}
decoded <- paste(decoded,collapse = " ")
decoded
#Longest palindrome----

str_extract_all(random_letters, "(.)(.)(.)(.)\\4\\3\\2\\1")

#Finding longest string of vowels----
longest <- c("0")
random_letters_no_spaces_periods <- random_letters %>%
  str_remove_all(" ") %>%
  str_remove_all("\\.")

vowels <- unlist(str_extract_all(random_letters_no_spaces_periods,"([aeiou])+"))

for (i in seq(1,length(vowels))) {
  if (str_length(vowels[i]) > str_length(longest[length(longest)])) {
    longest <- vowels[i]
  }
}
longest
