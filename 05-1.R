#install.packages("readxl")
rm(list = ls())
library(readxl)

exam <- read.csv("csv_exam.csv")
exam
head(exam)
tail(exam)
View(exam)
dim(exam)
str(exam)
summary(exam)

# install.packages("ggplot2")
library(ggplot2)

str(mpg)
head(mpg)
tail(mpg)
dim(mpg)
df_mpg <- as.data.frame(mpg)
str(df_mpg)
head(mpg)
tail(mpg)
dim(mpg)
summary(mpg)

