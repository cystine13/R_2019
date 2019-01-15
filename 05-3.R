#05-3 파생변수 만들기
rm(list = ls())
library(dplyr)
library(ggplot2)

df <- data.frame(var1 = c(90,80,60,70),
                 var2 = c(50,60,100,20))

df$sum <- df$var1 + df$var2
df$mean <- (df$var1 + df$var2)/2

head(mpg)
mpg$total <- (mpg$cty + mpg$hwy)/2

summary(mpg$total)
mean(mpg$total)
hist(mpg$total, main="Histogram of Total", xlab="Total", ylab="mileage (mile)")
?hist

# 조건문

ifelse(mpg$total>=20,"pass","fail")
mpg$test <- ifelse(mpg$total>=20,"pass","fail")
mpg
table(mpg$test)
qplot(mpg$test)

# 중첩조건문
mpg$grade <- ifelse(mpg$total>=30,"A",
                   ifelse(mpg$total>=20,"B","C"))
table(mpg$grade)
qplot(mpg$grade)

# test
# 문제1
df_midwest <- as.data.frame(midwest)
# 문제2
df_midwest <- rename(df_midwest, total=poptotal)
df_midwest <- rename(df_midwest, asian=popasian)
# 문제3
df_midwest$ratio <- df_midwest$asian/df_midwest$total
hist(df_midwest$ratio)
# 문제4
summary(df_midwest$ratio)
df_midwest$size <- ifelse(df_midwest$ratio >= 0.004872,"large","small")
# 문제5
table(df_midwest$size)
qplot(df_midwest$size)
