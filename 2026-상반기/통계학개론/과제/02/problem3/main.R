# 모평균에 대한 검정
mu <- 12
barx <- 12.2
s <- 0.2
n <- 10
alpha <- 0.05

# t 통계량값
T <- (12.2 - 12) / (0.2 / sqrt(10)) # nolint
T # nolint

# 유의확률: 단측검정
PV <- 1 - pt(T, 9) # nolint
PV
if (PV < alpha) print("5% 유의수준에서 귀무가설 기각")
if (PV >= alpha) print("5% 유의수준에서 귀무가설 기각하지 못함")
