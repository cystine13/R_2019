rm(list = ls())

x <- 2
y <- 3
x + y
x - y
x * y
x / y
# factor
x <- c(1,2,3,4)
y <- c(4,5,6)
x + y
x
x[1]+y[1]
seq(3)
rep(1,3)
z = rep(1,3)
x + z
x + 1
y <- c(4,5)
x + y
x <- seq(4)
x + y
x
y

# mean, max, min
min(x)
max(x)
mean(x)
sum(x)
length(x)
sum(x)/length(x)
median(x)

# text
x <- "hello"
x
y <- "World!"
y
x + y
paste(x, y)
paste(x, y, sep = "")
paste(x, y, sep = ", ")

# pakage install, load
# install.packages("ggplot2")
library(ggplot2)
z <- c("a", "b", "C", "a")
qplot(z)

options(scipen=999)  # turn-off scientific notation like 1e+48
library(ggplot2)
theme_set(theme_bw())  # pre-set the bw theme.
data("midwest", package = "ggplot2")
# midwest <- read.csv("http://goo.gl/G1K41K")  # bkup data source

# Scatterplot
gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state, size=popdensity)) + 
  geom_smooth(method="loess", se=F) + 
  xlim(c(0, 0.1)) + 
  ylim(c(0, 500000)) + 
  labs(subtitle="Area Vs Population", 
       y="Population", 
       x="Area", 
       title="Scatterplot", 
       caption = "Source: midwest")

plot(gg)

# test
score <- c(80, 60, 70, 50, 90)
mean(score)
score_avg <- mean(score)
score_avg