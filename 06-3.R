#06-3 필요한 변수만 추출하기
library(dplyr)
exam <- read.csv("csv_exam.csv")

# 변수 추출하기
exam %>% select(math)
exam %>% select(class, math, english)
exam %>% select(-math)
exam %>% select(-math, -english)
exam %>% select(-math, -english, class)
exam %>% select(class, -math, -english)

# dplyr 함수 조합하기
exam %>% 
  filter(class ==1) %>% 
  select(english)

exam %>%
  select(id, math) %>% 
  head

# test
# Q1
mpg_subset <- mpg %>% select(class, cty)
# Q2
mpg_subset_suv <- mpg_subset %>%  filter(mpg_subset$class == "suv")
mpg_subset_com <- mpg_subset %>%  filter(mpg_subset$class == "compact")
mean(mpg_subset_suv$cty)
mean(mpg_subset_com$cty)
