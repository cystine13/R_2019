# 08-3 막대 그래프
library(dplyr)

df_mpg <- mpg %>% 
  group_by(drv) %>% 
  summarise(hwy_mean=mean(hwy))

df_mpg

# 집계자료(요약표)로 막대 그래프 그리기
ggplot(data=df_mpg, aes(x=drv,y=hwy_mean)) +
  geom_col()

# 집계자료(요약표)로 막대 그래프 그리기 + 빈도순으로 정렬
ggplot(data=df_mpg, aes(x=reorder(drv,-hwy_mean),y=hwy_mean)) +
  geom_col()

# 원자료로 막대 그래프 그리기
# 질적 자료
ggplot(data=mpg, aes(x=drv, fill=drv)) +
  geom_bar() + scale_fill_brewer(palette = "Blues")

# 양적 자료
ggplot(data=mpg, aes(x=hwy)) +
  geom_bar()

# 혼자서 해보기
# Q1
df_mpg_suv <- mpg %>% 
  filter(class=="suv") %>% 
  group_by(manufacturer) %>% 
  summarise(cty_mean = mean(cty)) %>% 
  arrange(desc(cty_mean)) %>% 
  head(5)

ggplot(data=df_mpg_suv, aes(x=reorder(manufacturer,-cty_mean),y=cty_mean)) +
  geom_col()

# Q2
ggplot(data=mpg, aes(x=class)) +
  geom_bar()

# 파이프 연산자를 사용해서 막대 그래프 그리기
mpg %>% 
  filter(class=="suv") %>% 
  group_by(manufacturer) %>% 
  summarise(cty_mean = mean(cty)) %>% 
  arrange(desc(cty_mean)) %>% 
  head(5) %>% 
  ggplot(aes(x=reorder(manufacturer,-cty_mean),y=cty_mean)) +
  geom_col()

# geom_col() 대신 geom_bar() 사용하기
mpg %>% 
  filter(class=="suv") %>% 
  group_by(manufacturer) %>% 
  summarise(cty_mean = mean(cty)) %>% 
  arrange(desc(cty_mean)) %>% 
  head(5) %>% 
  ggplot(aes(x=reorder(manufacturer,-cty_mean),y=cty_mean)) +
  geom_bar(stat="identity") +
  labs(x = "New x axis label",
       y = "New y axis label",
       title ="Add a title above the plot",
       subtitle = "Add a subtitle below title",
       caption = "Add a caption below plot")     

