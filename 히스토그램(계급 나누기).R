library(ggplot2)

city = c("서울", "부산", "대구", "인천", "광주", "대전", "울산")
pm25 = c(18,21, 21, 17, 8, 11, 25)

df = data.frame(지역 = city, 초미세먼지농도 = pm25)

ggplot(df, aes(x="", y=초미세먼지농도, fill = 지역)) +
  geom_bar(stat="identity", color="black") +
  coord_polar(theta = "y") +
  geom_text(aes(label=초미세먼지농도), color="white", position = position_stack(vjust = 0.5)) +
  theme_void() +
  labs(title="주요 도시별 초미세먼지 농도") +
  theme(plot.title = element_text(hjust = 0.5, size = 17, face = "bold")) +
  scale_fill_manual(values = c("red", "orange", "gold", "darkgreen", "blue", "navy", "purple"));

# 히스토그램
# 다수의 data가 있는 경우 특정 값이 나타나는 빈도수를 출력하는 그래프
# 방대한 량의 데이터 값을 구간별로 나눈 것을 계급이라고 한다.
# 그 계급(구간)에 포함 된 수를 계산해서 시각화 한 것이 히스토그램이다.

quakes
# 지진강도별 지진 발생 횟수
ggplot(data = quakes, aes(x = mag)) +
  # mag == 물리학이나 지구과학에서 특정한 양의 크기나 세기를 나타낸다.
  geom_histogram(col = "black", fill = "pink")+
  labs(title = "지진강도의 분포", x= "지진강도", y="빈도수")

# 계급의 수(기본 : 30개)

# 계급의 수 설정 : histogram 함수에 bins 속성에 계급수를 설정한다.

k = nclass.Sturges(quakes$mag)# Arguments는 quakes$mag가 된다.
# sturges공식 : 데이터의 계급 수(구간의 개수)를 결정하기 위한 공식이다.

# nclass.sturges()는 R 프로그래밍 언어에서 사용하는 함수 중 하나로, 
# Sturges의 공식을 기반으로 데이터의 계급 수를 계산하는 데 사용.
# 이 함수는 주어진 데이터의 크기(n)에서 적절한 계급 수를 결정.

# quakes$mag는 quakes 데이터셋에서 mag(진도) 열을 나타냄.

ggplot(data = quakes, aes(x = mag)) +
  geom_histogram(col = "black", fill = "pink", bins = k) +
  labs(title = "지진강도의 분포", x="지진강도", y="빈도수")

# 확률 밀도 그래프
ggplot(data = quakes, aes(x = mag)) +
  geom_histogram(aes(y=..density..),col = "black", fill = "pink", bins = k) +
  geom_density(alpha=0.2, fill="black")

# 박스 플롯
ggplot(data = quakes, aes(x = mag)) +
  geom_boxplot(col = "red", fill = "yellow") +
  labs(title = "지진강도의 분포", x="피지섬", y="지진강도")
