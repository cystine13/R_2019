#06-2 조건에 맞는 데이터만 추출하기
rm(list = ls())
library(dplyr)
exam <- read.csv("csv_exam.csv")

# 1개의 조건
exam %>% filter(class == 1)
exam %>% filter(class != 1)
exam %>% filter(math > 50)
exam %>% filter(math >= 50)

# 2개이상의 조건
exam %>% filter(class == 1 & math > 50)
exam %>% filter(class == 1 | math > 50)
exam %>% filter(math > 50 | english > 50)
exam %>% filter(class == 1 | class == 2 | class == 3)
exam %>% filter(class %in% c(1,2,3))

# 추출한 행으로 데이터 만들기
class1 <- exam %>% filter(class == 1)
mean(class1$math)

# test
# Q1
displ_le4 <- mpg %>% filter(mpg$displ <= 4)
displ_g4 <- mpg %>% filter(mpg$displ > 4)
mean(displ_le4$hwy)
mean(displ_g4$hwy)
# Q2
audi <- mpg %>% filter(mpg$manufacturer == "audi")
toyota <- mpg %>% filter(mpg$manufacturer == "toyota")
mean(audi$cty)
mean(toyota$cty)
# Q3
manufact_subset <- mpg %>% filter(mpg$manufacturer %in% c("chevrolet","ford","honda"))
table(manufact_subset$manufacturer)
mean(manufact_subset$hwy)
