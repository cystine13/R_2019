# 06-6 집단별 요약하기
rm(list = ls())
library(dplyr)
library(ggplot2)
exam <- read.csv("csv_exam.csv")

# 요약하기

exam %>% summarise(mean_math = mean(math))

# 집단별로 요약하기

exam %>% group_by(class) %>% 
  summarise(mean_math = mean(math))

# 여러 통계량 집단별로 요약하기

exam %>% group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())

# 집단*집단 통계량 요약하기

mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(10)
