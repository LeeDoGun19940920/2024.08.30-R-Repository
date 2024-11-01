install.packages("ggplot2")
library(ggplot2)

# 영업팀의 1분기 실적을 저장(데이터프레임)
dept = c("영엽 1팀", "영업 2팀", "영업 3팀")
sales = c(12, 7, 9)
df1 = data.frame(부서 = dept, 매출 = sales, 분기 = "1분기") 
# df1 = data.frame(부서 = c("영엽 1팀", "영업 2팀", "영업 3팀")) 라고 적어도 부서 table에 값들이 들어가진다.
df1

# aesthetic == "심미적인" 즉, aes는 x축 y축 등 "미적 요소"라고 보면 된다.
ggplot(data = df1, aes(x = 부서, y = 매출)) +
  geom_bar(stat = "identity") + # stat = "identity"는 2차원 그래프를 쓰겠다는 의미이다.
  labs(title = "부서별 영업실적", x = "부서명", y = "매출(억원)")
