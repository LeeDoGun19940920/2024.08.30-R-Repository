# 연산자

# 산술 연산자
# ^ == 거듭제곱 연산자

10^3

a = 5
b = 5

r1 = a^b
r1

x = c(10, 20 ,30, 40)
y = c(1, 6, 11)
w = c(100, 200)

x+5
a=x+5
y-5
w*2

print(a)
x+y 
# result == 11 26 41 41, index 갯수가 적은 곳을 반복 시켜 놓는다.
# y[4]는 없기 때문에, x[4]의 40은 y[1]인 1과 더하게 된다.

# 비교연산자 : 비교연산의 결과는 논리값 TRUE, FALSE로 결과가 나타난다.
a = 7
b = 10

c = a > b
print(c)

x = c(10, 20 ,30)
x <= 10

# 벡터에 있는 원소 값들 중에 결과가 True 인 값이 하나라도 있을 경우,
# 비교 연산의 결과값은 TRUE이다. 
# TRUE가 없을 경우 FALSE이다.
any(x <= 10)

# 벡터에 있는 요소의 값들이 비교연산 결과에 true가 되어야 결과는 TRUE
# 비교 하였을 때 결과값들이 전부 TRUE 이어야만 결과도 TRUE
all(x <= 10)

# x에 대입된 index value들과 비교를 해서 조건에 해당되는 값들을 반환
x[x >= 20]

x = c(TRUE, FALSE, TRUE, FALSE)
y = c(FALSE, FALSE, TRUE, TRUE)

x|y
xor(x, y)
!x

# NA(Not Available(결측치):누락된 경우)
# NULL(변수를 선언하고 초기화하지 않았을 때, 변수에 대입된 값이 아무것도 없을 때)
# Inf(Infinity: 0이 아닌 숫자를 0으로 나누었을 때)
# NaN(Not a Number: 0을 0으로 나누었을 때)

z = NULL
is.null(z)

k
is.null(k)
# 변수에 아무것도 넣지 않을경우 NULL값을 확실히 입력 해주어야 한다. NULL값은 무조건 대문자
# 초기화를 하지 않는 다는 것을 확실히 명시 해주어야 한다. *다른 프로그램과의 차이점

y = c(1, 2, 3, NA, 5)
y

z = 5/0
z

t = 0/0
t

# 요인(factor)
# factor()는 R에서 범주형(categorical) 데이터를 처리할 때 사용하는 함수이다.
# 데이터 내에서 고유한 값들을 "수준(levels)"으로 정의하여 데이터를 범주형으로 변환한다.
# 중복된 데이터를 통합하여 대표값을 출력하는 용도가 아닌, 추상형태로 출력하는 것이다.

gender = c("여", "남", "남", "여", "여", "남", "남", "여")
gender

gender.factor = factor(gender)
gender.factor

data <- c("apple", "banana", "orange", "banana", "apple", "apple")
factor_data = factor(data)
factor_data