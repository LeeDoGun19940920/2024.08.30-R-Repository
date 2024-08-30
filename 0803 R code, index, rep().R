score = 70
score

score = c(70,88,75)
score

score[3] = c(70,88,75)
score

# 3장 데이터 구조
# 벡터 : 선형으로 1개 이상의 숫자 또는 문자열들을 저장가능
# 인덱스는 1번 부터 시작한다. c, java, python은 index number가 0부터 시작을 한다.
# 벡터에서 다수의 데이터를 저장하고자 할 때 c funtion을 사용한다.

score = 80
score = c(95, 78, 92)
score[2] = 88
score [4] = 100
score

# R Code에서 C Funtion은 Combine의 약어이다.
name = c("장발장", "팡틴", "코제트")
name

name[4] = "자베르"
name

# 연속적인 값들을 벡터에 지정

x1 = seq(0, 100, by = 10)
x1

x2 = 1:10
# x2 = seq(1, 10, by = 1)
x2

# 1씩 감소 시키는 sequence funtion.
x3 = 10:1
# x3 = seq(10, 1, by = -1)
x3

# 저장되는 값의 길이(개수)를 지정해서 동일하게 분배된 값을 저장
legth funtion 사용

# repeat funtion을 이용한 반복 함수 사용 = 전체적으로 3번 반복
x = c(1,2,3)
y = rep(x, times=4)
y

# repeat funtion을 이용한 반복 함수 사용 = 원소마다 순서대로 3번씩 반복
x = c(1, 2, 3)
y = rep(x, each = 3)
y