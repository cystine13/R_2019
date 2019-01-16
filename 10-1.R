#install.packages("rJava")
#install.packages("memoise")
#install.packages("KoNLP")

library(KoNLP)
library(dplyr)

useNIADic()

txt <- readLines("hiphop.txt")
head(txt)

#install.packages("stringr")

library(stringr)

txt <- str_replace_all(txt, "\\W", " ")
head(txt)

nouns <- extractNoun(txt)
wordcount <- table(unlist(nouns))
df_word <- as.data.frame(wordcount, stringsAsFactors = F)
str(df_word)
df_word <- rename(df_word, word=Var1, freq=Freq)
df_word <- filter(df_word, nchar(word) >= 2)

#install.packages("wordcloud")

library(wordcloud)
library(RColorBrewer)

pal <- brewer.pal(8,"Dark2")
set.seed(1234)
wordcloud(words=df_word$word,
          freq=df_word$freq,
          min.freq = 2,
          max.words = 100,
          random.order = F,
          rot.per = .5,
          scale = c(5,1),
          colors=pal)
?wordcloud

wordcloud(c(letters, LETTERS, 0:9), seq(1, 1000, len = 62))

