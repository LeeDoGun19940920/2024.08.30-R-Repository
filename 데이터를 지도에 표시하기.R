install.packages("openxlsx")
install.packages("sf")
library(ggplot2)
library(openxlsx)
library(sf)

df = read.xlsx("C:/Users/Leedogun/Desktop/Rstudio workspace/행정경계데이터셋/국내지진목록.xlsx", sheet = 1, startRow = 4, colNames = FALSE)
head(df)

# x8열에서 북한으로 시작하는 데이터의 행번호 추출
idx = grep("^북한", df$X8)
# 북한 지역의 x8열의 데이터를 확인
df[idx, 'X8']
# x8열에 북한으로 시작하는 행 삭제
df = df[-idx,]

df

# df에 있는 6열과 7열의 데이터 중 N과 E를 삭제하는 방법
df[, 6] = gsub("N", "", df[,6])
df[,7] = gsub("E", "", df[,7])

# 6, 7열의 값을 숫자형으로 변환
df[,6] = as.numeric(df[,6])
df[,7] = as.numeric(df[,7])

# 행정경계지도와 지진분포 출력
# shapefile 읽어오기

map = st_read("C:/Users/Leedogun/Desktop/Rstudio workspace/행정경계데이터셋/Z_NGII_N3A_G0010000.shp")

# WGS84 좌표계로 변환
map = st_transform(map, crs = 4326)

# 포인트 데이터를 sf객체로 변환(포인트 출력)
df_sf = df%>%
  st_as_sf(coords = c("X7", "X6"), crs = 4326)

# 행정경계지도 출력
ggplot() +
  geom_sf(data = map, fill = "white", alpha = 0.5, color = "black")+
  # aesthetic mappings - x축과 y축 값, 색상, 모양, 크기 등 맵핑
  geom_sf(data = map, fill = "red", alpha = 0.5, color = "black")+
  theme(legend.position = "none")+
  labs(title = "지진분포", x = "경도", y = "위도")