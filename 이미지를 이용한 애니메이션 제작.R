#그림애니메이션: 양국

# magick: png file을 읽어와서 사용하기 위한 벙법
install.packages("magick")
library(magick)

# 스크립트와 동일 폴더에 있는 이미지를 읽어오기
# 이미지 파일 확장자와 동일해야 한다.
bg = image_read("C:/Users/Leedogun/Desktop/Rstudio workspace/arrow_img/background.png")
target = image_read("C:/Users/Leedogun/Desktop/Rstudio workspace/arrow_img/target.png")
arrow = image_read("C:/Users/Leedogun/Desktop/Rstudio workspace/arrow_img/arrow.png")

bg
target
arrow

bg = image_scale(bg, "600x300!")
target = image_scale(target, "80x170!")
arrow = image_scale(arrow, "100x25!")


bg
target
arrow

# 이미지 회전
arrow = image_rotate(image_background(arrow, "none"), -11)
arrow

# 이미지합성:배경 + 과녁판
bg2 = image_composite(bg, target, offset = geometry_point(450, 80))
# target이 bg 이미지에서의 위치를 설정해주는 방법 offset = geometry_point(x, y)
# 구성하는 이미지 갯수는 2개가 가능하다. 
bg2


# 화살 위치 초기화
x=0
y=220

# 반복문을 사용하여 화살이 움직이는 애니메이션 설정
# 반복문이 수행될 때마다 x축의 값은 20 증가시키고 y축의 값은 -4
while(TRUE) {
  # 화살이미지 위치 (x, y)
  position = geometry_point(x, y)
  
  # 이미지 합성: bg2(배경 + 과녁판) + arrow(화살)
  img = image_composite(bg2, arrow, offset = position)
  print(img)
  #함수 내에서의 출력: 함수 내부에서는 변수명을 입력하는 것만으로는 그 값을 출력하지 않는다.
  #이는 함수의 설계 방식 때문이다.
  #함수 내에서는 사용자가 명시적으로 출력을 원할 경우 print() 함수를 사용해야 한다.
  
  Sys.sleep(0.1)
  
  # x축의의 값이 400이 되면 반복문 빠져나가는 설정
  if(x == 400)
    break;
  
  if(x < 400){
    x = x + 20
    y = x - 4.5
    }
    else{
      x = x + 20
      y = y-4
    }
}