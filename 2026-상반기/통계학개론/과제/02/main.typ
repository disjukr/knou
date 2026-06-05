#set page(
  margin: (top: 20mm, bottom: 12mm, left: 12mm, right: 12mm),
)

#set text(
  font: "Noto Serif",
  size: 12pt,
  lang: "ko",
)

#show math.equation.where(block: true): set align(left)
#show math.equation.where(block: true): it => block(
  inset: (left: 2cm),
  it
)
#show raw.where(block: true): set text(size: 8pt)

#let item(title, body) = [
  #text(size: 14pt, weight: "bold")[#title]
  #table(
    columns: (1fr),
    stroke: 0.6pt + gray,
    inset: (top: 14pt, bottom: 14pt, left: 8pt, right: 8pt),
  )[#body]
]

#align(center)[
  #text(size: 20pt, weight: "bold")[
    \[프라임칼리지\]  통계학개론  -  2차  과제물
  ]
]

#v(14pt)

#align(right)[*이름:* 최종찬]

#v(18pt)

#item("문제 1. [7강. 표본분포 – 중심극한정리]", [
  표본 수 n이 작을 때 감마베타랑 베타분포는 어디 쏠려있는 등 비교적 아무렇게나 생겼고,\
  균등분포는 좀 넓게 퍼져있는걸 확인할 수 있습니다.

  n이 조금만 커져도(5) 균등분포와 베타분포는 금방 정규분포에 가까워지는걸 확인할 수 있고,\
  감마분포의 경우 표본 수가 커질 수록 점점 치우침이 줄어드는 것을 확인할 수 있습니다.

  n이 충분히 커지면(30) 전부 정규분포같이 생긴 것을 확인할 수 있습니다.

  #image("problem1/screenshot.png", height: 17cm)
  #align(center)[
    #image("problem1/clt_n2.png", height: 15cm)
    #image("problem1/clt_n5.png", height: 15cm)
    #image("problem1/clt_n10.png", height: 15cm)
    #image("problem1/clt_n30.png", height: 15cm)
  ]
])
#pagebreak()

#item("문제 2. [8강. 통계적 추정 I - 모평균의 구간 추정]", [
  *(1)*
  t 분포와 정규분포간에 차이가 거의 없어보입니다.\
  표본수가 적당히 크고 신뢰수준이 너무 높지 않기 때문인 걸로 보입니다.

  *(2)*
  위 95% 신뢰수준보다 신뢰구간이 더 크게 벌어진걸 확인할 수 있습니다.

  *(3)*
  신뢰구간이 표본 크기가 100명일 때보다 좁아진 것을 확인할 수 있습니다.

  #image("problem2/screenshot.png")
])
#pagebreak()

#item("문제 3. [10강. 통계적 가설검정 I - 모평균에 대한 가설검정]", [
  *(1)*
  - 귀무가설 ($H_0$): 평균 은행방문횟수가 12회 이하임 ($mu <= 12$)
  - 대립가설 ($H_1$): 평균 은행방문 횟수가 12회보다 큼 ($mu > 12$)

  *(2)*
  3.162278

  *(3)*
  PV(p-value)가 0.005753993이 나왔는데, 이 값은 유의수준 0.05보다 작은 값이므로 귀무가설을 기각합니다.\
  따라서 5% 유의수준에서 우리나라 전체 가구의 평균 은행방문횟수는 12회보다 크다고 볼 수 있습니다.

  #image("problem3/screenshot.png", height: 19cm)
])
#pagebreak()

#item("문제 4. [12강. 통계적 비교 I – 대응 표본에 대한 두 모집단 평균의 비교]", [
  p-value가 0.03841이고, 이 값은 유의수준 0.05보다 작은 값이므로 귀무가설을 기각합니다.\
  따라서 5% 유의수준에서 두 평가자 간 평가에 실제로 차이가 있다고 볼 수 있습니다.

  #image("problem4/screenshot.png")
])
