# 06-6 집단별 요약하기
rm(list = ls())
library(dplyr)
library(ggplot2)
exam <- read.csv("csv_exam.csv")

# 요약하기

exam %>% summarise(math_mean = mean(math))
mean(exam$math)

# 집단별로 요약하기

exam %>% group_by(class) %>% 
  summarise(math_mean = mean(math))

# 여러 통계량 집단별로 요약하기

exam %>% group_by(class) %>% 
  summarise(math_mean = mean(math),
            math_sum = sum(math),
            math_median = median(math),
            n = n())

# 집단*집단 통계량 요약하기

mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(cty_mean = mean(cty))

# dplyr 조합하기
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "suv") %>% 
  mutate(tot = (cty + hwy)/2) %>% 
  summarise(mean_tot=mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(5)

# test
# Q1
mpg %>% 
  group_by(class) %>% 
  summarise(cty_mean = mean(cty))
# Q2
mpg %>% 
  group_by(class) %>% 
  summarise(cty_mean = mean(cty)) %>% 
  arrange(desc(cty_mean))
# Q3
mpg %>% 
  group_by(class) %>% 
  summarise(hwy_mean = mean(hwy)) %>% 
  arrange(desc(hwy_mean)) %>% 
  head(3)
# Q4
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "compact") %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))
