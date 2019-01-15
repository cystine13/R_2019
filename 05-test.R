rm(list = ls())
library(dplyr)
r_2019 <- read.csv("height.CSV")

str(r_2019)

r_2019_new <- rename(r_2019, id=x1, sex=x2, major=x3, height=x4)

mean(r_2019_new$height)

#install.packages("readxl")
library(readxl)
pop <- read_excel("population.xlsx",sheet=3)
sum(pop$x3)

pop_a <- pop %>% 
  filter(x2 == "소계") %>% 
  select(x1,x3)
  arrange(desc(x3))

pop_b <- pop %>% 
  filter(x2 != "소계") %>% 
  group_by(x1) %>% 
  summarise(tot = sum(x3),
            male = sum(x4),
            female = sum(x5)) %>% 
  select(x1,tot) %>% 
  arrange(desc(tot))

pop_tot <- left_join(pop_a,pop_b,by="x1") %>% 
  mutate(gab=x3-tot)
