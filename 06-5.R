# 06-5 파생변수 추가하기
rm(list = ls())
library(dplyr)
library(ggplot2)
exam <- read.csv("csv_exam.csv")

exam %>% 
  mutate(total = math + english + science) %>% 
  head

exam %>% 
  mutate(total = math + english + science,
         total_mean = (math + english + science)/3) %>% 
  head

exam %>% 
  mutate(total_mean = (math + english + science)/3,
         test = ifelse(total_mean >= 60, "pass", "fail")) %>% 
  head

exam %>% 
  mutate(total = math + english + science) %>% 
  arrange(desc(total)) %>% 
  head

# test
# Q1
mpg %>% mutate(total=cty+hwy)
# Q2
mpg %>% 
  mutate(total=cty+hwy,
         total_mean=(cty+hwy)/2)
# Q3, Q4
mpg %>% 
  mutate(total=cty+hwy,
         total_mean=(cty+hwy)/2) %>% 
  arrange(desc(total_mean)) %>% 
  head(3)
