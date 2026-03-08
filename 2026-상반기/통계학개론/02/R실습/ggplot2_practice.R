# 범주형 자료를 다루기 편하도록 forcats를 불러옵니다.
# ggplot2는 그래프를 그리는 핵심 패키지입니다.
library(forcats)
library(ggplot2)

# 학생들의 주된 이동수단 예시 자료입니다.
# 같은 값이 여러 번 반복되므로 범주형 자료의 빈도를 살펴보기에 좋습니다.
transp <- c(
  "bicycle", "bus", "bus", "walking", "bus", "bicycle", "bicycle",
  "bus", "bus", "bus", "bicycle", "bus", "bicycle", "bicycle", "walking",
  "bus", "bus", "bicycle", "bicycle", "walking", "walking",
  "bicycle", "bus", "bus", "bus", "bus", "bicycle",
  "bus", "bus", "bicycle", "bicycle", "bicycle"
)

# 벡터를 데이터프레임으로 바꾸면 ggplot2에서 다루기 편합니다.
# dat1에는 transp라는 열 1개가 들어 있습니다.
dat1 <- data.frame(transp)

# 막대그래프:
# aes()는 aesthetics의 줄임말로,
# "어떤 데이터를 그래프의 어떤 시각 요소에 연결할지"를 정하는 부분입니다.
# 여기서는 aes(x = ...) 이므로 x축에 어떤 값을 놓을지 지정한 것입니다.
# 즉, transp 자료를 x축의 범주로 사용하겠다는 뜻입니다.
#
# geom_bar()는 범주별 개수를 자동으로 세어서 막대 높이를 정합니다.
# 그래서 y값을 따로 쓰지 않아도 막대그래프가 만들어집니다.
#
# fct_infreq()는 forcats 패키지 함수로
# factor in frequency order, 즉 "빈도가 큰 순서대로 범주 순서를 재배열"합니다.
# 예를 들어 bicycle이 가장 많이 나오고 walking이 가장 적게 나오면,
# 그래프의 x축도 그 순서에 맞춰 정렬되어 비교가 쉬워집니다.
# 그냥 transp를 쓰면 보통 문자 순서 또는 기존 순서로 보일 수 있지만,
# fct_infreq(transp)를 쓰면 "많이 나온 범주부터" 보이게 됩니다.
ggplot(data = dat1) + geom_bar(mapping = aes(x = fct_infreq(transp))) +
  xlab("Transportation")

# 비만도 범주의 순서를 명시적으로 지정합니다.
# factor()를 쓰면 문자형 자료를 순서가 있는 범주형 자료로 만들 수 있습니다.
obesity <- factor(
  c("underweight", "normal", "overweight", "obese"),
  levels = c("underweight", "normal", "overweight", "obese")
)

# 각 비만도 범주의 인원수(count)와 비율(perc)을 계산합니다.
# perc는 전체 인원 대비 백분율입니다.
count <- c(6, 69, 27, 13)
perc <- count / sum(count) * 100

# 이미 요약된 자료이므로 범주, 도수, 백분율을 한 데이터프레임으로 묶습니다.
dat2 <- data.frame(obesity, count, perc)

# 막대그래프:
# 여기의 aes(x = obesity, y = perc)는
# obesity를 x축 범주에 놓고, perc를 막대 높이(y축 값)로 쓰겠다는 뜻입니다.
# 즉 aes() 안에서 x와 y가 각각 무엇을 의미하는지 연결해 주는 것입니다.
#
# 이번에는 각 범주의 개수를 직접 세는 것이 아니라,
# 이미 계산된 perc 값을 막대 높이로 사용합니다.
# 그래서 stat = "identity"를 지정해야 합니다.
# stat = "identity"는 "이미 있는 y값을 그대로 사용하라"는 뜻입니다.
ggplot(data = dat2) + geom_bar(
  mapping = aes(x = obesity, y = perc),
  stat = "identity"
) + xlab("Obesity") + ylab("Percentage(%)")

# table(transp)는 각 이동수단이 몇 번씩 나왔는지 세어 줍니다.
# 아래 dat3의 count 값이 맞는지 확인할 때 사용할 수 있습니다.
table(transp)

# 원그래프를 그리기 위한 요약 자료입니다.
# transportation은 범주 이름, count는 각 범주의 빈도입니다.
dat3 <- data.frame(
  transportation = c("bicycle", "bus", "walking"),
  count = c(15, 13, 4)
)

# 원그래프:
# 먼저 막대그래프를 만든 뒤 coord_polar()로 극좌표계로 바꿉니다.
# aes(x = "", y = count, fill = transportation)에서
# x = ""는 모든 값을 하나의 막대 위치에 모으기 위한 설정입니다.
# 이렇게 해야 막대 하나가 원형으로 변환되어 원그래프처럼 보입니다.
# y = count는 각 조각의 크기를 count에 비례하게 만듭니다.
# fill = transportation은 범주별로 색을 다르게 지정하라는 뜻입니다.
# 즉 aes()는 여기서도 "count는 크기", "transportation은 색 구분"으로 연결하는 역할을 합니다.
ggplot(data = dat3) + geom_bar(
  mapping = aes(x = "", y = count, fill = transportation),
  stat = "identity"
) + coord_polar("y", start = 0) + xlab("") + ylab("") +
  theme(
    # 원그래프에서는 축과 격자가 필요 없으므로 제거합니다.
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    panel.grid = element_blank()
  )
