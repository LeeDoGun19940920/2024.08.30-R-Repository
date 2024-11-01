# 선형 그래프: 시간에 따른 데이터의 추이를 살펴볼 때 사용

# 영업1팀의 6개월간 데이터를 data.frame에 저장

library(ggplot2)
month = c(1, 2, 3, 4, 5, 6)
sales = c(3, 3, 5, 6, 7, 2)
df1 = data.frame(부서 = "영업1팀", 월 = month, 매출 = sales)

# 영업2팀의 6개월간 데이터를 data.frame에 저장
sales = c(2, 2, 5, 9, 2, 4)
df2 = data.frame(부서 = "영업2팀", 월 = month, 매출 = sales)

# 행으로 df1과 df2를 연결
df = rbind(df1, df2)
df

# 선형그래프 그리기
library(ggplot2)

# 영업1팀을 선형그래프로 표현
ggplot(data = df1, aes(x = 월, y = 매출, group = 부서))+ # graph에 대한 default 값 추가
  geom_line()+
  labs(title = "월별 매출") # 그래프에서 해당되는 부분의 이름 변경

ggplot(data = df2, aes(x = 월, y = 매출, group = 부서))+ # graph에 대한 default 값 추가
  geom_line(color = "green", size = 2)+
  geom_point(color = "red", size = 3)+
  labs(title = "월별 매출") # 그래프에서 해당되는 부분의 이름 변경

ggplot(data = df, aes(x = 월, y = 매출, group = 부서, color = 부서))+ # graph에 대한 default 값 추가
  geom_line(color = cm.colors(12), size = 2)+
  geom_point(color = cm.color(12), size = 3)+
  labs(title = "월별 매출") # 그래프에서 해당되는 부분의 이름 변경

# 산포도 : 점으로 데이터의 변화를 확인
women
ggplot(data = women, aes(x = height, y = weight))+
  geom_point()+
  labs(title = "미국 30 ~ 39세 여성의 키와 몸무게의 상관관계", x = "키(inch)", y = "체중(pound)")

ggplot(data = women, aes(x = height, y = weight))+
  geom_point(shape = 23, color = "tomato", size = 10)+ # 점에 속성을 지정해서 적용
  labs(title = "미국 30 ~ 39세 여성의 키와 몸무게의 상관관계", x = "키(inch)", y = "체중(pound)")
