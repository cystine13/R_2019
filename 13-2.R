#13-2 t 검정-두 집단의 평균 비교

library(dplyr)
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
mpg_diff <- mpg %>%
  select(class, cty) %>% 
  filter(class %in% c("compact", "suv"))

table(mpg_diff$class)

ggplot(data=mpg_diff, aes(x=class,y=cty)) + geom_boxplot()

t.test(data=mpg_diff, cty~class, var.equal=T)
t.test(data=mpg_diff, cty~class)

mpg_diff2 <- mpg %>%
  select(fl, cty) %>% 
  filter(fl %in% c("r", "p"))

table(mpg_diff2$fl)

ggplot(data=mpg_diff2, aes(x=fl,y=cty)) + geom_boxplot()

t.test(data=mpg_diff2, cty~fl, var.equal=T)
t.test(data=mpg_diff2, cty~fl)

t.test(mpg$cty, mpg$hwy, paired = TRUE)
