install.packages("gganimate")
install.packages("gifski")

library(ggplot2)
library(gganimate)
library(gifski)

# 그래프를 그리기 위한 데이터셋 필요
# 데이터셋 : 영업팀별 분기별 데이터셋

# 1분기 데이터
dept = c("영업 1팀", "영업 2팀", "영업 3팀")

# 1분기 데이터
sales = c(12, 5, 8)

#데이터 프레임 생성
df1 = data.frame(부서 = dept, 매출 = sales, 분기 = "1분기")
df1

# 2분기 데이터
sales = c(10, 8, 5)
df2 = data.frame(부서 = dept, 매출 = sales, 분기 = "2분기")
df2

df = rbind(df1, df2)
df

anim = ggplot(df, aes(x = 부서, y = 매출, fill = 분기)) +
  geom_bar(stat = "identity") +
  labs(title = "부서별 분기별 영업실적")+
  transition_states(분기)

# 애니매이션 효과 및 실행
animate(anim, width = 300, heigth = 100, duration = 3, renderer = gifski_renderer(loop = 2))
# loop = 3 은 3회 반복을 해서 보여 준다.
# duration = 3. 3초 단위로 변한다.

# 애니메이션으로 ENCODING 된 그래프를 gif 형식의 이미지로 저장하는 방법
anim_save("분기별 부서별 영어실적.gif", path = "C:/Users/Leedogun/Desktop/Rstudio workspace")

# 데이터셋 : 기본 제공되는 iris
iris

# 산포도 그래프 그리기
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, fill = Species, color = Species)) +
  # 종별로 다른 색으로 채워서 구분짓기에 fill = species가 된다.
  geom_point(size = 3, alpha = 0.5) + # alpha값을 안 주면 진하게 나온다.
  labs(title = "꽃받침 크기와 종의 분포도", x = "꽃받침 길이", y = "꽃받침 넓이")
  
# iris 산포도 그래프 -> 애니매이션 설정
anim = ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, fill = Species, color = Species)) +
  # 종별로 다른 색으로 채워서 구분짓기에 fill = species가 된다.
  geom_point(size = 3, alpha = 0.5) + # alpha값을 안 주면 진하게 나온다.
  labs(title = "꽃받침 크기와 종의 분포도", x = "꽃받침 길이", y = "꽃받침 넓이")+
  transition_states(Species)

# 실행
animate(anim, width = 400, height = 300, duration = 8, renderer = gifski_renderer(loop = TRUE))
