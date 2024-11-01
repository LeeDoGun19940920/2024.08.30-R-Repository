library(ggplot2)

data = read.csv('https://raw.githubusercontent.com/cran/BTYD/master/data/cdnowElog.csv', header = T)
data

head(data)

data$cds

k = nclass.Sturges(data$cds)

k

ggplot(data = data, aes(x = cds)) +
  geom_histogram(col = "black", fill = "yellow", bins = k) +
  labs(title = "거래량에 따른 빈도수", x = "거래량", y = "빈도수")
