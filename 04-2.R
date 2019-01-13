# 04-2 데이터 프레임 만들기

english <- c(90, 80, 60, 70)
math <- c(50, 60, 10, 20)
df_midterm <- data.frame(english, math)

df_midterm <- data.frame(english <- c(90, 80, 60, 70),
                         math <- c(50, 60, 10, 20),
                         class <- c(1,1,2,2))

df_midterm[1,]
df_midterm[,1]
df_midterm[1:2,]
df_midterm[3:4,]
df_midterm$class
head(df_midterm)

# 기초통계
mean(df_midterm[,1])
mean(df_midterm$english)

# test
df_fruit <- data.frame(item <- c("사과", "딸기", "수박"),
                    price <- c(1800, 1500, 3000),
                    sales <- c(24,38,13))
mean(df_fruit$price)
mean(df_fruit$sales)
