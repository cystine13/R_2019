#05-2 변수명 바꾸기
#install.packages("dplyr")
library(dplyr)
library(ggplot2)

df_raw <- data.frame(var1 = c(1,2,1),
                     var2 = c(2,3,2))

?rename

df_raw
df_new <- df_raw
df_new <- rename(df_new, v2=var2)

df_mpg <- as.data.frame(mpg)
df_mpg <- rename(df_mpg, city=cty)
df_mpg <- rename(df_mpg, highway=hwy)
df_mpg
