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

#let item(title, body) = [
  #text(size: 14pt, weight: "bold")[#title]
  #table(
    columns: (1fr),
    stroke: 0.6pt + gray,
    inset: (top: 14pt, bottom: 14pt, left: 8pt, right: 8pt),
  )[#body]
  #pagebreak()
]

#align(center)[
  #text(size: 20pt, weight: "bold")[
    \[프라임칼리지\]  통계학개론  -  1차  과제물
  ]
]

#v(14pt)

#align(right)[*이름:* 최종찬]

#v(18pt)

#item("문제 1. [3강.  데이터  수치요약]", [
  평균: 84.5, 중앙 85, 최소: 68, 최대: 98 입니다.\
  85점 근처에 값이 몰려있고, 중앙값이 어느 한쪽에 쏠려있지 않은 것 같습니다.\
  이상치는 보이지 않습니다.
  #image("problem1/screenshot.png")
  #rect(
    width: 100%,
    height: 8.5cm,
    stroke: none
  )[
    #align(center)[
      #grid(
        columns: (1fr, 1fr),
        gutter: 5pt,
        image("problem1/plot1.png"),
        image("problem1/plot2.png"),
      )
    ]
  ]
])

#item("문제 2. [3강.  데이터  수치요약]", [
  값들이 오른쪽으로 약간 쏠려있고,
  550-600 ppm 구간 근처에 몰려있는걸 확인할 수 있습니다.\
  이상치는 보이지 않습니다.
  #image("problem2/screenshot.png")
  #align(center)[
    #image("problem2/plot.png", height: 10cm)
  ]
])

#item("문제 3. [6강. 확률분포]", [
  
  풀이 1.
  $
    P(X>=550) \
    = 1 - P(X<550) \
    = 1 - "pnorm"(550, "mean"=500, "sd"=30) \
    = 0.0478
  $

  풀이 2. $
    P(X>=550) \
    = P((X-500)/30 >= (550-500)/30) \
    = P(Z>=1.6667) \
    = 1 - P(Z<1.6667) \
    = 1 - 0.9522 \
    = 0.0478
  $

  #image("problem3/screenshot.png")
])

#item("문제 4. [7강. 표준분포]", [
  //
])
