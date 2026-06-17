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

= 기말고사 과제 - 일반물리

#align(right)[*이름:* 최종찬]
#v(3em)

모든 문제에 대해: 중력가속도 $g = 10 "m/s"^2$

#v(3em)

#item(
  1,
  [용수철에 매달린 질량이 m인 물체를 마찰이 없는 평면에서 길어지는 방향으로
  10 cm 당긴 후에 놓아주었다. 이 물체는 좌-우로 왕복 운동을 하는데,
  주기는 0.5초이고 원점으로 돌아왔을 때의 속력은 1.5 m/s이다.
  운동 시작 후 0.2초 후의 #text(fill: blue)[변위와 속력]을 구하시오.],
  [

  풀이: 경계조건

  $
  x_0 &= 10 "cm" \
  v_0 &= 1.5 "m/s", x = 0 \
  T   &= 0.5 "s" \
  t   &= 0.2 "s"
  $

  #text(fill: blue, weight: "bold")[변위:]
  $
  x &= x_0 cos omega t \
    &= x_0 cos 2 pi t / T \
    &= 10 "cm" cos 0.8 pi \
    &= #text(fill: blue)[$-8.09 "cm"$]
  $

  #text(fill: blue, weight: "bold")[속력:]
  $
  v &= -x_0 omega sin omega t \
    &= -x_0 omega sin 2 pi t / T \
    &= -10 "cm" ((2 pi) / 0.5 "s") sin 2 pi t / T \
    &= -40 pi "cm/s" sin 2 pi t / T \
    &= #text(fill: blue)[$-73.9 "cm/s"$]
  $
  
  ]
)

#item(
  2,
  [일정한 속력의 파동에 대하여 파장이 2배 증가하는 경우,\
  #text(fill: blue)[진동수와 주기는 어떻게 달라지는가?]],
  [

    풀이:

    파동의 속력은 $v = lambda / T = lambda f$ 이므로,\
    파장이 두배($lambda' &= 2 lambda$)가 되면
    $
    f' &= #text(fill: blue)[$f / 2$] \
    T' &= 1 / f = #text(fill: blue)[$2 T$]
    $

    따라서 #text(fill: blue)[진동수는 절반이 되고, 주기는 2배가 됩니다.]

  ]
)

#item(
  3,
  [정지해있는 소방차의 사이렌이 200 Hz라면, 이 소방차가 시속 50 km/h로 나를 향해 달려올
때, #text(fill: blue)[내가 듣는 주파수]는 얼마인가?],
  [
    (음속은 $340"m/s"$라 가정)

    풀이: 도플러 효과 -- 파원이 관측자에게 접근하는 경우
    - 진동수 $f$의 소리, 관측자가 듣는 진동수 $f'$

    $
    v   &= 340 "m/s" \
    v_s &= 50 "km/h" \
        &= 13.9 "m/s" \
    n   &= (v t) / lambda = (v t - v_s t) / lambda \
    f   &= 200 "Hz" \
    f'  &= v / lambda' = f 1 / (1 - v_s / v) \
        &= 200 1 / (1 - 13.9 / 340) \
        &= #text(fill: blue)[$208.5 "Hz"$]
    $
  ]
)

#item(
  4,
  [아래 그림과 같이 전하 세 개가 놓여있다. \
  전하 $q_1$에 작용하는 #text(fill: blue)[힘의 크기와 방향]을 구하시오.\
  \
  #align(center)[#image("figure1.svg", width: 40%)]
  ],
  [
    풀이: 쿨롱의 법칙에 의해 $q_1$과 $q_2$은 부호가 다르므로 인력, \
    $q_1$과 $q_3$은 부호가 같으므로 척력 발생

    $
    k &= 1 / (4 pi epsilon_0) \
    epsilon_0 &= 8.854 times 10^(-12) C^2 / (N m^2) \
    k &= 8.988 times 10^9 (N m^2) / (C^2) approx 9.0 times 10^9 (N m^2) / (C^2) \
    F_(1,2) &= k (q_1 q_2) / r^2 approx 9.0 times 10^9 ((44 times 10^(-6))(15 times 10^(-6))) / (0.1^2) = 594"N" \
    F_(1,3) &= k (q_1 q_3) / r^2 approx 9.0 times 10^9 ((13 times 10^(-6))(15 times 10^(-6))) / (0.1^2) = 176"N" \
    F &= 594 + 176 = 770"N"
    $

    따라서 #text(fill: blue)[$770"N"$, 왼쪽]
  ]
)

#item(
  5,
  [x 축 상의 원점에 놓여있는 전하 $+1.5 times 10^(−9) C$이 놓여져 있다.
  이 전하로부터 거리 10 cm 떨어진 지점에서의 #text(fill: blue)[전기장의 세기와 방향]을 구하시오.\
  그리고 위에서 구한 #text(fill: blue)[전기장의 세기가 10%가 되는 지점]을 구하시오.],
  [
  풀이:

  $
  E &= F / q_0 = k Q / r^r \
    &= (9.0 times 10^9)(1.5 times 10^(-9)) / 0.1^2\
    &= #text(fill: blue)[$1350 "N/C"$] \
  $
  $+$전하이므로 #text(fill: blue)[원점에서 멀어지는 방향]

  전기장의 세기가 10%가 되는 지점은
  $
  k Q / r^r &= 1350 N times 0.1 \
  r^r &= 10 (0.1)^2 \
  r &= sqrt(10) times 0.1 approx #text(fill: blue)[$31.6 "cm"$]
  $
  ]
)

#item(
  6,
  [전자석의 N극과 S극 사이의 간격은 10 cm이다. \
  전자석이 만드는 자기장의 세기가 2.0 T일
때, 도선에 작용하는 힘이 5.0 N이라면 #text(fill: blue)[도선에 흐르는 전류]는 얼마인가?],
  [
    풀이: 전류에 작용하는 자기력

    $
    F = I L B sin theta arrow I = F / (L B sin theta) \
    I = 5 / ((0.1)(2.0)(sin pi / 2)) = #text(fill: blue)[$25"A"$]
    $
  ]
)

#item(
  7,
  [직선 도선에 15 A의 전류가 흐르는 경우, #text(fill: blue)[도선으로부터 2 m 떨어진 지점에서의 자기장]을
구하시오.],
  [
    풀이: 비오-사바르의 법칙

    $
    B &= k' (2 I) / d \
      &= (10^(-7) "N/A"^2)((2 dot 15"A") / (2.00 "m")) \
      &= #text(fill: blue)[$1.5 times 10^(-6)"T"$]
    $
  ]
)

#item(
  8,
  [자기장이 0.15 T인 전자석 안에 감은 수가 10이고 한 변의 길이가 0.05 m인 정사각형 코일이
자기장과 평행하게 놓여있다. 이 코일을 0.1초 동안에 자기장 밖으로 꺼낸다면, #text(fill: blue)[코일에 발생하는 기전력]은 얼마인가?],
  [
    풀이: 패러데이 전자기 유도 법칙
    
    $
    V &= - N (Delta Phi) / (Delta t) \
      &= - 10 (-3.75 times 10^(-4)) / 0.1 \
      &= 3.75 times 10^(-2) "V" \
      &= #text(fill: blue)[$0.0375 "V"$]
    $
  ]
)

#item(
  9,
  [강압 트랜스 중의 하나는 220 V를 110 V로 낮추는 변압기이다. 이 강압 트랜스의 1차 코일의
감은 수가 100일 때, 출력 전압을 110 V로 낮추려면 #text(fill: blue)[2차 코일의 감은 수]는 얼마여야 하는가?],
  [
    풀이: 변압기의 특성
    - 1차 코일: 전압 $V_1$, 감은 수 $N_1$
    - 2차 코일: 전압 $V_2$, 감은 수 $N_2$

    $
    V_1 / V_2 &= N_1 / N_2 \
    110 / 220 &= N_1 / 100 \
    N_2 &= #text(fill: blue)[$50"번"$]
    $
  ]
)

#item(
  10,
  [가정에서 사용하는 220 V, 1 kW 헤어 드라이기의 #text(fill: blue)[소모 전류]와 #text(fill: blue)[저항]을 구하시오.],
  [
    풀이:

    #text(fill: blue)[전류: $I = P / V = 1000/220 = 4.5"A"$]
    
    #text(fill: blue)[저항: $R = V / I = 220/4.5 = 49 Omega$]
  ]
)
