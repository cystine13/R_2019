# 08-5 상자 그림
library(dplyr)
library(ggplot2)

ggplot(data=mpg, aes(x=drv,y=hwy)) +
  geom_boxplot()

# 혼자서 해보기
ggplot(data=mpg, aes(x=class, y=cty)) +
  geom_boxplot()

mpg %>% 
  filter(class %in% c("compact","subcompact","suv")) %>% 
  ggplot(aes(x=class, y=cty)) +
  geom_boxplot()
