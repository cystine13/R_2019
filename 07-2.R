# 07-2 이상한 데이터를 찾아라! - 이상치 정제하기기
rm(list = ls())
library(dplyr)
library(ggplot2)

# 이상치 제거하기-존재할 수 없는 값
# 자료
outlier <- data.frame(sex=c(1,2,1,3,2,1),
                      score=c(5,4,3,4,2,6))
# 이상치 확인하기
table(outlier$sex)
table(outlier$score)
# 이상치 처리하기
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier %>% 
  filter(!is.na(outlier$sex) & !is.na(outlier$score)) %>% 
  group_by(sex) %>% 
  summarise(score_mean=mean(score))
  

# 극단치 제거하기-극단적인 값
# 자료
mpg <- as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)
# 통계량 출력
boxplot(mpg$hwy)$stat
# 결측 처리하기
mpg$hwy <- ifelse(mpg$hwy <12 | mpg$hwy >37, NA, mpg$hwy)
table(is.na(mpg))
mpg %>% 
  group_by(drv) %>% 
  summarise(hwy_mean=mean(hwy,na.rm=T))

str(boxplot(mpg$hwy))
names(boxplot(mpg$hwy))
boxplot(mpg$hwy)$stat
boxplot(mpg$hwy)$n
boxplot(mpg$hwy)$conf
boxplot(mpg$hwy)$out
boxplot(mpg$hwy)$group
boxplot(mpg$hwy)$names

?boxplot
# test
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93), "drv"] <- "k"
mpg[c(29,43,129,203), "cty"] <- c(3,4,39,42)
# Q1
table(mpg$drv)
mpg$drv <- ifelse(mpg$drv %in% c("4", "f", "r"), mpg$drv, NA)
table(mpg$drv)
table(is.na(mpg$drv))
# Q2
boxplot(mpg$cty)
boxplot(mpg$cty)$stat
mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$cty)
boxplot(mpg$cty)
table(is.na(mpg$cty))
# Q3
mpg %>% 
  filter(!is.na(drv) & !is.na(cty)) %>% 
  group_by(drv) %>% 
  summarise(cty_mean=mean(cty))
