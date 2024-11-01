# 선그래프 애니메이션
# 선 그래프 : 시간에 따라 데이터의 변화 추이를 살필 때 사용

# 영업1팀의 6개월간 데이터를 data.frame에 저장

library(ggplot2)
library(gganimate)
month = c(1, 2, 3, 4, 5, 6)
sales = c(3, 3, 5, 6, 7, 2)
df1 = data.frame(부서 = "영업1팀", 월 = month, 매출 = sales)

# 영업2팀의 6개월간 데이터를 data.frame에 저장
sales = c(2, 2, 5, 9, 2, 4)
df2 = data.frame(부서 = "영업2팀", 월 = month, 매출 = sales)

# 행으로 df1과 df2를 연결
df = rbind(df1, df2)
df

# 선그래프그리기
anim = ggplot(data = df, aes(x = 월, y = 매출, group = 부서))+
  geom_line(aes(color = 부서), size = 2) +
  geom_point(aes(color = 부서), size = 5, alpha = 0.5)+
  labs(title = "부서별 월별 매출액", x = '월', y = "매출액(억원)")+
  transition_reveal(월)
# 선그래프 애니메이션 설정과 실행

animate(anim, width = 500, height = 400, duration = 10, renderer = gifski_renderer(loop = FALSE))
