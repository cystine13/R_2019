# 06-7 데이터 합치기
rm(list = ls())
library(dplyr)
library(ggplot2)
# 가로로 합치기(1)
# 중간고사 데이터 생성
mid <- data.frame(id=c("1","2","3","4","5"),
                  midterm=c(60,80,70,90,85))
# 기말고사 데이터 생성
final <- data.frame(id=c("1","2","3","4","6"),
                    final=c(70,83,65,95,80))
# 
total <- left_join(mid,final,by="id")
str(mid)
# 가로로 합치기(2)
exam <- read.csv("csv_exam.csv")
name <- data.frame(class=c(1,2,3,4,5),
                   teacher=c("kim","lee","park","choi","jung"))
exam_new <- left_join(exam, name, by = "class")

# 세로로 합치기
group_a <- data.frame(id=c("1","2","3","4","5"),
                      test=c(60,80,70,90,85), stringsAsFactors = F)
group_b <- data.frame(id=c("6","7","8","9","10"),
                    test=c(70,83,65,95,80), stringsAsFactors = F)
group_all <- bind_rows(group_a,group_b)

# test
fuel <- data.frame(fl=c("c","d","e","p","r"),
                   price_fl=c(2.35,2.38,2.11,2.76,2.22),
                   stringsAsFactors = F)
# Q1
mpg_new <- left_join(mpg,fuel,by="fl")
# Q2
mpg_new %>% 
  select(model,fl,price_fl) %>% 
  head(5)

# 문제1
midwest %>% 
  mutate(ratio=(poptotal-popadults)/poptotal) %>% 
  select(county,ratio) %>% 
  arrange(desc(ratio)) %>% 
  head(5)
# 문제3
midwest_new <- midwest %>% 
                mutate(ratio=(poptotal-popadults)/poptotal,
                       grade=ifelse(ratio>=0.4,"Large", ifelse(ratio>=0.3,"Middle","Small"))) %>% 
                select(county,ratio,grade) %>% 
                arrange(desc(ratio))
table(midwest_new$grade)
# 문제4
midwest %>% 
  mutate(asian_ratio=popasian/poptotal) %>% 
  select(state,county,asian_ratio) %>% 
  arrange(asian_ratio) %>% 
  head(10)
