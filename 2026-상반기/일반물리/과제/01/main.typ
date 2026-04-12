#set text(font: "Noto Serif", size: 12pt, lang: "ko")
#show math.equation: set text(size: 14pt)

#let item(n, problem, body) = [
  #block(breakable: false)[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 0.8em,
      row-gutter: 0.4em,
      align(left)[
        #set text(size: 13pt, weight: "bold")
        #n.
      ],
      [
        #set text(size: 13pt, weight: "bold")
        #problem
        
        #v(0.6em)
    
        #set text(size: 12pt, weight: "regular")
        #body
      ],
      v(1.2em)
    )
  ]
]

= 중간고사 과제 - 일반물리

#align(right)[*이름:* 최종찬]
#v(3em)

모든 문제에 대해: 중력가속도 $g = 10 "m/s"^2$

#v(3em)

#item(
  1,
  [어떤 사람이 북쪽으로 100 km, 동쪽으로 200 km, 남쪽으로 100 km \
  움직이는데 총 5시간이 걸렸다. 이 사람의 #text(fill: blue)[평균 속력]과
  #text(fill: blue)[평균 속도]를 구하여라.],
  [

  움직인 거리:
  $
  s = 100 + 200 + 100 = 400
  $

  움직인 시간:
  $
  t = 5
  $

  #text(fill: blue, weight: "bold")[
    평균 속력:
    $
    s / t = 400 / 5 = 80 "km/h"
    $
  ]

  변위:
  $
  Δ x = x_f - x_i = 200 "km"
  $

  #text(fill: blue, weight: "bold")[
    평균 속도:
    $
    overline(v) = (Δ x) / (Δ t) = 200 / 5 = 40 "km/h"
    $
  ]
  
  ]
)

#item(
  2,
  [10 m 높이의 절벽에서 초기 속도 20 m/s의 속도로 수평 방향으로 던져진 \
  공이 있다. 이 공이 떨어질 때까지 수평 방향으로 날아간 #text(fill: blue)[거리]는 얼마인가?],
  [

    풀이: 초기 조건과 운동 방정식

    $
    x = v_(0,x) t quad y = y_0 + 1/2 a_y t^2 \
    "where" v_(0,x) = 20, y_0 = 10, a_y = -10
    $

    $y$ 성분에서 물체가 완전히 낙하하는 시간 $t$ 구하기

    $
    y &= 0 \
      &= 10 - 1/2 dot 10 dot t^2 \
    t &= sqrt(2) "s"
    $

    $x$ 성분에서 최종 변위 구하기

    $
    x &= 20 t\
      #text(fill: blue)[
        $&= 20 sqrt(2) ≈ 28.3 "m"$
      ]
    $
  ]
)

#item(
  3,
  [ 지상 5 m 위치에 있는 대포로부터 수평 방향 45° 각도로 포탄이 발사된다.\
  초기 속도는 30 m/s이다. 이 포탄의 낙하 지점 까지의 #text(fill: blue)[거리]는 얼마인가?],
  [
    풀이: 초기 속도 벡터의 성분
    $
    v_(0,x) = ||bold(upright(v))_0|| cos 45 degree = 15 sqrt(2) "m/s" \
    v_(0,y) = ||bold(upright(v))_0|| sin 45 degree = 15 sqrt(2) "m/s"
    $

    $y$ 성분으로부터 낙하 시간 $t$ 구하기

    $
    y &= 0 \
      &= y_0 + v_(0,y) t + 1 / 2 a_y t^2 \
      &= 5 + 15 sqrt(2) t - 5 t^2 \

    t &= (3 sqrt(2) + sqrt(22)) / 2 ≈ 4.47 "s"
    $

    낙하 시간 $t$를 이용해 수평 이동 거리 구하기

    $
    x &= v_(0,x) t \
      &= 15 sqrt(2) dot ((3 sqrt(2) + sqrt(22)) / 2) \
      #text(fill: blue)[
        $&= 15 sqrt(2) dot 4.47 ≈ 94.82 "m"$
      ]
    $
  ]
)

#item(
  4,
  [아래 그림에서 M = 10 kg, m = 5 k일 때의 #text(fill: blue)[가속도]를 구하시오.

  #align(center)[#image("figure1.svg", width: 40%)]
  ],
  [
    풀이: $M$의 관점에서

    $
    T = M a
    $

    $m$의 관점에서

    $
    m g - T = m a
    $

    정리하면

    $
    a &= m / (M + m) g\
    &= 5 / (10 + 5) dot 10\
    #text(fill: blue)[
      $&= 50 / 15 = 10 / 3 ≈ 3.33 "m/s"^2$
    ]
    $
  ]
)

#item(
  5,
  [용수철 상수가 210 N/m인 용수철을 0.5 m 잡아당기기 위해 \
  필요한 #text(fill: blue)[일]의 양은?],
  [
  풀이:
  $
  W = 1 / 2 k x^2 = 1 / 2 dot 210 dot (0.5)^2
  #text(fill: blue)[$= 26.25 J$]
  $
  ]
)

#item(
  6,
  [투수가 던진 야구공을 타자가 방망이로 타격한다. 공의 질량은 0.15 kg이고 \
  충돌 전 속력은 20 m/s, 충돌 후 속력은 반대 방향으로 60 m/s이다. \
  배트와 공의 접촉 시간이 0.003초이면 배트가 공에 작용한 #text(fill: blue)[평균력]은 \
  얼마인가?],
  [
    풀이:

    $
    p_1 &= 0.15 dot (-20) = -3 "kg" dot "m/s" \
    p_2 &= 0.15 dot (+60) = 9 "kg" dot "m/s" \
    Δ p & = p_2 - p_1 = 9 - (-3) = 12 "kg" dot "m/s"
    $

    운동량의 변화량 = 충격량

    $
    Δ p &= 12 "kg" dot "m/s" = overline(F) Δ t \
    Δ t &= 0.003 "s" \
    12 &= overline(F) dot 0.003 \
    #text(fill: blue)[
      $overline(F) &= 12 / 0.003 = 4000 "N"$
    ]
    $
  ]
)

#item(
  7,
  [질량 35 g의 탄환이 탄동 진자를 구성하는 질량 10 kg의 통나무에 박힌 후, \
  이 통나무가 12 cm 상승하였다. 이 탄환의 #text(fill: blue)[속도]를 구하시오.],
  [
    탄환의 질량 $m = 0.035 "kg"$ \
    통나무의 질량 $M = 10 "kg"$ \
    상승 높이 $h = 0.12 "m"$
    
    운동량 보존
    
    $
    p_1 = m v_b quad p_2 = (m + M) v_a \
    m v_b = (m + M) v_a
    $

    운동 에너지 #sym.arrow 위치 에너지

    $
    1/2 (m + M) v_a^2 &= (m + M) g h
    $
    $
    v_a^2 &= 2 g h \
    v_a &= sqrt(2 g h) \
    &= sqrt(2 dot 10 dot 0.12) ≈ 1.55 "m/s"
    $

    정리하면

    $
    m v_b &= (m + M) v_a \
    v_b &= ((m + M) / m) v_a \
    v_b &= ((m + M) / m) sqrt(2 g h) \
    &= ((10.035) / 0.035) dot 1.55 #text(fill: blue)[
      $≈ 444 "m/s"$
    ]
    $
  ]
)

#item(
  8,
  [자동차가 주행 중에 브레이크를 밟아서 감속을 한다. 브레이크가 작용하기 전 \
  바퀴의 각속도는 60 rad/s인데, 5초 동안 브레이크가 작동을 해서 40 rad/s의 \
  각속도로 느려지게 되었다. 바퀴의 반지름이 30 cm일 때, #text(fill: blue)[평균 각가속도]와 \
  #text(fill: blue)[회전 각도] 그리고 #text(fill: blue)[진행 거리]를 구하시오.],
  [

    초기 각속도 $ω_0 = 60 "rad/s"$ \
    최종 각속도 $ω = 40 "rad/s"$ \
    시간 $t = 5 "s"$ \
    바퀴의 반지름 $r = 30 "cm" = 0.3 "m"$

    #text(fill: blue, weight: "bold")[평균 각가속도:]

    $
    α = (Δ ω) / (Δ t) = (40 - 60) / 5
    #text(fill: blue)[
      $= -4 "rad/s"^2$
    ]
    $

    #text(fill: blue, weight: "bold")[회전 각도:]

    $
    θ_0 &= 0 \
    θ &= ω_0 t + 1 / 2 α t^2 \
    &= 60 dot 5 + 1 / 2 dot (-4) dot 5^2 \
    #text(fill: blue)[
      $
      &= 250 "rad"
      $
    ]
    $

    #text(fill: blue, weight: "bold")[진행 거리:]

    $
    l &= r θ \
    &= 0.3 dot 250
    #text(fill: blue)[
      $&= 75 "m"$
    ]
    $
  ]
)

#item(
  9,
  [자동차 하나가 시속 60 km/h로 지름이 100 m인 원형 트랙을 따라서 달리고 \
  있다. 이 때, 이 자동차가 원형 트랙 중심으로 향하는 #text(fill: blue)[구심 가속도]는 얼마인가?],
  [
    풀이:

    $
    v = 60 "km/h" = (60000 "m") / (3600 "s") = 16.7 "m/s"
    $

    $
    a = v^2 / r = 16.7^2 / 50
    #text(fill: blue)[$≈ 5.6 "m/s"^2$]
    $
  ]
)

#item(
  10,
  [팔을 펴고 회전하는 피겨스케이팅 선수가 팔을 오므리면 관성 모멘트가 \
  처음의 3/4로 감소한다. 팔을 펴고 초 당 1.5 회전을 하던 선수가 \
  팔을 오므리면 각속도는 #text(fill: blue)[어떻게 달라지는가]?],
  [
    초기 관성모멘트 $I_i$ \
    최종 관성모멘트 $I_f = 3/4 I_i$ \
    초기 회전수 $f = 1.5$

    $
    I_i ω_i &= I_f ω_f \
    ω_f &= I_i / I_f ω_i \
    &= I_i / (3/4 I_i) ω_i \
    &= #text(fill: blue)[$4 / 3$] ω_i
    $

    $
    ω_i &= 2 pi f \
    &= 2 pi dot 1.5 = 3 pi "rad/s" \
    ω_f &= #text(fill: blue)[$4 / 3$] dot 3 π = 4 π "rad/s"
    $

    #text(fill: blue)[$4 / 3$배가 됩니다.]
  ]
)
