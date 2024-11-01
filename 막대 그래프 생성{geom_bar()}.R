# 4장 그래프

library(ggplot2) #ggplot2의 여러 함수들을 이용 하게 해주는 library function.
                  # install.packages("ggplot2") - library 함수 사용 이전에 install 우선 실행하기

# 데이터 저장(데이터 프레임)
dept = c("영업 1팀", "영업 2팀", "영업 3팀") 
# c function == 여러 데이터를 벡터 형태로 대입 할 때 사용 하는 function c()
sales = c(12, 5, 8)

# data.frame 은 테이블 형태로 적용 해주는 function
df1 = data.frame(부서 = dept, 매출 = sales, 분기 = "1분기")
df1

# 막대그래프(1. 그래프의 데이터 초기화, 2. 그래프의 모양설정, 3. 그래프의 제목과 라벨 설정)
ggplot(data = df1, aes(x =부서, y = 매출)) + 
  # aesthetic == "심미적인" 즉, aes는 x축 y축 등 "미적 요소"라고 보면 된다.
  geom_bar(stat = "identity") + 
  # stat = "identity"는 2차원 그래프를 쓰겠다는 의미이다.
  #_bar == 막대 그래프 형태태
  labs(title = "부서별 영업실적", x = "부서명", y = "매출(억원)")

# 막대에 자동색 지정
ggplot(data = df1, aes(x = 부서, y = 매출, fill = 부서)) +
  geom_bar(stat = "identity") +
  labs(title = "팀별 영업실적", x = "부서명", y = "매출(억원)")

# 자동 지정되는 색상 확인
install.packages("scales")
library(scales)
hex = hue_pal()(4) # hes_pal에 있는 색상들 중 자동으로 설정 되게 만들어 주는 function
show_col(hex)

# 막대에 동일한 색상으로 채우기 및 테두리선 색상 지정
ggplot(data = df1, aes(x = 부서, y = 매출)) +
  geom_bar(stat = "identity", fill = "magenta", color = "red") +
  labs(title = "팀별 영업실적", x = "부서명", y = "매출(억원)")

library(ggplot2)
# 그래프 내에 여러 색상으로 채우기 및 테두리선 색상 지정
ggplot(data = df1, aes(x = 부서, y = 매출)) +
  geom_bar(stat = "identity", fill = c("blue", "gold", "red"), color = "black")+
# fill = 그래프 내부 색깔
# color = 그래프 테두리 색깔
  labs(title = "그룹별 영업실적", x = "부서명", y = "매출(억원)")

# 막대에 레인보우 색상 중 눈에 잘 띄는 색상으로 자동 변경
ggplot(data = df1, aes(x = "부서", y = "매출"))+
  geom_bar(stat = "identity", fill = rainbow(3), color = "black")+
  labs(title = "팀별 영업실적", x = "부서명", y = "매출(억원)")

# gdRdriver, RcolorBrewer == 색상 팔레트를 제공하는 패키지
# 1. gdRdriver 패키지의 팔레트
x = rep(1, 12) # repeat fuction
pie(x, labels = seq(1, 12), col = rainbow(12))
pie(x, labels = seq(1, 12), col = heat.colors(12))
pie(x, labels = seq(1, 12), col = terrain.colors(12))
pie(x, labels = seq(1, 12), col = cm.colors(12))

# 2. RColorBrewer 패키지의 팔레트트
install.packages("RColorBrewer")
library("RColorBrewer") # == library(RColorBrewer)
display.brewer.all()

# 이전에 만든 데이터 "df1"에 "df2" 데이터를 추가로 작성해서 붙여주기
# 2분기 데이터 작성
dept = c("영업 1팀", "영업 2팀", "영업 3팀")
sales = c(10, 8 ,5)
df2 = data.frame(부서 = dept, 매출 = sales, 분기 = "2분기")

# df1과 df2 데이터를 rbind function을 이용해서 연결
df = rbind(df1, df2) # df1 데이터와 df2 데이터를 연결
df

library(ggplot2)
# 부서별 분기별 막대 그래프
ggplot(df, aes(x = 부서, y = 매출, fill = 분기))+
  geom_bar(stat = "identity")

# 부서별 분기별 막대그래프 작성
# 조건1: 3분기 실적을 추가, 조건2 : gdRdriver 패키지의 팔레트에 있는 색상으로 막대에 설정
# 조건3: 그래프 제목 == 부서별 분기별 영업 실적, x축 제목: 부서명, y축 제목: 영업매출(억원)

dept = c("영업 1팀", "영업 2팀", "영업 3팀")
sales = c(20, 17, 6)
df3 = data.frame(부서 = dept, 매출 = sales, 분기 = "3분기")

df = rbind(df1, df2, df3)
df

ggplot(df, aes(x = 부서, y= 매출, fill = 분기)) +
  geom_bar(stat = "identity")+
  # scale_fill_manual(values = c("red", "pink", "magenta"))+
  scale_fill_manual(values = cm.colors(3))+
  labs(title = "부서별 영업실적", x = "부서명", y = "영업매출(억원)") # labs == labels

# 묶은세로 막대 그래프
ggplot(df, aes(x = 부서, y= 매출, fill = 분기)) +
  geom_bar(stat = "identity", position = "dodge")+ 
  # position = "dodge" == 그래프가 하나의 선이 아닌, 분기 마다 구분 지어진 그래프로 생성
  scale_fill_manual(values = cm.colors(3))+
  labs(title = "부서별 영업실적", x = "부서명", y = "영업매출(억원)") # labs == labels

# 직전에 실행된 그래프를 사진 파일로 저장. ggsave()
ggsave("C:/Temp/graph1.png", width = 10, height = 13, units = "cm")