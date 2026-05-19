library(MASS)

# 1) library(MASS)를 이용하면 Cars93 데이터를 읽어들일 수 있다.
#    Cars93 데이터의 Manufacturer별(Acura Audi BMW 등) 빈도수를
#    tab이란 이름의 객체로 저장하시오.
tab <- table(Cars93$Manufacturer)

# 2) 위 1의 결과를 이용하여 Cars93 데이터의 Manufacturer별(Acura Audi BMW 등)
#    빈도수를 pie chart와 막대그림(barplot)으로 나타내시오.
pie(tab)
barplot(tab)

# 3) 위 1의 객체가 생성되었다고 할 때, 다음 조건을 충족하는 함수를 생성하시오.
#    * 함수이름은 plot학번뒷자리 형태로 생성 (자신의 학번 뒷자리)
#    * 그림종류는 파이챠트와 막대그림 등 두 종류 중 하나를 인수로 받음
#      하나의 함수에서 인수의 변경만으로 아래 차트를 출력하여야 함.
plot102304 <- function(type, data) {
  if (type == "pie") pie(data)
  else if (type == "bar") barplot(data)
}
# plot102304("pie", tab) # nolint
# plot102304("bar", tab) # nolint
