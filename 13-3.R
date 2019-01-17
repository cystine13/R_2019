#13-3 상관분석 - 두 변수의 관계성 분석

library(dplyr)
library(ggplot2)

# 1. 상관관계 분석
economics <- as.data.frame(ggplot2::economics)
cor.test(economics$unemploy, economics$pce)
ggplot(data=economics, aes(x=economics$pce,y=economics$unemploy)) + geom_point()

# 2. 상관행렬 히트맨 만들기
head(mtcars)
car_cor <- cor(mtcars)
round(car_cor,2)

#install.packages("corrplot")
library(corrplot)

corrplot(car_cor)
corrplot(car_cor, method="number")
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))

corrplot(car_cor,
         method="color",
         col=col(200),
         type="lower",
         order = "hclust",
         addCoef.col="black",
         tl.col="black",
         tl.srt=45,
         diag=F
         )

cor.test(mpg$cty, mpg$hwy)
ggplot(data=mpg, aes(x=cty,y=hwy)) + geom_point()
