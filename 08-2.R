# 08-2 산점도
library(ggplot2)
theme_update(plot.title = element_text(hjust = 0.5))
theme_update(plot.subtitle = element_text(hjust = 0.7, vjust=0.2))

ggplot(data=mpg, aes(x=displ, y=hwy)) + 
  geom_point() + 
  xlim(3,6) + ylim(10, 30)

# 혼자서 해보기
# Q1
ggplot(data=mpg, aes(x=cty, y=hwy)) +
  geom_point()

# Q2
ggplot(data=midwest, aes(x=poptotal, y=popasian)) +
  geom_point() +
  xlim(0,500000) + ylim(0,10000)
