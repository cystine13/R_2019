# 07-1 빠진 데이터를 찾아라! - 결측치 정제하기
rm(list = ls())
library(dplyr)
library(ggplot2)

# 자료
df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA))

# 결측치 확인하기
is.na(df)
!is.na(df)
table(is.na(df))
table(is.na(df$sex))
table(is.na(df$score))
mean(df$score)
sum(df$score)

# 결측치 제거하기
df %>% filter(is.na(score))
df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)
sum(df_nomiss$score)

df_nomiss1 <- df %>% filter(!is.na(sex) & !is.na(score))
df_nomiss2 <- na.omit(df)

# 함수의 결측치 제외 기능 이용하기
mean(df$score, na.rm=T)
sum(df$score, na.rm=T)

exam <- read.csv("csv_exam.csv")
exam[c(3,8,15),"math"] <- NA
table(is.na(exam$math))
exam %>% summarise(math_mean = mean(math))
exam %>% summarise(math_mean = mean(math,na.rm=T))
exam %>% summarise(math_mean = mean(math,na.rm=T),
                   math_sum = sum(math,na.rm=T),
                   math_median = median(math,na.rm=T))

# 결측치 데체하기
mean(exam$math, na.rm=T)
exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))
mean(exam$math)

# test
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), "hwy"] <- NA
# Q1
table(is.na(mpg$hwy))
which(is.na(mpg$hwy))
mpg[which(is.na(mpg$hwy)),]
# Q2
mpg %>%
  filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(hwy_mean = mean(hwy)) %>% 
  arrange(desc(hwy_mean))
