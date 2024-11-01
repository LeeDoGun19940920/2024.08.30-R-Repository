# 시계열 데이터 그래프 애니메이션
# 전세계 국가(핀란드, 대한민국, 베트남)에 대한 연도별 기대수명과 국내 총생산(GDP) 와의 관계

library(ggplot2)
library(gganimate)
library(gifski)

install.packages("dplyr")
install.packages("gapminder")

library(dplyr)
library(gapminder)

# gapminder dataset 불러오기
gapminder

# 전세계 국가중에서 3개국 
# %>% : oracle에서의 특정 글자가 포함된 속성 불러오기와 비슷한 방법
df = gapminder %>% filter(country=="Finland" | country == "Korea, Rep." | country == "Vietnam")
df

# 시계열데이터 그래프
# x축: 1인당 총생산, y축: 기대수명
# 애니메이션 설정 추가
ggplot(df, aes(x = gdpPercap, y = lifeExp, size = pop, colour = country))+
  geom_point(alpha = 0.5)+ # alpha = 0.5: point 진하기를 결정해주는 방법
  scale_size(range = c(5, 15))+
  labs(title = "연도: frame_time", x = "1인당 GDP", y = "기대수명")

anim = ggplot(df, aes(x = gdpPercap, y = lifeExp, size = pop, colour = country))+
  geom_point(alpha = 0.5)+ # alpha = 0.5: point 진하기를 결정해주는 방법
  scale_size(range = c(5, 15))+
  labs(title = "연도: {frame_time}", x = "1인당 GDP", y = "기대수명")+
  transition_time(year)+
  shadow_wake(0.5) # 잔상효과 0 ~ 1사이의 값을 넣을 수 있다.

anim

# 애니메이션 실행
animate(anim, width = 500, height = 400, duration = 10, renderer = gifski_renderer(loop=TRUE))
