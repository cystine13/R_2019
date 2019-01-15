# 06-4 순서대로 정렬하기
rm(list = ls())
library(dplyr)
exam <- read.csv("csv_exam.csv")

exam %>% arrange(math)
exam %>% arrange(desc(math))
exam %>% arrange(class, math)
exam %>% arrange(desc(class), math)

# test
# Q1
mpg %>% 
  filter(manufacturer == "audi") %>% 
  arrange(desc(hwy)) %>% 
  head(5)


