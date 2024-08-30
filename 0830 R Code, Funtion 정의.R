a = 7;
b = 10;
arr = 1:1000;
sum(arr);
mean(arr);
max(arr);
min(arr);

pkg = installed.packages()
.libPaths()

# 데이터셋 종류 확인
data(package="datasets")

# 직사각형의 면적을 구하는 함수 정의
w = 20
h = 35

getRectangleArea(w,h)

getRectangleArea = function(w, h) {
  area = w*h
  
  return(area)
}